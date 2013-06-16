//
//  LLGeometryUtilities.h
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 12/11/2012.
//  Copyright (c) 2012 Lawrence Lomax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Define LLNAMESPACE if you want non-prefixed versions of the functions. This has been done to avoid namespace collisions
#ifdef LLNAMESPACE

// CGFloat

#define CGFloatFloor LL_CGFloatFloor
#define CGFloatCeil LL_CGFloatCeil
#define CGFloatRound LL_CGFloatRound
#define CGFloatAbs LL_CGFloatAbs

//CGRect

#define CGRectFloor LL_CGRectFloor
#define CGRectCeil LL_CGRectCeil
#define CGRectRound LL_CGRectRound

#define CGRectZeroOriginWithSize LL_CGRectZeroOriginWithSize
#define CGRectInset LL_CGRectInset

#define CGRectAlignWithOffset LL_CGRectAlignWithOffset
#define CGRectAlign LL_CGRectAlign
#define CGRectPlaceSizeWithOffset LL_CGRectPlaceSizeWithOffset
#define CGRectPlaceSize LL_CGRectPlaceSize

#define CGRectGetPoint LL_CGRectGetPoint

// CGSize

#define CGSizeFloor LL_CGSizeFloor
#define CGSizeCeil LL_CGSizeCeil
#define CGSizeRound LL_CGSizeRound

#define CGSizeUnion LL_CGSizeUnion
#define CGSizeAdd LL_CGSizeAdd
#define CGSizeInset LL_CGSizeInset
#define CGSizeCombine LL_CGSizeCombine

// CGPoint

#define CGPointFloor LL_CGPointFloor
#define CGPointFloor LL_CGPointCeil
#define CGPointRound LL_CGPointRound

#define CGPointAdd LL_CGPointAdd
#define CGPointSubtract LL_CGPointSubtract

#define CGPointModulus LL_CGPointModulus
#define CGPointScalarMultiply LL_CGPointScalarMultiply
#define CGPointScalarDivide LL_CGPointScalarDivide

#define CGPointMagnitude LL_CGPointMagnitude
#define CGPointClamp LL_CGPointClamp
#define CGPointNormalize LL_CGPointNormalize

//UIEdgeInsets

#define UIEdgeInsetsOffset LL_UIEdgeInsetsOffsetRect
#define UIEdgeInsetsAdd LL_UIEdgeInsetsAdd
#define UIEdgeInsetsAbs LL_UIEdgeInsetsAbs
#define UIEdgeInsetsCeil LL_UIEdgeInsetsCeil
#define UIEdgeInsetsFloor LL_UIEdgeInsetsFloor
#define UIEdgeInsetsRound LL_UIEdgeInsetsRound
#define UIEdgeInsetsMin LL_UIEdgeInsetsMin
#define UIEdgeInsetsMax LL_UIEdgeInsetsMax

#endif

#ifndef LLClamp
#define LLClamp(min, max, value) ((value < min) ? min : ((value > max) ? max : value))
#endif

#ifndef LLScale
#define LLScale(minStart, maxStart, minEnd, maxEnd, value) ( minEnd + (value * (maxEnd - minEnd)) )
#endif

#define LLDegreesToRadians(x) (M_PI * x / 180.0)

typedef NS_OPTIONS(NSUInteger, LLAlignment){
    // Null/Empty
    LLAlignmentNone = 0,
    
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
    
    // Aliases
    LLAlignmentAbove = LLAlignmentTopOutside,
    LLAlignmentBelow = LLAlignmentBottomOutside,
    LLAlignmentToLeftOf = LLAlignmentLeftOutside,
    LLAlignmentToRightOf = LLAlignmentRightOutside,
    
    // Composites
    LLAlignmentTopLeft = LLAlignmentTop | LLAlignmentLeft,
    LLAlignmentTopRight = LLAlignmentTop | LLAlignmentRight,
    LLAlignmentBottomLeft = LLAlignmentBottom | LLAlignmentLeft,
    LLAlignmentBottomRight = LLAlignmentBottom | LLAlignmentRight,
    
    LLAlignmentCenter = LLAlignmentCenterHorizontal | LLAlignmentCenterVertical,
    LLAlignmentCenterVerticalToLeftOf = LLAlignmentCenterVertical | LLAlignmentToLeftOf,
    LLAlignmentCenterVerticalToRightOf = LLAlignmentCenterVertical | LLAlignmentToRightOf,
    LLAlignmentAboveCenterHorizontal = LLAlignmentAbove | LLAlignmentCenterHorizontal,
    LLAlignmentAboveToLeftOf = LLAlignmentAbove | LLAlignmentToLeftOf,
    LLAlignmentAboveToRightOf = LLAlignmentAbove | LLAlignmentToRightOf,
    LLAlignmentBelowCenterHorizontal = LLAlignmentBelow | LLAlignmentCenterHorizontal,
    LLAlignmentBelowToLeftOf = LLAlignmentBelow | LLAlignmentToLeftOf,
    LLAlignmentBelowToRightOf = LLAlignmentBelow | LLAlignmentToRightOf
};

#pragma mark CGFloat

extern inline CGFloat LL_CGFloatFloor(CGFloat value);
extern inline CGFloat LL_CGFloatCeil(CGFloat value);
extern inline CGFloat LL_CGFloatRound(CGFloat value);
extern inline CGFloat LL_CGFloatAbs(CGFloat value);

#pragma mark CGRect

extern inline CGRect LL_CGRectFloor(CGRect rect);
extern inline CGRect LL_CGRectCeil(CGRect rect);
extern inline CGRect LL_CGRectRound(CGRect rect);
                                    
extern inline CGRect LL_CGRectZeroOriginWithSize(CGSize size);
extern inline CGRect LL_CGRectInset(CGRect rect, UIEdgeInsets edgeInsets);

extern inline CGRect LL_CGRectAlignWithOffset(const CGRect alignRect, CGRect rect, LLAlignment alignment, CGPoint offset);
extern inline CGRect LL_CGRectAlign(const CGRect alignRect, CGRect rect, LLAlignment alignment);
extern inline CGRect LL_CGRectPlaceSizeWithOffset(const CGRect alignRect, CGSize size, LLAlignment alignment, CGPoint offset);
extern inline CGRect LL_CGRectPlaceSize(const CGRect alignRect, CGSize size, LLAlignment alignment);

extern inline CGPoint LL_CGRectGetPoint(CGRect rect, LLAlignment position);


#pragma mark CGSize

extern inline CGRect LL_UIEdgeInsetsOffsetRect(CGRect rect, UIEdgeInsets edgeInsets);

extern inline CGSize LL_CGSizeFloor(CGSize size);
extern inline CGSize LL_CGSizeCeil(CGSize size);
extern inline CGSize LL_CGSizeRound(CGSize size);

extern inline CGSize LL_CGSizeUnion(CGSize s1, CGSize s2);
extern inline CGSize LL_CGSizeAdd(CGSize s1, CGSize s2);
extern inline CGSize LL_CGSizeInset(CGSize size, CGFloat dw, CGFloat dh);
extern inline CGSize LL_CGSizeCombine(CGSize s1, CGSize s2, LLAlignment relativePosition);

#pragma mark CGPoint

extern inline CGPoint LL_CGPointFloor(CGPoint point);
extern inline CGPoint LL_CGPointCeil(CGPoint point);
extern inline CGPoint LL_CGPointRound(CGPoint point);
extern inline CGPoint LL_CGPointModulus(CGPoint point);

extern inline CGPoint LL_CGPointAdd(CGPoint p1, CGPoint p2);
extern inline CGPoint LL_CGPointSubtract(CGPoint minuend, CGPoint subtrahend);

extern inline CGPoint LL_CGPointScalarMultiply(CGPoint point, CGFloat scalarValue);
extern inline CGPoint LL_CGPointScalarDivide(CGPoint point, CGFloat divisor);

extern inline CGFloat LL_CGPointMagnitude(CGPoint p1);
extern inline CGPoint LL_CGPointClamp(CGPoint min, CGPoint max, CGPoint value);
extern inline CGPoint LL_CGPointNormalize(CGPoint point);

#pragma mark UIEdgeInsets

extern inline UIEdgeInsets LL_UIEdgeInsetsCeil(UIEdgeInsets edgeInsets);
extern inline UIEdgeInsets LL_UIEdgeInsetsFloor(UIEdgeInsets edgeInsets);
extern inline UIEdgeInsets LL_UIEdgeInsetsRound(UIEdgeInsets edgeInsets);
extern inline UIEdgeInsets LL_UIEdgeInsetsAbs(UIEdgeInsets edgeInsets);

extern inline UIEdgeInsets LL_UIEdgeInsetsAdd(UIEdgeInsets first, UIEdgeInsets second);
extern inline UIEdgeInsets LL_UIEdgeInsetsSubtract(UIEdgeInsets first, UIEdgeInsets second);

extern inline UIEdgeInsets LL_UIEdgeInsetsMin(UIEdgeInsets first, UIEdgeInsets second);
extern inline UIEdgeInsets LL_UIEdgeInsetsMax(UIEdgeInsets first, UIEdgeInsets second);

#pragma mark LLAlignment

extern inline LLAlignment LLAlignmentFromPoint(CGPoint point, CGPoint comparisonPoint);

#pragma mark CGAffineTransform

extern inline CGFloat LL_CGAffineTransformGetRotation(CGAffineTransform transform);
