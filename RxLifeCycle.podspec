Pod::Spec.new do |s|
  s.name             = "RxLifeCycle"
  s.summary          = "Easy observing life cycle of AppDelegate and ViewController"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/onmyway133/RxLifeCycle"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/RxLifeCycle.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/**/*'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'


  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
