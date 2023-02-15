#
# Be sure to run `pod lib lint objc-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'objc-sdk'
  s.version          = '0.1.0'
  s.summary          = 'Objective C version of the Sensory Cloud SDK'
  s.description      = <<-DESC
Objective C version of the Sensory Cloud SDK.
                       DESC

  s.homepage         = 'https://github.com/Niles Hacking/objc-sdk'
  s.license          = { :type => 'APACHE 2.0', :file => 'LICENSE' }
  s.author           = { 'Niles Hacking' => 'nhacking@sensoryinc.com' }
  s.source           = { :git => 'https://github.com/Niles Hacking/objc-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  # Directory where all protobuf generated code lives
  gen_path = 'objc-sdk/Generated'

  s.source_files = 'objc-sdk/Classes/**/*'

  # Include the generated protobuf message definitions
  s.subspec 'Messages' do |ms|
    ms.source_files = "#{gen_path}/**/*.pbobjc.{h,m}"
    ms.header_mappings_dir = gen_path
    ms.requires_arc = false
    ms.dependency 'Protobuf'
  end

  # Include the generated gRPC service definitions
  s.subspec 'Services' do |ss|
    ss.source_files = "#{gen_path}/**/*.pbrpc.{h,m}"
    ss.header_mappings_dir = gen_path
    ss.requires_arc = false
    ss.dependency 'gRPC-ProtoRPC'
    ss.dependency "#{s.name}/Messages"
  end

  s.pod_target_xcconfig = {
    # This is needed by all pods that depend on Protobuf:
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    # This is needed by all pods that depend on gRPC-RxLibrary:
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  }
end
