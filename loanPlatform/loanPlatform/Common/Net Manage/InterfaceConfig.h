//
//  InterfaceConfig.h
//  nao-ios
//
//  Created by zhoubl on 14-5-8.
//  Copyright (c) 2014年 VISION CORE CORP. All rights reserved.
//

#ifndef nao_ios_InterfaceConfig_h
#define nao_ios_InterfaceConfig_h

#pragma mark - 内外网开关
#if  INTERNET == 1 //内网
#define BaseUrl             @"http://192.168.30.3"

#elif INTERNET == 2 //外网
#define BaseUrl             @"https://192.168.30.3"
#endif

#pragma mark - Marco
#define Device_Post_Launch              BaseUrl@"launch"


#endif
