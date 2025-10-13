require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

# I'm almost certain there's something I could improve here.
# I tried a log of different things when battling the `FFmpegKitConfig.h file does not exist` issue
  s.source        = { :git => 'https://github.com/viktorVashash/ffmpeg-kit.git', :tag => s.version.to_s }

#   s.default_subspec   = 'https'

  s.dependency "React-Core"

  s.source_files      = '**/FFmpegKitReactNativeModule.m',
  '**/FFmpegKitReactNativeModule.h'

  s.dependency 'ffmpeg-kit-ios-https', "6.0"


  s.ios.deployment_target = '12.1'
end