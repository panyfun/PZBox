//  PZProxy.h
//  Created by Pany on 2018/4/23.
//

#import <Foundation/Foundation.h>

@interface PZProxy : NSProxy

@property (nonatomic, weak, readonly) id target;

- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;

@end
