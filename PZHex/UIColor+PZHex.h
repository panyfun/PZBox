//
//  UIColor+PZHex.h
//
//  Created by pany on 2018/7/2.
//  Copyright © 2018年 Pany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PZHex)

/**
 0xffffff
 */
- (NSUInteger)pz_hex;

/**
 #ffffff
 */
- (NSString *)pz_hexString;

@end
