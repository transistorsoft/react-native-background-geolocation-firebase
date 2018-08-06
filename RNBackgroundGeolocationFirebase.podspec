require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
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

  s.dependency 'React'
  s.preserve_paths      = 'docs', 'CHANGELOG.md', 'LICENSE', 'package.json', 'index.js', 'NativeModule.js'
  s.dependency 'Firebase/Core'
  s.dependency 'Firebase/Firestore'

  s.source_files        = 'ios/RNBackgroundGeolocationFirebase/*.{h,m}'

  


end
