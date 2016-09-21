Pod::Spec.new do |s|
  s.name             = "nanoUI"
  s.version          = "0.1.5"
  s.summary          = "Various kind of UI code that ease up UI manipulation"
  s.description      = <<-DESC
nUI Enable certain kind of UI manipulation in interface builder with @IBInspectable & @IBDesignable
to give developer more visual information while developing/designing any application.
                       DESC

  s.homepage         = "https://github.com/myste1tainn/nanoUI"
  s.license          = 'MIT'
  s.author           = { "A. Keereena" => "myste1tainn.icez@gmail.com or a.keereena@gmail.com" }
  s.source           = { :git => "https://github.com/myste1tainn/nanoUI.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'nanoUI' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation', 'UIKit'
# s.dependency 'FastImageCache', '~> 1.3'
end
