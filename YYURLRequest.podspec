
Pod::Spec.new do |s|
  s.name             = 'YYURLRequest'
  s.version          = '0.1.1'
  s.summary          = 'A Objective-C network library.'
  s.homepage         = 'https://github.com/Pircate/YYURLRequest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'G-Xi0N' => 'gao497868860@163.com' }
  s.source           = { :git => 'https://github.com/Pircate/YYURLRequest.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'YYURLRequest/Classes/**/*'
  s.dependency 'AFNetworking'
  s.dependency 'YYModel'
  s.dependency 'YYCache'
end
