//
//  LLGeometryUtilities.h
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 12/11/2012.
//  Copyright (c) 2012 Lawrence Lomax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef LL_CGFunction
#ifdef LL_CG_NAMESPACE
#define LL_CGFunction(fun) __attribute__((overloadable)) CG##fun
#else
#define LL_CGFunction(fun) __attribute__((overloadable)) LL_CG##fun
#endif
#endif

#ifndef LL_CGFunctionCall
#ifdef LL_CG_NAMESPACE
#define LL_CGFunctionCall(fun) CG##fun
#else
#define LL_CGFunctionCall(fun) LL_CG##fun
#endif
#endif

#ifndef LLClamp
#define LLClamp(min, max, value) ((value < min) ? min : ((value > max) ? max : value))
#endif

#ifndef LLScale
#define LLScale(minStart, maxStart, minEnd, maxEnd, value) ( minEnd + (value * (maxEnd - minEnd)) )
#endif

#define LLDegreesToRadians(x) (M_PI * x / 180.0)

#pragma mark CGFloat

extern CGFloat LL_CGFunction(Floor) (CGFloat value);
extern CGFloat LL_CGFunction(Ceil) (CGFloat value);
extern CGFloat LL_CGFunction(Round) (CGFloat value);
extern CGFloat LL_CGFunction(Abs) (CGFloat value);

#pragma mark CGRect

extern CGRect LL_CGFunction(Floor) (CGRect rect);
extern CGRect LL_CGFunction(Ceil) (CGRect rect);
extern CGRect LL_CGFunction(Round) (CGRect rect);
                                    
extern CGRect LL_CGFunction(ZeroOriginWithSize) (CGSize size);
extern CGRect LL_CGFunction(Inset) (CGRect rect, UIEdgeInsets edgeInsets);

#pragma mark CGSize

extern CGRect LL_CGFunction(Offset) (CGRect rect, UIEdgeInsets edgeInsets);

extern CGSize LL_CGFunction(Floor) (CGSize size);
extern CGSize LL_CGFunction(Ceil) (CGSize size);
extern CGSize LL_CGFunction(Round) (CGSize size);

extern CGSize LL_CGFunction(Union) (CGSize s1, CGSize s2);
extern CGSize LL_CGFunction(Add) (CGSize s1, CGSize s2);
extern CGSize LL_CGFunction(Inset) (CGSize size, CGFloat dw, CGFloat dh);

#pragma mark CGPoint

extern CGPoint LL_CGFunction(Floor) (CGPoint point);
extern CGPoint LL_CGFunction(Ceil) (CGPoint point);
extern CGPoint LL_CGFunction(Round) (CGPoint point);
extern CGPoint LL_CGFunction(Modulus) (CGPoint point);

extern CGPoint LL_CGFunction(Add) (CGPoint p1, CGPoint p2);
extern CGPoint LL_CGFunction(Subtract) (CGPoint minuend, CGPoint subtrahend);

extern CGPoint LL_CGFunction(Multiply)(CGPoint point, CGFloat scalarValue);
extern CGPoint LL_CGFunction(Divide)(CGPoint point, CGFloat divisor);

extern CGPoint LL_CGFunction(Multiply) (CGPoint p1, CGPoint p2);
extern CGPoint LL_CGFunction(Divide) (CGPoint point, CGPoint divisor);

extern CGFloat LL_CGFunction(Magnitude) (CGPoint p1);
extern CGPoint LL_CGFunction(Clamp) (CGPoint min, CGPoint max, CGPoint value);
extern CGPoint LL_CGFunction(Normalize) (CGPoint point);

extern CGFloat LL_CGFunction(GetAngleRadians) (CGPoint point);

#pragma mark UIEdgeInsets

extern UIEdgeInsets LL_CGFunction(Ceil) (UIEdgeInsets edgeInsets);
extern UIEdgeInsets LL_CGFunction(Floor) (UIEdgeInsets edgeInsets);
extern UIEdgeInsets LL_CGFunction(Round) (UIEdgeInsets edgeInsets);
extern UIEdgeInsets LL_CGFunction(Abs) (UIEdgeInsets edgeInsets);

extern UIEdgeInsets LL_CGFunction(Add) (UIEdgeInsets first, UIEdgeInsets second);
extern UIEdgeInsets LL_CGFunction(Subtract) (UIEdgeInsets first, UIEdgeInsets second);

extern UIEdgeInsets LL_CGFunction(Min) (UIEdgeInsets first, UIEdgeInsets second);
extern UIEdgeInsets LL_CGFunction(Max) (UIEdgeInsets first, UIEdgeInsets second);

#pragma mark CGAffineTransform

extern CGFloat LL_CGFunction(GetRotation) (CGAffineTransform transform);
