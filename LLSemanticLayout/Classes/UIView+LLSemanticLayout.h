//
//  UIView+LLSemanticLayoutExtensions.h
//  LLSemanticLayout
//
//  Created by Lawrence Lomax on 08/01/2013.
//  Copyright (c) 2013 Lawrence Lomax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLGeometryUtilities.h"

@interface UIView (LLSemanticLayout)

#pragma mark Helpers

- (BOOL) ll_isSibling:(UIView *)view;

#pragma mark Alignment Based

- (void) ll_alignToView:(UIView *)view withAlignment:(LLAlignment)alignment;
- (void) ll_alignToView:(UIView *)view withAlignment:(LLAlignment)alignment andOffset:(CGPoint)offset;

@end
