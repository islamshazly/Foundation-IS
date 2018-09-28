#
# Be sure to run `pod lib lint Foundation-IS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Foundation+IS'
  s.version          = '0.1.0'
  s.summary          = 'Extensions facilate using Foundatoin Framework'
  s.description      = 'Extensions for arrays, bundle, charchters, Date, Strings, NSAttributedString, Currency, Fonts, URLS'
  s.homepage         = 'https://github.com/islamshazly/Foundation-IS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'islamshazly' => 'islam.elshazly92@gmail.com' }
  s.source           = { :git => 'https://github.com/islamshazly/Foundation-IS.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://twitter.com/elshazly92'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Foundation-IS/Classes/**/*'
  s.frameworks = 'Foundation'

end
