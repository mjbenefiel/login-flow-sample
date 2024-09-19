# Uncomment the next line to define a global platform for your project
#platform :ios, '12.0' # or any version you need

target 'login-flow-sample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for login-flow-sample
  pod 'MBProgressHUD', '~> 1.2.0'
  pod 'Firebase/Auth'           # For Firebase Authentication
  pod 'Firebase/Analytics' 
  pod 'Loaf'
  pod 'mParticle-Apple-SDK', '~> 8.0'
  pod 'mParticle-Iterable', '~> 8.1.0'

  target 'login-flow-sampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'login-flow-sampleUITests' do
    # Pods for testing
  end

end

# Post-install script to replace DT_TOOLCHAIN_DIR with TOOLCHAIN_DIR
# and set IPHONEOS_DEPLOYMENT_TARGET to 13.0
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.base_configuration_reference
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
        File.open(xcconfig_path, "w") { |file| file.write(xcconfig_mod) }
      end
    end
  end

  # Additional post-install step to set IPHONEOS_DEPLOYMENT_TARGET to 13.0
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
