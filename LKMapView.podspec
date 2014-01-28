Pod::Spec.new do |s|
  s.name         = "LKMapView"
  s.version      = "0.9.0"
  s.summary      = "MKMapView subclass, set span, displays pin and circle automatically."
  s.description  = <<-DESC
MKMapView subclass, set span, displays pin and circle automatically.
                   DESC
  s.homepage     = "https://github.com/lakesoft/LKMapView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroshi Hashiguchi" => "xcatsan@mac.com" }
  s.source       = { :git => "https://github.com/lakesoft/LKMapView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

end
