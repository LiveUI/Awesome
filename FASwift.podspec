#
# Be sure to run `pod lib lint FASwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FASwift'
  s.version          = '0.0.1'
  s.summary          = 'Swift implementation of Font Awesome 5!'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/manGoweb/FASwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ondrej Rafaj' => 'opensource@mangoweb.cz' }
  s.source           = { :git => 'https://github.com/manGoweb/FASwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rafiki270'

  s.ios.deployment_target = '10.3'
  # s.osx.deployment_target = "10.13"

  s.source_files = 'FASwift/Classes/**/*'
  
  s.resource_bundles = {
    'FASwift' => ['FASwift/Assets/*.ttf']
  }
  s.frameworks = 'UIKit', 'CoreText'

end
