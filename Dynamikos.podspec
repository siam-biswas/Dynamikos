Pod::Spec.new do |s|
  s.name        = "Dynamikos"
  s.version     = "1.0.0"
  s.summary     = "A solution for UI Consistency in Swift"
  s.homepage    = "https://github.com/siam-biswas/Dynamikos"
  s.license     = { :type => "MIT" }
  s.authors     = { "Siam Biswas" => "siam.biswas@icloud.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/siam-biswas/Dynamikos.git", :tag => s.version }
  s.source_files = "Source/Dynamikos/*.swift"
end
