source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/twilio/cocoapod-specs'

def pods

# Utilities
pod 'PromiseKit'

# Extensions
pod 'EZSwiftExtensions'

# Networking
pod 'Alamofire', '4.0.0'

pod 'Sync', '~> 2'

pod 'EZSwipeController', :git => 'git@github.com:pattogato/EZSwipeController.git', :branch => 'bugfix/swift-3-fixes'

pod 'SwiftyJSON', :git => 'https://github.com/appsailor/SwiftyJSON.git', :branch => 'swift3'

pod 'PhoneNumberKit', :git => 'git@github.com:marmelroy/PhoneNumberKit.git', :branch => 'swift3.0'

# swift integration
use_frameworks!

# who cares about warnings
inhibit_all_warnings!

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end

end

target 'GateKeeper' do
    pods
end
