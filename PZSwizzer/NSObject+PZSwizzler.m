//
//  NSObject+PZSwizzler.m
//
//  Created by Pany on 2018/4/3.
//  Copyright © 2018年 Pany. All rights reserved.
//

#import "NSObject+PZSwizzler.h"

#import <objc/runtime.h>

@implementation NSObject (PZSwizzler)

+ (BOOL)pz_swizzleMethod:(SEL)originMethod withMethod:(SEL)swizzleMethod {
    Method _oriMethod = class_getInstanceMethod(self, originMethod);
    Method _swiMethod = class_getInstanceMethod(self, swizzleMethod);
    if (!_oriMethod || !_swiMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    originMethod,
                    class_getMethodImplementation(self, originMethod),
                    method_getTypeEncoding(_oriMethod));
    class_addMethod(self,
                    swizzleMethod,
                    class_getMethodImplementation(self, swizzleMethod),
                    method_getTypeEncoding(_swiMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, originMethod), class_getInstanceMethod(self, swizzleMethod));
    return YES;
}

+ (BOOL)pz_swizzleClassMethod:(SEL)originMethod withClassMethod:(SEL)swizzleMethod {
    return [object_getClass(self) pz_swizzleMethod:originMethod withMethod:swizzleMethod];
}

@end
