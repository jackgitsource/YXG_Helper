//
//  YXG_Macro.h
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#ifndef YXG_Macro_h
#define YXG_Macro_h

//info.plist 文件信息
#define YXG_InfoDictionary [[NSBundle mainBundle] infoDictionary]
//当前应用程序的 bundle ID
#define YXG_BundleIdentifier [[NSBundle mainBundle] bundleIdentifier]
// app版本
#define YXG_AppVersion [YXG_InfoDictionary objectForKey:@"CFBundleShortVersionString"]
//颜色宏定义
#define YXG_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define YXG_RGB(r,g,b) YXG_RGBA(r,g,b,1.0f)
#define YXG_HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define YXG_HEXCOLORA(hex, alpha) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:alpha]
#define YXG_StringColor(color) [color YXG_ColorFromHexString]
#define YXG_StringValue(str) [str YXG_CheckString]?str:@""
//获取屏幕宽高
#define YXG_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define YXG_ScreenHeight [UIScreen mainScreen].bounds.size.height



#endif /* YXG_Macro_h */
