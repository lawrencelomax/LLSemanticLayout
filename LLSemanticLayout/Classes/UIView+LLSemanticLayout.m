//
//  UIView+LLSemanticLayoutExtensions.m
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 08/01/2013.
//  Copyright (c) 2013 Lawrence Lomax. All rights reserved.
//

#import "UIView+LLSemanticLayout.h"

@implementation UIView (LLSemanticLayout)

#pragma mark Helpers

- (BOOL) ll_isSibling:(UIView *)view
{
    return (view.superview != nil && self.superview != nil && view.superview == self.superview);
}

#pragma mark Alignment Based

- (void) ll_alignToView:(UIView *)view withAlignment:(LLAlignment)alignment
{
    [self ll_alignToView:view withAlignment:alignment andOffset:CGPointZero];
}

- (void) ll_alignToView:(UIView *)view withAlignment:(LLAlignment)alignment andOffset:(CGPoint)offset
{
    if(![self ll_isSibling:view])
        return;
    
    CGRect alignRect = [view convertRect:view.bounds toView:view.superview];
    CGRect frame = LL_CGFunctionCall(Align)(alignRect, self.frame, alignment);
    self.frame = frame;
}

@end
