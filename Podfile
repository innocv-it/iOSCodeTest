# Uncomment the next line to define a global platform for your project
platform :ios, '10.3'

target 'CodeTest' do
  
  use_frameworks!
  
  pod 'Alamofire'
  pod 'Swinject'
  pod 'Moya'
  pod 'Moya-ObjectMapper'
  pod 'Eureka'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
