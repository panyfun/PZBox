//
//  NSObject+PZSwizzler.h
//
//  Created by Pany on 2018/4/3.
//  Copyright © 2018年 Pany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PZSwizzler)

+ (BOOL)pz_swizzleMethod:(SEL)originMethod withMethod:(SEL)swizzleMethod;
+ (BOOL)pz_swizzleClassMethod:(SEL)originMethod withClassMethod:(SEL)swizzleMethod;

@end
