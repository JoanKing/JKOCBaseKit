# JKOCBaseKit
OC项目的一个工具包，里面是一些常用的组件以及分类Categorys

## Requirements
This library requires `iOS 8.0+` and `Xcode 8.0+`.

## 开始

### 配置工程

#### CocoaPods 导入

   - 方式1：下载下来，把文件夹 IMBaseKit 拖入项目

   - 方式2：使用CocoaPods 导入

         platform :ios, '8.0'

         target 'ProjectName' do

            use_frameworks!
 
            pod 'JKOCBaseKit'
         end  

## 里面分为2部分：JKKit 与 JKCategory

#### 第一部分：JKKit

      1、JKDate： 有关时间的类
      2、JKGCDTimer：GCD定时器
      3、JKTextExtension 有关文本的扩展，文本的size以及富文本的适配
      4、JKSandboxPath 沙盒路径的配置
      5、JKRSATool RSA 加密
      6、JKLimitInput 输入字符的限制
      7、JKTopWindow 点击状态栏滑动界面置顶
      8、JKQRCode   二维码带logo以及普通二维码的生成以及相机扫描的使用
      9、JKSmallLabels 可点击标签的添加
    
#### 第二部分：JKCategory：分类的综述
    
      1、UIView+JKLayout ： 一些控件位置的设置
      2、NSMutableArray+JKMutableArray：可变数组的扩展
      3、UIColor+JKColor：颜色的扩展，目前里面只有16进制的设置
      4、UIImage+JKUIImageRedraw：图片的设置
      5、UIBarButtonItem+JKBarbuttonItem：自定义UIBarButtonItem 
      
## 版本历史

- 0.0.1

- 新增: 基础分类的新增
