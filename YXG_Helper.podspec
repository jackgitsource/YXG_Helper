

Pod::Spec.new do |spec|
  spec.name         = "YXG_Helper"
  spec.version      = "0.0.6"
  spec.summary      = "基础工具"
  spec.description  = <<-DESC
  经常使用到的基础工具抽象成库以方便管理
                  DESC
  spec.homepage     = "https://github.com/jackgitsource/YXG_Helper"
  spec.license      = "MIT"
  spec.author             = { "jackgitsource" => "1360634255@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/jackgitsource/YXG_Helper", :tag => spec.version.to_s }

  #  spec.source_files  = "YXG_Helper", "YXG_Helper/*.{h,m}"
  spec.source_files  = 'YXG_Helper/Classes/**/*'

  #  头文件
  #  spec.public_header_files = 'YXG_Helper/Classes/**/*.h'

  #  使用的库
  #  spec.frameworks = 'UIKit', 'AVFoundation', 'AssetsLibrary', 'WebKit'
  spec.frameworks = 'UIKit'

  #  依赖库
  #  spec.dependency 'AFNetworking'
  #  spec.dependency 'ReactiveObjC'
  #  spec.dependency 'Masonry'
  #  spec.dependency 'SDWebImage'
  #  spec.dependency 'MJRefresh'
  #  spec.dependency 'Aspects'
end
