//
//  LLGeometryUtilities.m
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 12/11/2012.
//  Copyright (c) 2012 Lawrence Lomax. All rights reserved.
//

#import "LLGeometryUtilities.h"

#pragma mark CGFloat

extern CGFloat LL_CGFunction(Floor) (CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return floor(value);
#else
    return floorf(value);
#endif
}

extern CGFloat LL_CGFunction(Ceil) (CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return ceil(value);
#else
    return ceilf(value);
#endif
}

extern CGFloat LL_CGFunction(Round) (CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return ceil(value);
#else
    return ceilf(value);
#endif
    
}

extern CGFloat LL_CGFunction(Abs) (CGFloat value)
{
#ifdef CGFLOAT_IS_DOUBLE
    return round(value);
#else
    return roundf(value);
#endif
}

#pragma mark CGRect

extern CGRect LL_CGFunction(Offset)(CGRect rect, UIEdgeInsets edgeInsets)
{
    CGRect result = CGRectMake(rect.origin.x + edgeInsets.left, rect.origin.y + edgeInsets.top,
                               rect.size.width + edgeInsets.left + edgeInsets.right, rect.size.height + edgeInsets.top + edgeInsets.bottom);
    return result;
}

extern CGRect LL_CGFunction(Floor)(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGFunctionCall(Floor)(rect.origin);
    retRect.size = LL_CGFunctionCall(Floor)(rect.size);
    return retRect;
}

extern CGRect LL_CGFunction(Ceil)(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGFunctionCall(Ceil)(rect.origin);
    retRect.size = LL_CGFunctionCall(Ceil)(rect.size);
    return retRect;
}

extern CGRect LL_CGFunction(Round)(CGRect rect)
{
    CGRect retRect;
    retRect.origin = LL_CGFunctionCall(Round)(rect.origin);
    retRect.size = LL_CGFunctionCall(Round)(rect.size);
    return retRect;
}

extern CGRect LL_CGFunction(ZeroOriginWithSize)(CGSize size)
{
    CGRect rect = CGRectZero;
    rect.size = size;
    return rect;
}

extern CGRect LL_CGFunction(Inset)(CGRect rect, UIEdgeInsets edgeInsets)
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

#pragma mark CGSize

extern CGSize LL_CGFunction(Floor)(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFunctionCall(Floor)(size.width), LL_CGFunctionCall(Floor)(size.height));
    return result;
}

extern CGSize LL_CGFunction(Ceil)(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFunctionCall(Ceil)(size.width), LL_CGFunctionCall(Ceil)(size.height));
    return result;
}

extern CGSize LL_CGFunction(Round)(CGSize size)
{
    CGSize result = CGSizeMake(LL_CGFunctionCall(Round)(size.width), LL_CGFunctionCall(Round)(size.height));
    return result;
}

extern CGSize LL_CGFunction(Union)(CGSize s1, CGSize s2)
{
    CGRect r1 = LL_CGFunctionCall(ZeroOriginWithSize)(s1);
    CGRect r2 = LL_CGFunctionCall(ZeroOriginWithSize)(s2);
    CGRect rect = CGRectUnion(r1, r2);
    return rect.size;
}

extern CGSize LL_CGFunction(Add)(CGSize s1, CGSize s2)
{
    CGSize result = CGSizeMake(s1.width + s2.width, s1.height + s2.height);
    return result;
}

extern CGSize LL_CGFunction(Inset)(CGSize size, CGFloat dw, CGFloat dh)
{
    CGSize newSize = size;
    newSize.width += dw;
    newSize.height += dh;
    return newSize;
}

#pragma mark CGPoint

extern CGPoint LL_CGFunction(Floor)(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFunctionCall(Floor)(point.x), LL_CGFunctionCall(Floor)(point.y));
    return result;
}

extern CGPoint LL_CGFunction(Ceil)(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFunctionCall(Ceil)(point.x), LL_CGFunctionCall(Ceil)(point.y));
    return result;    
}

extern CGPoint LL_CGFunction(Round)(CGPoint point)
{
    CGPoint result = CGPointMake(LL_CGFunctionCall(Round)(point.x), LL_CGFunctionCall(Round)(point.y));
    return result;
}

extern CGPoint LL_CGFunction(Subtract)(CGPoint minuend, CGPoint subtrahend)
{
    CGPoint result = CGPointMake(minuend.x - subtrahend.x, minuend.y - subtrahend.y);
    return result;
}

extern CGPoint LL_CGFunction(Add)(CGPoint p1, CGPoint p2)
{
    CGPoint point = CGPointMake(p1.x + p2.x, p1.y + p2.y);
    return point;
}

extern CGPoint LL_CGFunction(Modulus)(CGPoint point)
{
    CGPoint result = CGPointMake(ABS(point.x), ABS(point.y));
    return result;
}

extern CGPoint LL_CGFunction(Divide)(CGPoint point, CGFloat divisor)
{
    CGPoint result = CGPointMake((point.x / divisor), (point.y / divisor));
    return result;
}

extern CGPoint LL_CGFunction(Multiply)(CGPoint point, CGFloat scalarValue)
{
    CGPoint result = CGPointMake((point.x * scalarValue), (point.y * scalarValue));
    return result;
}

extern CGPoint LL_CGFunction(Multiply)(CGPoint p1, CGPoint p2)
{
    CGPoint result = CGPointMake((p1.x * p2.x), (p1.y * p2.y));
    return result;
}

extern CGPoint LL_CGFunction(Divide)(CGPoint point, CGPoint divisor)
{
    CGPoint result = CGPointMake((point.x / divisor.x), (point.y / divisor.y));
    return result;
}

extern CGFloat LL_CGFunction(Magnitude)(CGPoint point)
{
    CGFloat magnitude = sqrtf( (point.x * point.x) + (point.y * point.y) );
    return magnitude;
}

extern CGPoint LL_CGFunction(Clamp)(CGPoint min, CGPoint max, CGPoint value)
{
    CGPoint result = CGPointMake(LLClamp(min.x, max.x, value.x), LLClamp(min.y, max.y, value.y));
    return result;
}

extern CGPoint LL_CGFunction(Normalize)(CGPoint point)
{
    CGFloat magnitude = LL_CGFunctionCall(Magnitude)(point);
    CGPoint result = LL_CGFunctionCall(Multiply)(point, (1 / magnitude) );
    return result;
}

extern CGFloat LL_CGFunction(GetAngleRadians)(CGPoint point)
{
    return (CGFloat) atan2f(point.y, point.x);
}

#pragma mark UIEdgeInsets

extern UIEdgeInsets LL_CGFunction(Add)(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(first.top + second.top, first.left + second.left, first.bottom + second.bottom, first.right + second.right);
    return edgeInsets;
}

extern UIEdgeInsets LL_CGFunction(Subtract)(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(first.top - second.top, first.left - second.left, first.bottom - second.bottom, first.right - second.right);
    return edgeInsets;
}

extern UIEdgeInsets LL_CGFunction(Abs)(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFunctionCall(Abs)(edgeInsets.top), LL_CGFunctionCall(Abs)(edgeInsets.left), LL_CGFunctionCall(Abs)(edgeInsets.bottom), LL_CGFunctionCall(Abs)(edgeInsets.right));
    return result;
}

extern UIEdgeInsets LL_CGFunction(Ceil)(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFunctionCall(Ceil)(edgeInsets.top), LL_CGFunctionCall(Ceil)(edgeInsets.left), LL_CGFunctionCall(Ceil)(edgeInsets.bottom), LL_CGFunctionCall(Ceil)(edgeInsets.right));
    return result;
}

extern UIEdgeInsets LL_CGFunction(Floor)(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFunctionCall(Floor)(edgeInsets.top), LL_CGFunctionCall(Floor)(edgeInsets.left), LL_CGFunctionCall(Floor)(edgeInsets.bottom), LL_CGFunctionCall(Floor)(edgeInsets.right));
    return result;
}

extern UIEdgeInsets LL_CGFunction(Round)(UIEdgeInsets edgeInsets)
{
    UIEdgeInsets result = UIEdgeInsetsMake(LL_CGFunctionCall(Round)(edgeInsets.top), LL_CGFunctionCall(Round)(edgeInsets.left), LL_CGFunctionCall(Round)(edgeInsets.bottom), LL_CGFunctionCall(Round)(edgeInsets.right));
    return result;
}

extern UIEdgeInsets LL_CGFunction(Min)(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets result = UIEdgeInsetsMake(MIN(first.top, second.top), MIN(first.left, second.left), MIN(first.bottom, second.bottom), MIN(first.right, second.right));
    return result;
}

extern UIEdgeInsets LL_CGFunction(Max)(UIEdgeInsets first, UIEdgeInsets second)
{
    UIEdgeInsets result = UIEdgeInsetsMake(MAX(first.top, second.top), MAX(first.left, second.left), MAX(first.bottom, second.bottom), MAX(first.right, second.right));
    return result;
}

#pragma mark CGAffineTransform

extern CGFloat LL_CGFunction(GetRotation)(CGAffineTransform transform)
{
    CGFloat value = atan2(transform.b, transform.a);
    return value;
}

