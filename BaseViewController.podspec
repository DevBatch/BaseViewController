#
# Be sure to run `pod lib lint BaseViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaseViewController'
  s.version          = '0.1.0'
  s.summary          = 'BaseViewController is used to customize the default behavior of UINavigationBar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
With this class we can customize UINavigationController. We can add buttons with Custom Views. The actions of the buttons can be handled by implementing delegate of BaseViewController.
                       DESC

  s.homepage         = 'https://github.com/MuhammadNayabButt/BaseViewController.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'muhammadnayabbutt' => 'nayabbutt1@gmail.com' }
  s.source           = { :git => 'https://github.com/muhammadnayabbutt/BaseViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/iamNayabButt'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BaseViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BaseViewController' => ['BaseViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit' , 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
