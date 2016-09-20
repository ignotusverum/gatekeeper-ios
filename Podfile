source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/twilio/cocoapod-specs'

def pods

# Utilities
pod 'PromiseKit'

# Extensions
pod 'EZSwiftExtensions', :git => 'git@github.com:ShiWeiCN/EZSwiftExtensions.git', :branch => 'jes-Swift3'

# Networking
pod 'Alamofire'

#pod 'EZSwipeController', :git => 'git@github.com:pattogato/EZSwipeController.git', :branch => 'bugfix/swift-3-fixes'

pod 'SwiftyJSON', :git => 'https://github.com/appsailor/SwiftyJSON.git', :branch => 'swift3'

# Core Data
pod 'MagicalRecord/Shorthand'

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
