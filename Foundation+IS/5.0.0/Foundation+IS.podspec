#
# Be sure to run `pod lib lint Foundation-IS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Foundation+IS'
  s.version          = '5.0.0'
  s.swift_version    = '5'
  s.summary          = 'Extensions facilitate using Foundatoin Framework'
  s.description      = 'Extensions for arrays, bundle, charchters, Date, Strings, NSAttributedString, Currency, Fonts, URLS'
  s.homepage         = 'https://github.com/islamshazly/Foundation-IS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'islamshazly' => 'islam.elshazly92@gmail.com' }
  s.source           = { :git => 'https://github.com/islamshazly/Foundation-IS.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://twitter.com/shazly92'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Foundation-IS/Classes/**/*'
  s.frameworks = 'Foundation'

end
