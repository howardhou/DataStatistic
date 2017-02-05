#
# Be sure to run `pod lib lint DataStatistic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DataStatistic'
  s.version          = '1.0.0'
  s.summary          = 'User Behavior Statistic 用户行为统计'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
封装第三方平台的数据统计功能，包括：Umeng统计，TalkingData
                       DESC

  s.homepage         = 'https://github.com/howardhou/DataStatistic'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'howardhou' => 'houdongdong@rongzi.com' }
  s.source           = { :git => 'https://github.com/howardhou/DataStatistic.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  
  s.source_files = 'DataStatistic/Classes/**/*'
  s.ios.vendored_library = 'DataStatistic/Frameworks/libTalkingData.a'
  s.ios.vendored_frameworks = 'DataStatistic/Frameworks/UMMobClick.framework'

  # s.resource_bundles = {
  #   'DataStatistic' => ['DataStatistic/Assets/*.png']
  # }

  s.public_header_files = 'DataStatistic/Classes/**/*.h'

  s.frameworks = 'CoreTelephony'
  s.libraries = 'z', 'sqlite3'

  # s.dependency 'AFNetworking', '~> 2.3'
end
