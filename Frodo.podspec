#
# Be sure to run `pod lib lint Frodo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Frodo'
  s.version          = '1.0.0'
  s.summary          = '快速集成项目常用.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
   分模块独立集成,可分模块配置。
                       DESC

  s.homepage         = 'https://github.com/developer-chenlin/Frodo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenlinios@sina.com' => 'chenlinios@sina.com' }
  s.source           = { :git => 'https://github.com/developer-chenlin/Frodo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Frodo/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Frodo' => ['Frodo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # HTTP模块
  s.subspec 'HTTP' do |sp|
      sp.resources = 'Frodo/Classes/HTTP/**/*'
      sp.dependency  'AFNetworking' , '~>3.2.0'
  end
  
  # TCP模块
  s.subspec 'TCP' do |sp|
      sp.resources = 'Frodo/Classes/TCP/**/*'
      sp.dependency  'CocoaAsyncSocket', '~> 7.6.2'
  end
  
  
  
  
  
end
