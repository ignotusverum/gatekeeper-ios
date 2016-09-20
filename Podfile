source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/twilio/cocoapod-specs'

def pods

# Utilities
pod 'PromiseKit', '~> 3.5'

# Extensions
pod 'EZSwiftExtensions', :git => 'git@github.com:goktugyil/EZSwiftExtensions.git', :branch => 'Swift2.3'

# Networking
pod 'Alamofire', '~> 3.5'

# Core Data
pod 'MagicalRecord/Shorthand'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "2.3"
        end
    end
end

# swift integration
use_frameworks!

# who cares about warnings
inhibit_all_warnings!

end

target 'GateKeeper' do
    pods
end
