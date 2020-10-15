Pod::Spec.new do |s|

   s.name         = "JKOCBaseKit"
   s.version      = "0.0.2"
   s.summary      = "OCTool."
   s.description  = "这是一个很好用的OC的工具类，我会不断的更新的"

   s.homepage     = "https://github.com/JoanKing/JKOCBaseKit"
   s.license      = "Apache License 2.0"
   s.author             = { "JoanKingWC" => "jkironman@163.com" }
   s.ios.deployment_target = "8.0"
   s.source       = { :git => "https://github.com/JoanKing/JKOCBaseKit.git", :tag => "#{s.version}" }
   #s.public_header_files = 'JKOCProjectTool/JKOCProjectTool.h'
   s.source_files = 'JKOCBaseKit/JKOCBaseKit.h'
   s.social_media_url = "https://www.jianshu.com/u/8fed18ed70c9"
   s.requires_arc = true
   s.resources = 'JKOCBaseKit/JKResource/*'
   
   s.subspec 'JKCategory' do |ss|
     ss.source_files = 'JKOCBaseKit/JKCategory/**/*'
   end

   s.subspec 'JKKit' do |ss|
     ss.dependency 'JKOCBaseKit/JKCategory'
     ss.source_files = 'JKOCBaseKit/JKKit/**/*'
     #ss.public_header_files = 'JKOCProjectTool/JKOCProjectTool.h'
   end

end

