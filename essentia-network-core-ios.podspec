Pod::Spec.new do |s|
  s.name             = 'essentia-network-core-ios'
  s.version          = '0.0.1'
  s.summary          = 'Essentia network core'

  s.homepage         = 'https://github.com/essentiaone/essentia-network-core-ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'impl' => 'pavlo.bojkoo@gmail.com' }
  s.source           = { :git => 'https://github.com/essentiaone/essentia-network-core-ios.git', :tag => s.version.to_s }
  
  s.platform     = :ios, "10.0"
  s.swift_version= '4'
  s.static_framework  = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.module_name   = "EssentiaNetworkCore"
  s.source_files = 'essentia-network-core-ios/**/*.{swift}'
  
end