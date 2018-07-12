//
//  UIColor+JYMedia.m
//
//  Created by pany on 2018/7/2.
//  Copyright © 2018年 Pany. All rights reserved.
//

#import "UIColor+PZHex.h"

@implementation UIColor (PZHex)

- (NSUInteger)pz_hex {
    CGFloat red, green, blue, alpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
        [self getWhite:&red alpha:&alpha];
        green = red;
        blue = red;
    }
    
    red = roundf(red * 255.f);
    green = roundf(green * 255.f);
    blue = roundf(blue * 255.f);
    alpha = roundf(alpha * 255.f);
    
    NSUInteger hex = ((uint)alpha << 24) | ((uint)red << 16) | ((uint)green << 8) | ((uint)blue);
    return hex;
}

- (NSString *)pz_hexString {
    NSUInteger hex = [self pz_hex];
    if ((hex & 0xFF000000) == 0xFF000000) {
        return [NSString stringWithFormat:@"#%06lx", hex & 0xFFFFFF];
    } else {
        return [NSString stringWithFormat:@"#%08lx", (unsigned long)hex];
    }
}

@end
