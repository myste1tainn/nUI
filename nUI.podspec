Pod::Spec.new do |s|
  s.name             = "nUI"
  s.version          = "0.1.0"
  s.summary          = "Various kind of UI code that ease up UI manipulation"
  s.description      = <<-DESC
nUI Enable certain kind of UI manipulation in interface builder with @IBInspectable & @IBDesignable
to give developer more visual information while developing/designing the app.
                       DESC

  s.homepage         = "https://github.com/myste1tainn/nUI"
  s.license          = 'MIT'
  s.author           = { "A. Keereena" => "myste1tainn.icez@gmail.com or a.keereena@gmail.com" }
  s.source           = { :git => "https://github.com/myste1tainn/nUI.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'nUI' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation', 'UIKit'
# s.dependency 'FastImageCache', '~> 1.3'
end
