Pod::Spec.new do |s|
  s.name             = 'SensoryCloud'
  s.version          = 'v1.0.0'
  s.summary          = 'Objective C version of the Sensory Cloud SDK'
  s.description      = <<-DESC
Sensory Cloud Objective C SDK. Created to make communicating with Sensory Cloud easy on an iOS app!
  DESC

  s.homepage         = 'https://github.com/Sensory-Cloud/objc-sdk'
  s.license          = { :type => 'APACHE 2.0', :file => 'LICENSE' }
  s.author           = { 'Niles Hacking' => 'nhacking@sensoryinc.com' }
  s.source           = { :git => 'https://github.com/Sensory-Cloud/objc-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  # Directory where all protobuf generated code lives
  gen_path = 'SensoryCloud/Generated'

  s.source_files = 'SensoryCloud/Classes/**/*'

  # Include the generated protobuf message definitions
  s.subspec 'ProtoMessages' do |ms|
    ms.source_files = "#{gen_path}/**/*.pbobjc.{h,m}"
    ms.header_mappings_dir = gen_path
    ms.requires_arc = false
    ms.dependency 'Protobuf'
  end

  # Include the generated gRPC service definitions
  s.subspec 'ProtoServices' do |ss|
    ss.source_files = "#{gen_path}/**/*.pbrpc.{h,m}"
    ss.header_mappings_dir = gen_path
    ss.requires_arc = false
    ss.dependency 'gRPC-ProtoRPC'
    ss.dependency "#{s.name}/ProtoMessages"
  end

  s.pod_target_xcconfig = {
    # This is needed by all pods that depend on Protobuf:
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    # This is needed by all pods that depend on gRPC-RxLibrary:
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  }
end
