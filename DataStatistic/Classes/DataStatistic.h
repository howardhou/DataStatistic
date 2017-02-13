//
//  DataStatistic.h
//  RongziTong
//
//  Created by HouHoward on 11/30/15.
//  Copyright © 2015 rongzi. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * 封装了Umeng统计 和 TalkingData，目的是避免Umeng接口变化导致APP的不必要修改，也为了统一处理 不同APP的统计分析
 * 友盟统计版本 - UMMobClick.framework - v4.1.11，无IDFA，支持HTTPS
 * Talking Data版本 - TalkingDataAnalytics - 有IDFA，支持HTTPS，支持IPV6
 */
@interface DataStatistic : NSObject


/**
 开启Umeng统计

 @param umengKey app key
 */
+(void) statisticWithUmengKey:(NSString *) umengKey;


/**
 开启TalkingData

 @param talkingDataKey app key
 */
+(void) statisticWithTalkingDataKey:(NSString *) talkingDataKey;


/**
 统计用户点击行为

 @param eventId 事件ID
 */
+(void) logEvent:(NSString *) eventId;

/**
 统计用户点击行为

 @param eventId 事件ID
 @param label Label
 */
+(void) logEvent:(NSString *) eventId label:(NSString *) label;


/**
 开始记录页面的停留时间

 @param name 页面的名称
 */
+(void) beginLogPage:(NSString *) name;


/**
 结束记录页面的停留时间

 @param name 页面的名称
 */
+(void) endLogPage:(NSString *) name;
@end
