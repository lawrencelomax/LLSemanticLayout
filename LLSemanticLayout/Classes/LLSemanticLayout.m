//
//  LLSemanticLayout.m
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 2/11/2013.
//  Copyright (c) 2013 Lawrence Lomax. All rights reserved.
//

#import "LLSemanticLayout.h"

#import "LLGeometryUtilities.h"

extern CGFloat LL_CGFunction(GetValue)(CGRect rect, LLAlignment alignment)
{
    LLAlignment horizontalAlignment = alignment & LLAlignmentHorizontalAll;
    if(horizontalAlignment != LLAlignmentNone)
    {
        switch (horizontalAlignment)
        {
            case LLAlignmentLeft:
            case LLAlignmentLeftInside:
            case LLAlignmentLeftOutside:
            case LLAlignmentLeftOn:
            case LLAlignmentLeftAll:
                return CGRectGetMinX(rect);
            case LLAlignmentRight:
            case LLAlignmentRightInside:
            case LLAlignmentRightOutside:
            case LLAlignmentRightOn:
            case LLAlignmentRightAll:
                return CGRectGetMaxX(rect);
            case LLAlignmentCenterHorizontal:
                return CGRectGetMidX(rect);
            default:
                break;
        }
    }
    
    LLAlignment verticalAlignment = alignment & LLAlignmentVerticalAll;
    if(verticalAlignment != LLAlignmentNone)
    {
        switch (verticalAlignment)
        {
            case LLAlignmentTop:
            case LLAlignmentTopInside:
            case LLAlignmentTopOutside:
            case LLAlignmentTopOn:
            case LLAlignmentTopAll:
                return CGRectGetMaxY(rect);
                break;
            case LLAlignmentBottom:
            case LLAlignmentBottomInside:
            case LLAlignmentBottomOutside:
            case LLAlignmentBottomOn:
            case LLAlignmentBottomAll:
                return CGRectGetMinY(rect);
                break;
            case LLAlignmentCenterVertical:
                return CGRectGetMidY(rect);
                break;
            default:
                break;
        }
    }
    
    return NAN;
}

extern CGPoint LL_CGFunction(GetPoint)(CGRect rect, LLAlignment alignment)
{
    CGPoint point = CGPointZero;
    point.x = LL_CGFunctionCall(GetValue)(rect, alignment & LLAlignmentHorizontalAll);
    point.y = LL_CGFunctionCall(GetValue)(rect, alignment & LLAlignmentVerticalAll);
    return point;
}

extern CGRect LL_CGFunction(AlignWithOffset)(const CGRect alignRect, CGRect rect, LLAlignment alignment, CGPoint offset)
{
    LLAlignment horizontalAlignment = alignment & LLAlignmentHorizontalAll;
    switch (horizontalAlignment) {
        case LLAlignmentLeftInside:
            rect.origin.x = CGRectGetMinX(alignRect) + offset.x;
            break;
        case LLAlignmentLeftOutside:
            rect.origin.x = CGRectGetMinX(alignRect) - CGRectGetWidth(rect) + offset.x;
            break;
        case LLAlignmentLeftOn:
            rect.origin.x = CGRectGetMinX(alignRect) - (CGRectGetWidth(rect) / 2) + offset.x;
            break;
        case LLAlignmentRightInside:
            rect.origin.x = CGRectGetMaxX(alignRect) - CGRectGetWidth(rect) + offset.x;
            break;
        case LLAlignmentRightOutside:
            rect.origin.x = CGRectGetMaxX(alignRect) + offset.x;
            break;
        case LLAlignmentRightOn:
            rect.origin.x = CGRectGetMaxX(alignRect) - (CGRectGetWidth(rect) / 2) + offset.x;
            break;
        case LLAlignmentCenterHorizontal:
            rect.origin.x = CGRectGetMidX(alignRect) - (CGRectGetWidth(rect) / 2) + offset.x;
            break;
        default:
            break;
    }
    
    LLAlignment verticalAlignment = alignment & LLAlignmentVerticalAll;
    switch (verticalAlignment) {
        case LLAlignmentTopInside:
            rect.origin.y = CGRectGetMinY(alignRect) + offset.y;
            break;
        case LLAlignmentTopOutside:
            rect.origin.y = CGRectGetMinY(alignRect) - CGRectGetHeight(rect) + offset.y;
            break;
        case LLAlignmentTopOn:
            rect.origin.y = CGRectGetMinY(alignRect) - (CGRectGetHeight(rect) / 2) + offset.y;
            break;
        case LLAlignmentBottomInside:
            rect.origin.y = CGRectGetMaxY(alignRect) - CGRectGetHeight(rect) + offset.y;
            break;
        case LLAlignmentBottomOutside:
            rect.origin.y = CGRectGetMaxY(alignRect) + offset.y;
            break;
        case LLAlignmentBottomOn:
            rect.origin.y = CGRectGetMinY(alignRect) - (CGRectGetHeight(rect) / 2) + offset.y;
            break;
        case LLAlignmentCenterVertical:
            rect.origin.y = CGRectGetMidY(alignRect) - (CGRectGetHeight(rect) / 2) + offset.y;
            break;
        default:
            break;
    }
    
    return rect;
}

extern CGRect LL_CGFunction(Align)(const CGRect alignRect, CGRect rect, LLAlignment alignment)
{
    return LL_CGFunctionCall(AlignWithOffset)(alignRect, rect, alignment, CGPointZero);
}

extern CGRect LL_CGFunction(PlaceSizeWithOffset)(const CGRect alignRect, CGSize size, LLAlignment alignment, CGPoint offset)
{
    return LL_CGFunctionCall(AlignWithOffset)(alignRect, LL_CGFunctionCall(ZeroOriginWithSize)(size), alignment, offset);
}

extern CGRect LL_CGFunction(PlaceSize)(const CGRect alignRect, CGSize size, LLAlignment alignment)
{
    return LL_CGFunctionCall(PlaceSizeWithOffset)(alignRect, size, alignment, CGPointZero);
}

extern CGSize LL_CGFunction(Combine)(CGSize s1, CGSize s2, LLAlignment alignment)
{
    CGRect frame1 = LL_CGFunctionCall(ZeroOriginWithSize)(s1);
    CGRect frame2 = LL_CGFunctionCall(ZeroOriginWithSize)(s2);
    frame2 = LL_CGFunctionCall(Align)(frame1, frame2, alignment);
    CGSize result = CGRectUnion(frame1, frame2).size;
    return result;
}

#pragma mark LLAlignment

extern LLAlignment LLAlignmentFromPoint(CGPoint point, CGPoint comparisonPoint)
{
    const CGPoint delta = LL_CGFunctionCall(Subtract)(comparisonPoint, point);
    LLAlignment alignment = LLAlignmentNone;
    
    //Horizontal
    if(delta.x == 0)
        alignment |= LLAlignmentCenterHorizontal;
    else if (delta.x > 0)
        alignment |= LLAlignmentToRightOf;
    else if(delta.x < 0)
        alignment |= LLAlignmentToLeftOf;
    
    //Vertical
    if(delta.y == 0)
        alignment |= LLAlignmentCenterVertical;
    else if (delta.y > 0)
        alignment |= LLAlignmentAbove;
    else if(delta.y < 0)
        alignment |= LLAlignmentBelow;
    
    return alignment;
}

extern LLAlignment LLAlignmentComparePointToRect(CGRect rect, CGPoint point)
{
    LLAlignment alignment = LLAlignmentNone;
    
    if(point.x == CGRectGetMidX(rect))
        alignment |= LLAlignmentCenterHorizontal;
    else if(point.x < CGRectGetMinX(rect))
        alignment |= LLAlignmentToLeftOf;
    else if(point.x > CGRectGetMaxX(rect))
        alignment |= LLAlignmentToRightOf;
    else
        alignment |= LLAlignmentHorizontalInside;
    
    if(point.y == CGRectGetMidY(rect))
        alignment |= LLAlignmentCenterVertical;
    else if(point.y < CGRectGetMinY(rect))
        alignment |= LLAlignmentBelow;
    else if(point.y > CGRectGetMaxY(rect))
        alignment |= LLAlignmentAbove;
    else
        alignment |= LLAlignmentVerticalInside;
    
    
    return alignment;
}

