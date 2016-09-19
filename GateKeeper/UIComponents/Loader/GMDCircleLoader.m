//
//  GMDCircleLoader.m
//
// Copyright (c) 2014 Gabe Morales
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "GMDCircleLoader.h"
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )

#pragma mark - Interface
@interface GMDCircleLoader ()
{
    NSTimer *timer;
}
@property (nonatomic, strong)  UIImageView *img;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, assign) BOOL isSpinning;
@end

@implementation GMDCircleLoader

//-----------------------------------
// Add the loader to view
//-----------------------------------

+ (GMDCircleLoader *)setOnView:(UIView *)view withTitle:(NSString *)title animated:(BOOL)animated
{
   
    [GMDCircleLoader hideFromView:view animated:true];
    
    GMDCircleLoader *hud = [[GMDCircleLoader alloc] initWithFrame:GMD_SPINNER_FRAME];
    hud.layer.cornerRadius = 15.0f;

    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:GMD_SPINNER_FRAME];
    
    CGRect frame = logoImageView.frame;
    frame.size.height = 23;
    frame.size.width  = 85;
    frame.origin.x = 7;

    frame.origin.y = 100-33;
    logoImageView.frame = frame;
    
    logoImageView.image = [UIImage imageNamed:@"Gatekeeper"];
    [hud addSubview:logoImageView];
    hud.userInteractionEnabled = false;
    [hud start];
    
    float height = view.frame.size.height;
    float width  = view.frame.size.width;
    CGPoint center = CGPointMake(width/2, height/2);
    hud.center = center;
    [view addSubview:hud];
    [view bringSubviewToFront:hud];
    
    return hud;
}

//------------------------------------
// Hide the leader in view
//------------------------------------
+ (BOOL)hideFromView:(UIView *)view animated:(BOOL)animated {

    GMDCircleLoader *hud = [GMDCircleLoader HUDForView:view];
    [hud stop];
    if (hud) {
        [hud removeFromSuperview];
        return YES;
    }
    return NO;
}

//------------------------------------
// Perform search for loader and hide it
//------------------------------------
+ (GMDCircleLoader *)HUDForView: (UIView *)view {
    GMDCircleLoader *hud = nil;
    NSArray *subViewsArray = view.subviews;
    Class hudClass = [GMDCircleLoader class];
    for (UIView *aView in subViewsArray) {
        if ([aView isKindOfClass:hudClass]) {
            hud = (GMDCircleLoader *)aView;
        }
    }
    return hud;
}

#pragma mark - Initialization
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setup];
    }
    return self;
}


#pragma mark - Setup
- (void)setup {
   
    self.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:96.0/255.0 blue:160.0/255.0 alpha:1.0];
    self.layer.cornerRadius = 1.0;
    self.clipsToBounds = YES;
    //---------------------------
    // Set line width
    //---------------------------
    _lineWidth = GMD_SPINNER_LINE_WIDTH;
    
    //---------------------------
    // Round Progress View
    //---------------------------
    self.backgroundLayer = [CAShapeLayer layer];
    _backgroundLayer.strokeColor = GMD_SPINNER_COLOR.CGColor;
    _backgroundLayer.fillColor = self.backgroundColor.CGColor;
    _backgroundLayer.lineCap = kCALineCapRound;
    _backgroundLayer.lineWidth = _lineWidth;
    [self.layer addSublayer:_backgroundLayer];
    
    
}

- (void)drawRect:(CGRect)rect {
    //-------------------------
    // Make sure layers cover the whole view
    //-------------------------
    _backgroundLayer.frame = self.bounds;
}

#pragma mark - Drawing

- (void)drawBackgroundCircle:(BOOL) partial {
    CGFloat startAngle = - ((float)M_PI / 2); // 90 Degrees
    CGFloat endAngle = (2 * (float)M_PI) + startAngle;
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius = (self.bounds.size.width - _lineWidth)/2;
    
    //----------------------
    // Begin draw background
    //----------------------
    
    UIBezierPath *processBackgroundPath = [UIBezierPath bezierPath];
    processBackgroundPath.lineWidth = _lineWidth;
    
    //---------------------------------------
    // Make end angle to 90% of the progress
    //---------------------------------------
    if (partial) {
        endAngle = (1.8f * (float)M_PI) + startAngle;
    }
    [processBackgroundPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    _backgroundLayer.path = processBackgroundPath.CGPath;
}

#pragma mark - Spin
- (void)start {
    self.isSpinning = YES;
    
  //  [self drawBackgroundCircle:YES];
    
//    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
//    rotationAnimation.duration = 1;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = HUGE_VALF;
//    [_backgroundLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    self.img = [[UIImageView alloc] initWithFrame:GMD_SPINNER_IMAGE];
    self.img.image = GMD_IMAGE;
    self.img.center = CGPointMake(CGRectGetMidX(self.img.frame)+24, CGRectGetMidY(self.img.frame)+7);
    [self addSubview:self.img];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(rotate:) userInfo:nil repeats:YES];
    [timer fire];


}
-(void)rotate:(id)timer
{
    CGAffineTransformRotate(self.img.transform, 3);
    self.img.transform =  CGAffineTransformRotate(self.img.transform, degreesToRadians(3));
    
}
- (void)stopIntractingtoSuperView {
    NSLog(@"Do nothing");
}
- (void)stop
{
    [self drawBackgroundCircle:NO];
    [timer invalidate];
    [_backgroundLayer removeAllAnimations];
    self.isSpinning = NO;
}


+ (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   
    NSData *imageData = [[NSData alloc] initWithData:UIImageJPEGRepresentation((newImage), 0.0)];
    
    UIImage *downsampledImaged = [UIImage imageWithData:imageData];
    
    //long imageSize = imageData.length;
    // NSLog(@"SIZE OF IMAGE: %li ", imageSize);
    //NSLog(@"width : %f height : %f",newImage.size.width,newImage.size.height);
    return downsampledImaged;
}

@end
