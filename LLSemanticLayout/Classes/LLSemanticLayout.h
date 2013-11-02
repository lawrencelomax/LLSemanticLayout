//
//  LLSemanticLayout.h
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 2/11/2013.
//  Copyright (c) 2013 Lawrence Lomax. All rights reserved.
//

#import <UIKit/UIKit.h>

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
    
    LLAlignmentHorizontalAll = (LLAlignmentLeftAll | LLAlignmentRightAll | LLAlignmentCenterHorizontal),
    
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

#pragma mark LLAlignment

extern inline LLAlignment LLAlignmentFromPoint(CGPoint point, CGPoint comparisonPoint);
extern inline LLAlignment LLAlignmentComparePointToRect(CGRect rect, CGPoint point);

extern inline CGFloat LL_CGRectGetValue(CGRect rect, LLAlignment position);
extern inline CGPoint LL_CGRectGetPoint(CGRect rect, LLAlignment position);

extern inline CGSize LL_CGSizeCombine(CGSize s1, CGSize s2, LLAlignment relativePosition);

extern inline CGRect LL_CGRectAlignWithOffset(const CGRect alignRect, CGRect rect, LLAlignment alignment, CGPoint offset);
extern inline CGRect LL_CGRectAlign(const CGRect alignRect, CGRect rect, LLAlignment alignment);
extern inline CGRect LL_CGRectPlaceSizeWithOffset(const CGRect alignRect, CGSize size, LLAlignment alignment, CGPoint offset);
extern inline CGRect LL_CGRectPlaceSize(const CGRect alignRect, CGSize size, LLAlignment alignment);

