require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.cocoapods_version   = '>= 1.10.0'
  s.name                = 'RNBackgroundGeolocationFirebase'
  s.version             = package['version']
  s.summary             = package['description']
  s.description         = <<-DESC
    Firebase adapter for react-native-background-geolocation
  DESC
  s.homepage            = package['homepage']
  s.license             = package['license']
  s.author              = package['author']
  s.source              = { :git => 'https://github.com/transistorsoft/react-native-background-geolocation-firebase.git', :tag => s.version }
  s.platform            = :ios, '8.0'
  s.preserve_paths      = 'docs', 'CHANGELOG.md', 'LICENSE', 'package.json', 'index.js', 'NativeModule.js'
  
  s.dependency 'React'  
  s.dependency 'FirebaseFirestore'

  s.source_files        = 'ios/RNBackgroundGeolocationFirebase/*.{h,m}'
end
