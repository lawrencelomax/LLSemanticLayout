//
//  LLGeometryUtilities.m
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 12/11/2012.
//  Copyright (c) 2012 Lawrence Lomax. All rights reserved.
//

#import "LLGeometryUtilities.h"

#pragma mark CGFloat

extern inline CGFloat LL_CGFloatFloor(CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return floor(value);
#else
    return floorf(value);
#endif
}

extern inline CGFloat LL_CGFloatCeil(CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return ceil(value);
#else
    return ceilf(value);
#endif
}

extern inline CGFloat LL_CGFloatRound(CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return ceil(value);
#else
    return ceilf(value);
#endif
    
}

extern inline CGFloat LL_CGFloatAbs(CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return round(value);
#else
    return roundf(value);
#endif
}

#pragma mark CGRect

extern inline CGRect LL_CGRectFloor(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGPointFloor(rect.origin);
    retRect.size = LL_CGSizeFloor(rect.size);
    return retRect;
}

extern inline CGRect LL_CGRectCeil(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGPointCeil(rect.origin);
    retRect.size = LL_CGSizeCeil(rect.size);
    return retRect;
}

extern inline CGRect LL_CGRectRound(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGPointRound(rect.origin);
    retRect.size = LL_CGSizeRound(rect.size);
    return retRect;
}

extern inline CGRect LL_CGRectZeroOriginWithSize(CGSize size)
{
    CGRect rect = CGRectZero;
    rect.size = size;
    return rect;
}

extern inline CGRect LL_CGRectInset(CGRect rect, UIEdgeInsets edgeInsets)
{
    CGRect newRect = rect;
    newRect.size.height -= edgeInsets.top;
    newRect.size.height -= edgeInsets.bottom;
    newRect.size.width -= edgeInsets.left;
    newRect.size.width -= edgeInsets.right;
    newRect.origin.x += edgeInsets.left;
    newRect.origin.y += edgeInsets.right;
    return newRect;
}

extern inline CGPoint LL_CGRectGetPoint(CGRect rect, LLAlignment alignment)
{
    CGPoint point = CGPointZero;
    
    LLAlignment horizontalAlignment = alignment & LLAligmentHorizontal;
    switch (horizontalAlignment) {
        case LLAlignmentLeft:
        case LLAlignmentLeftInside:
        case LLAlignmentLeftOutside:
        case LLAlignmentLeftOn:
            point.x = CGRectGetMinX(rect);
            break;
        case LLAlignmentRight:
        case LLAlignmentRightInside:
        case LLAlignmentRightOutside:
        case LLAlignmentRightOn:
            point.x = CGRectGetMaxX(rect);
            break;
        case LLAlignmentCenterHorizontal:
            point.x = CGRectGetMidX(rect);
            break;
        default:
            break;
            
    }
    
    LLAlignment verticalAlignment = alignment & LLAlignmentVertical;
    switch (verticalAlignment) {
        case LLAlignmentTop:
        case LLAlignmentTopInside:
        case LLAlignmentTopOutside:
        case LLAlignmentTopOn:
            point.y = CGRectGetMaxY(rect);
            break;
        case LLAlignmentBottom:
        case LLAlignmentBottomInside:
        case LLAlignmentBottomOutside:
        case LLAlignmentBottomOn:
            point.y = CGRectGetMinY(rect);
            break;
        case LLAlignmentCenterVertical:
            point.y = CGRectGetMidY(rect);
            break;
        default:
            break;
    }
    
    return point;
}

extern inline CGRect LL_CGRectAlignWithOffset(const CGRect alignRect, CGRect rect, LLAlignment alignment, CGPoint offset)
{
    LLAlignment horizontalAlignment = alignment & LLAligmentHorizontal;
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
    
    LLAlignment verticalAlignment = alignment & LLAlignmentVertical;
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

extern inline CGRect LL_CGRectAlign(const CGRect alignRect, CGRect rect, LLAlignment alignment)
{
    return LL_CGRectAlignWithOffset(alignRect, rect, alignment, CGPointZero);
}

extern inline CGRect LL_CGRectPlaceSizeWithOffset(const CGRect alignRect, CGSize size, LLAlignment alignment, CGPoint offset)
{
    return LL_CGRectAlignWithOffset(alignRect, LL_CGRectZeroOriginWithSize(size), alignment, offset);
}

extern inline CGRect LL_CGRectPlaceSize(const CGRect alignRect, CGSize size, LLAlignment alignment)
{
    return LL_CGRectPlaceSizeWithOffset(alignRect, size, alignment, CGPointZero);
}

#pragma mark CGSize

extern inline CGSize LL_CGSizeFloor(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFloatFloor(size.width), LL_CGFloatFloor(size.height));
    return result;
}

extern inline CGSize LL_CGSizeCeil(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFloatCeil(size.width), LL_CGFloatCeil(size.height));
    return result;
}

extern inline CGSize LL_CGSizeRound(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFloatRound(size.width), LL_CGFloatRound(size.height));
    return result;
}

extern inline CGSize LL_CGSizeUnion(CGSize s1, CGSize s2)
{
    CGRect r1 = LL_CGRectZeroOriginWithSize(s1);
    CGRect r2 = LL_CGRectZeroOriginWithSize(s2);
    CGRect rect = CGRectUnion(r1, r2);
    return rect.size;
}

extern inline CGSize LL_CGSizeAdd(CGSize s1, CGSize s2)
{
    CGSize result = CGSizeMake(s1.width + s2.width, s1.height + s2.height);
    return result;
}

extern inline CGSize LL_CGSizeInset(CGSize size, CGFloat dw, CGFloat dh)
{
    CGSize newSize = size;
    newSize.width += dw;
    newSize.height += dh;
    return newSize;
}

extern inline CGSize LL_CGSizeCombine(CGSize s1, CGSize s2, LLAlignment alignment)
{
    CGRect frame1 = LL_CGRectZeroOriginWithSize(s1);
    CGRect frame2 = LL_CGRectZeroOriginWithSize(s2);
    frame2 = LL_CGRectAlign(frame1, frame2, alignment);
    CGSize result = CGRectUnion(frame1, frame2).size;
    return result;
}

#pragma mark CGPoint

extern inline CGPoint LL_CGPointFloor(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFloatFloor(point.x), LL_CGFloatFloor(point.y));
    return result;
}

extern inline CGPoint LL_CGPointCeil(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFloatCeil(point.x), LL_CGFloatCeil(point.y));
    return result;    
}

extern inline CGPoint LL_CGPointRound(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFloatRound(point.x), LL_CGFloatRound(point.y));
    return result;
}

extern inline CGPoint LL_CGPointSubtract(CGPoint minuend, CGPoint subtrahend)
{
    CGPoint result = CGPointMake(minuend.x - subtrahend.x, minuend.y - subtrahend.y);
    return result;
}

extern inline CGPoint LL_CGPointAdd(CGPoint p1, CGPoint p2)
{
    CGPoint point = CGPointMake(p1.x + p2.x, p1.y + p2.y);
    return point;
}

extern inline CGPoint LL_CGPointModulus(CGPoint point)
{
    CGPoint result = CGPointMake(ABS(point.x), ABS(point.y));
    return result;
}

extern inline CGPoint LL_CGPointScalarDivide(CGPoint point, CGFloat divisor)
{
    CGPoint result = CGPointMake((point.x / divisor), (point.y / divisor));
    return result;
}

extern inline CGPoint LL_CGPointScalarMultiply(CGPoint point, CGFloat scalarValue)
{
    CGPoint result = CGPointMake((point.x * scalarValue), (point.y * scalarValue));
    return result;
}

extern inline CGFloat LL_CGPointMagnitude(CGPoint point)
{
    CGFloat magnitude = sqrtf( (point.x * point.x) + (point.y * point.y) );
    return magnitude;
}

extern inline CGPoint LL_CGPointClamp(CGPoint min, CGPoint max, CGPoint value)
{
    CGPoint result = CGPointMake(LLClamp(min.x, max.x, value.x), LLClamp(min.y, max.y, value.y));
    return result;
}

extern inline CGPoint LL_CGPointNormalize(CGPoint point)
{
    CGFloat magnitude = LL_CGPointMagnitude(point);
    CGPoint result = LL_CGPointScalarMultiply(point, (1 / magnitude) );
    return result;
}

#pragma mark UIEdgeInsets

extern inline UIEdgeInsets LL_UIEdgeInsetsAdd(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(first.top + second.top, first.left + second.left, first.bottom + second.bottom, first.right + second.right);
    return edgeInsets;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsSubtract(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(first.top - second.top, first.left - second.left, first.bottom - second.bottom, first.right - second.right);
    return edgeInsets;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsAbs(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFloatAbs(edgeInsets.top), LL_CGFloatAbs(edgeInsets.left), LL_CGFloatAbs(edgeInsets.bottom), LL_CGFloatAbs(edgeInsets.right));
    return result;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsCeil(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFloatCeil(edgeInsets.top), LL_CGFloatCeil(edgeInsets.left), LL_CGFloatCeil(edgeInsets.bottom), LL_CGFloatCeil(edgeInsets.right));
    return result;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsFloor(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFloatFloor(edgeInsets.top), LL_CGFloatFloor(edgeInsets.left), LL_CGFloatFloor(edgeInsets.bottom), LL_CGFloatFloor(edgeInsets.right));
    return result;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsRound(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFloatRound(edgeInsets.top), LL_CGFloatRound(edgeInsets.left), LL_CGFloatRound(edgeInsets.bottom), LL_CGFloatRound(edgeInsets.right));
    return result;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsMin(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets result = UIEdgeInsetsMake(MIN(first.top, second.top), MIN(first.left, second.left), MIN(first.bottom, second.bottom), MIN(first.right, second.right));
    return result;
}

extern inline UIEdgeInsets LL_UIEdgeInsetsMax(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets result = UIEdgeInsetsMake(MAX(first.top, second.top), MAX(first.left, second.left), MAX(first.bottom, second.bottom), MAX(first.right, second.right));
    return result;
}

#pragma mark CGAffineTransform

extern inline CGFloat LL_CGAffineTransformGetRotation(CGAffineTransform transform)
{
    CGFloat value = atan2(transform.b, transform.a);
    return value;
}

