#
# Be sure to run `pod lib lint YJGroupedStyleTableViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = 'YJGroupedStyleTableViewController'
  s.version          = '1.0.0'
  s.summary          = 'A replacement for using iOS default grouped style table view.'
  s.description      = <<-DESC
YJGroupedStyleTableViewController is a replacement for using iOS default grouped style table view for providing lots of customization.
                       DESC

  s.homepage         = 'https://github.com/huang-kun/YJGroupedStyleTableViewController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huang-kun' => 'jack-huang-developer@foxmail.com' }
  s.source           = { :git => 'https://github.com/huang-kun/YJGroupedStyleTableViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'http://weibo.com/u/5736413097'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'YJGroupedStyleTableViewController/Classes/**/*'
  s.public_header_files = 'YJGroupedStyleTableViewController/Classes/**/*.h'

end
