#
# Be sure to run `pod lib lint Awesome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AwesomeEnum'
    s.version          = '3.0.0'
    s.summary          = 'Swift implementation of Font Awesome 5 and Font Awesome 5 Pro!'
    s.swift_version    = '5.0'

    s.description      = 'Swift implementation of Font Awesome 5 and Font Awesome 5 Pro allows you to implement this amazing web font on iOS, tvOS and macOS devices easily!'

    s.homepage         = 'https://github.com/LiveUI/Awesome'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ondrej Rafaj' => 'opensource@mangoweb.cz' }
    s.source           = { :git => 'https://github.com/LiveUI/Awesome.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/rafiki270'

    s.ios.deployment_target = '11.0'
    s.tvos.deployment_target = '11.0'
    s.osx.deployment_target = '10.13'
	s.watchos.deployment_target = '2.0'
    
    s.source_files = 'Classes/**/*'

    s.resource_bundles = {
        'Awesome' => ['Assets/*.ttf']
    }
    s.ios.frameworks = 'UIKit', 'CoreText', 'CoreGraphics'
    s.tvos.frameworks = 'UIKit', 'CoreText', 'CoreGraphics'
    s.osx.frameworks = 'Cocoa', 'CoreText', 'CoreGraphics'
	s.watchos.frameworks = 'UIKit', 'CoreText', 'CoreGraphics'
end
