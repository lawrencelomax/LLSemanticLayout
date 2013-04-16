//
//  LLGeometryUtilities.h
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 12/11/2012.
//  Copyright (c) 2012 Lawrence Lomax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef LLMax
#define LLMax(val1, val2) ((val1 > val2) ? val1 : val2)
#endif

#ifndef LLMin
#define LLMin(val1, val2) ((val1 < val2) ? val1 : val2)
#endif

#ifndef LLClamp
#define LLClamp(min, max, val) ((val < min) ? min : ((val > max) ? max : val))
#endif

#ifndef LLScale
#define LLScale(minStart, maxStart, minEnd, maxEnd, value) ( minEnd + (value * (maxEnd - minEnd)) )
#endif

typedef enum{
    // Vertical Aligment
    LLAlignmentTopInside = 1 << 1,
    LLAlignmentTopOutside = 1 << 2,
    LLAlignmentTopOn = 1 << 3,
    LLAlignmentTop = (LLAlignmentTopInside | LLAlignmentTopOutside | LLAlignmentTopOn),
    
    LLAlignmentBottomInside = 1 << 4,
    LLAlignmentBottomOutside = 1 << 5,
    LLAlignmentBottomOn = 1 << 6,
    LLAlignmentBottom = (LLAlignmentBottomInside | LLAlignmentBottomOutside | LLAlignmentBottomOn),
    
    LLAlignmentCenterVertical = 1 << 7,
    LLAlignmentVertical = (LLAlignmentTopInside | LLAlignmentTopOutside | LLAlignmentTopOn | LLAlignmentBottomInside | LLAlignmentBottomOutside | LLAlignmentBottomOn | LLAlignmentCenterVertical),
    
    // Horizontal Aligment
    LLAlignmentLeftInside = 1 << 8,
    LLAlignmentLeftOutside = 1 << 9,
    LLAlignmentLeftOn = 1 << 10,
    LLAlignmentLeft = (LLAlignmentLeftInside | LLAlignmentLeftOutside | LLAlignmentLeftOn),
    
    LLAlignmentRightInside = 1 << 11,
    LLAlignmentRightOutside = 1 << 12,
    LLAlignmentRightOn = 1 << 13,
    LLAlignmentRight = (LLAlignmentRightInside | LLAlignmentRightOutside | LLAlignmentRightOn),
    
    LLAlignmentCenterHorizontal = 1 << 14,
    LLAligmentHorizontal = (LLAlignmentLeftInside | LLAlignmentLeftOutside | LLAlignmentLeftOn | LLAlignmentRightInside | LLAlignmentRightOutside | LLAlignmentRightOn | LLAlignmentCenterHorizontal),
    
    // Composites
    LLAlignmentCenter = LLAlignmentCenterHorizontal | LLAlignmentCenterVertical,
    
    // Aliases
    LLAlignmentAbove = LLAlignmentTopOutside,
    LLAlignmentBelow = LLAlignmentBottomOutside,
    LLAlignmentToLeftOf = LLAlignmentLeftOutside,
    LLAlignmentToRightOf = LLAlignmentRightOutside
} LLAlignment;

#define LLDegreesToRadians(x) (M_PI * x / 180.0)

#pragma mark CGRect

extern inline CGRect LL_CGRectZeroOriginWithSize(CGSize size);
extern inline CGRect LL_CGRectInset(CGRect rect, UIEdgeInsets edgeInsets);
extern inline CGPoint LL_CGRectGetPoint(CGRect rect, LLAlignment position);
extern inline CGRect LL_CGRectAlignWithOffset(const CGRect alignRect, CGRect rect, LLAlignment alignment, CGPoint offset);
extern inline CGRect LL_CGRectAlign(const CGRect alignRect, CGRect rect, LLAlignment alignment);

#pragma mark CGSize

extern inline CGSize LL_CGSizeFloor(CGSize size);
extern inline CGSize LL_CGSizeCeil(CGSize size);
extern inline CGSize LL_CGSizeUnion(CGSize s1, CGSize s2);
extern inline CGSize LL_CGSizeAdd(CGSize s1, CGSize s2);
extern inline CGSize LL_CGSizeInset(CGSize size, CGFloat dw, CGFloat dh);
extern inline CGSize LL_CGSizeCombine(CGSize s1, CGSize s2, LLAlignment relativePosition);

#pragma mark CGPoint

extern inline CGPoint LL_CGPointFloor(CGPoint point);
extern inline CGPoint LL_CGPointCeil(CGPoint point);

extern inline CGPoint LL_CGPointAdd(CGPoint p1, CGPoint p2);
extern inline CGPoint LL_CGPointSubtract(CGPoint minuend, CGPoint subtrahend);

extern inline CGPoint LL_CGPointModulus(CGPoint point);
extern inline CGPoint LL_CGPointScalarMultiply(CGPoint point, CGFloat scalarValue);
extern inline CGPoint LL_CGPointScalarDivide(CGPoint point, CGFloat divisor);

extern inline CGFloat LL_CGPointMagnitude(CGPoint p1);
extern inline CGPoint LL_CGPointClamp(CGPoint min, CGPoint max, CGPoint value);
extern inline CGPoint LL_CGPointNormalize(CGPoint point);

#pragma mark CGAffineTransform

extern inline CGFloat LL_CGAffineTransformGetRotation(CGAffineTransform transform);

@interface LLGeometryUtilities : NSObject

@end
