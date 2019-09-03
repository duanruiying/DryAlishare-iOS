#
# Be sure to run `pod lib lint DryAlishare-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# 提交仓库:
# pod spec lint DryAlishare-iOS.podspec --allow-warnings --use-libraries
# pod trunk push DryAlishare-iOS.podspec --allow-warnings --use-libraries
#

Pod::Spec.new do |s|
  
  # Git
  s.name        = 'DryAlishare-iOS'
  s.version     = '0.0.1'
  s.summary     = 'DryAlishare-iOS'
  s.homepage    = 'https://github.com/duanruiying/DryAlishare-iOS'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.author      = { 'duanruiying' => '2237840768@qq.com' }
  s.source      = { :git => 'https://github.com/duanruiying/DryAlishare-iOS.git', :tag => s.version.to_s }
  s.description = <<-DESC
  TODO: iOS简化支付宝分享.
  DESC
  
  # User
  #s.swift_version          = '5.0'
  s.ios.deployment_target   = '10.0'
  s.requires_arc            = true
  s.user_target_xcconfig    = {'OTHER_LDFLAGS' => ['-w'] }
  
  # Pod
  s.static_framework        = true
  s.pod_target_xcconfig     = { 'OTHER_LDFLAGS' => ['-w', '-all_load'] }
  
  # Code
  s.source_files        = 'DryAlishare-iOS/Classes/Code/**/*'
  s.public_header_files = 'DryAlishare-iOS/Classes/Code/Public/**/*.h'
  
  # System
  #s.libraries  = ''
  s.frameworks = 'UIKit', 'Foundation'
  
  # ThirdParty
  s.vendored_libraries  = 'DryAlishare-iOS/Classes/lib/*.a'
  #s.vendored_frameworks = ''
  #s.dependency ''
  
end
