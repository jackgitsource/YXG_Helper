//
//  YXG_Macro.h
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#ifndef YXG_Macro_h
#define YXG_Macro_h


// iOS系统信息
#define YXG_iOS_VERSION [[UIDevice currentDevice] systemVersion]
// 判断是否是iphoneX设备
#define YXG_IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
// 判断是不是ipad
#define YXG_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// info.plist 文件信息
#define YXG_InfoDictionary [[NSBundle mainBundle] infoDictionary]
// 当前应用程序的 bundle ID
#define YXG_BundleIdentifier [[NSBundle mainBundle] bundleIdentifier]
// app版本
#define YXG_AppVersion [YXG_InfoDictionary objectForKey:@"CFBundleShortVersionString"]
// 颜色宏定义
#define YXG_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define YXG_RGB(r,g,b) YXG_RGBA(r,g,b,1.0f)
#define YXG_HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define YXG_HEXCOLORA(hex, alpha) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:alpha]
#define YXG_StringColor(color) [color YXG_ColorFromHexString]
#define YXG_StringValue(str) [str YXG_CheckString]?str:@""
// 获取屏幕宽高
#define YXG_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define YXG_ScreenHeight [UIScreen mainScreen].bounds.size.height
// 获取AppDelegate
#define YXG_AppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate


#endif /* YXG_Macro_h */
