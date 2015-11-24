platform :ios, '8.0'
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
prepare_command = <<-CMD
    SUPPORTED_LOCALES="['base', 'ru', 'en']"
        find . -type d ! -name "*$SUPPORTED_LOCALES.lproj" | grep .lproj | xargs rm -rf
        CMD

# BL
pod 'Alamofire'
pod 'SwiftyJSON'
pod 'Parse'
pod 'MagicalRecord'
pod 'MD5Digest'
pod 'HockeySDK'
pod 'FBSDKCoreKit'
pod 'VK-ios-sdk'

# UI
pod 'SnapKit'
pod 'pop'
pod 'MBProgressHUD'
pod 'UIImage+BlurredFrame'
pod 'SDWebImage'
pod 'TTTAttributedLabel'
pod 'RMPickerViewController'

# Debug
pod 'FLEX', '~> 2.0', :configurations => ['Debug']