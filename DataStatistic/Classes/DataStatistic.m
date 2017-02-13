//
//  DataStatistic.m
//  RongziTong
//
//  Created by HouHoward on 11/30/15.
//  Copyright © 2015 rongzi. All rights reserved.
//

#import "DataStatistic.h"
#import "TalkingData.h"
#import <UMMobClick/MobClick.h>

@implementation DataStatistic

+(void) statisticWithUmengKey:(NSString *) umengKey{
    //统计分析功能
    UMAnalyticsConfig * config = [[UMAnalyticsConfig alloc] init];
    config.appKey = umengKey;
    config.ePolicy = BATCH;
    
#ifndef UMeng_Statistic
#define UMeng_Statistic
#endif
    
#ifdef DEBUG
    config.channelId = @"DEBUG";
    config.ePolicy = REALTIME;
    [MobClick setAppVersion: @"Debug"];
    [MobClick setLogEnabled:YES];

#elif ADHOC
    config.channelId = @"AdHoc";
    [MobClick setAppVersion: @"AdHoc"];
    
#else
    config.channelId = @"AppStore";
    [MobClick setAppVersion: [self getAppVersion]];
#endif
    
    [MobClick setCrashReportEnabled:YES];
    [MobClick startWithConfigure: config];

}

+(NSString *) getAppVersion {
    NSString *build_version_text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return build_version_text;
}

+(void)statisticWithTalkingDataKey:(NSString *)talkingDataKey{
   
#ifndef TalkingData_Statistic
#define TalkingData_Statistic
#endif
    
#ifdef DEBUG
    [TalkingData sessionStarted:talkingDataKey withChannelId:@"DEBUG"];
    [TalkingData setExceptionReportEnabled:YES];
#elif ADHOC
    
    [TalkingData sessionStarted:talkingDataKey withChannelId:@"AdHoc"];
    [TalkingData setExceptionReportEnabled:YES];
#else
    
    [TalkingData sessionStarted:talkingDataKey withChannelId:@"AppStore"];
    [TalkingData setExceptionReportEnabled:YES];
#endif
}


+(void) beginLogPage:(NSString *) name{
#ifdef TalkingData_Statistic
    [TalkingData trackPageBegin: name];
#endif
    
#ifdef UMeng_Statistic
    [MobClick beginLogPageView: name];
#endif
}

+(void) endLogPage:(NSString *) name{
    
#ifdef TalkingData_Statistic
    [TalkingData trackPageEnd: name];
#endif
    
#ifdef UMeng_Statistic
    [MobClick endLogPageView: name];
#endif

}


+(void) logEvent:(NSString *) eventId{

#ifdef TalkingData_Statistic
    [TalkingData trackEvent: eventId];
#endif
    
#ifdef UMeng_Statistic
    [MobClick event: eventId];
#endif

}

+(void) logEvent:(NSString *) eventId label:(NSString *) label{

#ifdef TalkingData_Statistic
    [TalkingData trackEvent: eventId label: label];
#endif
    
#ifdef UMeng_Statistic
    [MobClick event:eventId label: label];
#endif

}

@end
