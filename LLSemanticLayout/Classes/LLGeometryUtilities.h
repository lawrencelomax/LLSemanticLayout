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
    LLAlignmentVerticalInside = 1 << 1,
    LLAlignmentVerticalOutside = 1 << 2,
    LLAlignmentVerticalOn = 1 << 3,
    LLAlignmentTop = 1 << 4,
    LLAlignmentBottom = 1 << 5,
    LLAlignmentCenterVertical = 1 << 6,
    
    LLAlignmentTopInside = LLAlignmentTop | LLAlignmentVerticalInside,
    LLAlignmentTopOutside = LLAlignmentTop | LLAlignmentVerticalOutside,
    LLAlignmentTopOn = LLAlignmentTop | LLAlignmentVerticalOn,
    LLAlignmentTopAll = (LLAlignmentTopInside | LLAlignmentTopOutside | LLAlignmentTopOn),
    
    LLAlignmentBottomInside = LLAlignmentBottom | LLAlignmentVerticalInside,
    LLAlignmentBottomOutside = LLAlignmentBottom | LLAlignmentVerticalOutside,
    LLAlignmentBottomOn = LLAlignmentBottom | LLAlignmentVerticalOn,
    LLAlignmentBottomAll = (LLAlignmentBottomInside | LLAlignmentBottomOutside | LLAlignmentBottomOn),
    
    LLAlignmentVerticalAll = (LLAlignmentTopAll | LLAlignmentBottomAll | LLAlignmentCenterVertical),
    
    // Horizontal Aligment
    LLAlignmentHorizontalInside = 1 << 7,
    LLAlignmentHorizontalOutside = 1 << 8,
    LLAlignmentHorizontalOn = 1 << 9,
    LLAlignmentLeft = 1 << 10,
    LLAlignmentRight = 1 << 11,
    LLAlignmentCenterHorizontal = 1 << 12,
    
    LLAlignmentLeftInside = LLAlignmentLeft | LLAlignmentHorizontalInside,
    LLAlignmentLeftOutside = LLAlignmentLeft | LLAlignmentHorizontalOutside,
    LLAlignmentLeftOn = LLAlignmentLeft | LLAlignmentHorizontalOn,
    LLAlignmentLeftAll = (LLAlignmentLeftInside | LLAlignmentLeftOutside | LLAlignmentLeftOn),
    
    LLAlignmentRightInside = LLAlignmentRight | LLAlignmentHorizontalInside,
    LLAlignmentRightOutside = LLAlignmentRight | LLAlignmentHorizontalOutside,
    LLAlignmentRightOn = LLAlignmentRight | LLAlignmentHorizontalOn,
    LLAlignmentRightAll = (LLAlignmentRightInside | LLAlignmentRightOutside | LLAlignmentRightOn),
    
    LLAligmentHorizontalAll = (LLAlignmentLeftAll | LLAlignmentRightAll | LLAlignmentCenterHorizontal),
    
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
    LLAlignmentTopOnCenterHorizontal = LLAlignmentTopOn | LLAlignmentCenterHorizontal,
    LLAlignmentTopOnToLeftOf = LLAlignmentTopOn | LLAlignmentToLeftOf,
    LLAlignmentTopOnToRightOf = LLAlignmentTopOn | LLAlignmentToRightOf,
    LLAlignmentTopInsideCenterHorizontal = LLAlignmentTopInside | LLAlignmentCenterHorizontal,
    LLAlignmentTopInsideToLeftOf = LLAlignmentTopInside | LLAlignmentToLeftOf,
    LLAlignmentTopInsideToRightOf = LLAlignmentTopInside | LLAlignmentToRightOf,
    
    LLAlignmentBelowCenterHorizontal = LLAlignmentBelow | LLAlignmentCenterHorizontal,
    LLAlignmentBelowToLeftOf = LLAlignmentBelow | LLAlignmentToLeftOf,
    LLAlignmentBelowToRightOf = LLAlignmentBelow | LLAlignmentToRightOf,
    LLAlignmentBottomOnCenterHorizontal = LLAlignmentBottomOn | LLAlignmentCenterHorizontal,
    LLAlignmentBottomOnToLeftOf = LLAlignmentBottomOn | LLAlignmentToLeftOf,
    LLAlignmentBottomOnToRightOf = LLAlignmentBottomOn | LLAlignmentToRightOf,
    LLAlignmentBottomInsideCenterHorizontal = LLAlignmentBottomInside | LLAlignmentCenterHorizontal,
    LLAlignmentBottomInsideToLeftOf = LLAlignmentBottomInside | LLAlignmentToLeftOf,
    LLAlignmentBottomInsideToRightOf = LLAlignmentBottomInside | LLAlignmentToRightOf
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
extern inline LLAlignment LLAlignmentComparePointToRect(CGRect rect, CGPoint point);

#pragma mark CGAffineTransform

extern inline CGFloat LL_CGAffineTransformGetRotation(CGAffineTransform transform);
