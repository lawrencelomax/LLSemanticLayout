#import <Kiwi/Kiwi.h>

#import "LLGeometryUtilities.h"
#import "LLSemanticLayout.h"

SPEC_BEGIN(LLGeometryUtilitiesSpec)

describe(@"the geometry utilities", ^{

    describe(@"obtaining alignment", ^{
        
        context(@"point to rectangle", ^{
            
            const CGRect rect = CGRectMake(100, 100, 100, 100);
            
            context(@"horizontally inside", ^{
                
                it(@"vertically inside", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(150, 150))) should] equal:theValue(LLAlignmentCenter)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(150, 250))) should] equal:theValue(LLAlignmentAboveCenterHorizontal)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(150, 50))) should] equal:theValue(LLAlignmentBelowCenterHorizontal)];
                });
                
            });
            
            context(@"to left of", ^{
                
                it(@"vertically inside", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(50, 150))) should] equal:theValue(LLAlignmentCenterVerticalToLeftOf)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(50, 250))) should] equal:theValue(LLAlignmentAboveToLeftOf)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(50, 50))) should] equal:theValue(LLAlignmentBelowToLeftOf)];
                });
                
            });
            
            context(@"to right of", ^{

                it(@"vertically inside", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(250, 150))) should] equal:theValue(LLAlignmentCenterVerticalToRightOf)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(250, 250))) should] equal:theValue(LLAlignmentAboveToRightOf)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentComparePointToRect(rect, CGPointMake(250, 50))) should] equal:theValue(LLAlignmentBelowToRightOf)];
                });
                
            });
            
            
        });
        
        context(@"point to point", ^{
            
            const CGPoint point = CGPointMake(100, 100);
            
            context(@"horizontally aligned", ^{
                
                it(@"vertically aligned", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(100, 100))) should] equal:theValue(LLAlignmentCenter)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(100, 200))) should] equal:theValue(LLAlignmentAboveCenterHorizontal)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(100, 50))) should] equal:theValue(LLAlignmentBelowCenterHorizontal)];
                });
                
            });
            
            context(@"to the left of", ^{
                
                it(@"vertically aligned", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(50, 100))) should] equal:theValue(LLAlignmentCenterVerticalToLeftOf)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(50, 200))) should] equal:theValue(LLAlignmentAboveToLeftOf)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(50, 50))) should] equal:theValue(LLAlignmentBelowToLeftOf)];
                });
                
            });
            
            context(@"to the right of", ^{
                
                it(@"vertically aligned", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(200, 100))) should] equal:theValue(LLAlignmentCenterVerticalToRightOf)];
                });
                
                it(@"above", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(200, 200))) should] equal:theValue(LLAlignmentAboveToRightOf)];
                });
                
                it(@"below", ^{
                    [[theValue(LLAlignmentFromPoint(point, CGPointMake(200, 50))) should] equal:theValue(LLAlignmentBelowToRightOf)];
                });
                
            });
        });
        
        
    });
    
    describe(@"Obtaining positions functions", ^{
        
        const CGRect rectangle = CGRectMake(100, 100, 100, 100);

        context(@"obtaining values", ^{
           
            it(@"should obtain the left", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentLeftAll)) should] equal:theValue(100)];
            });
            
            it(@"should obtain the horizontal center", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentCenterHorizontal)) should] equal:theValue(150)];
            });
            
            it(@"should obtain the right", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentRightAll)) should] equal:theValue(200)];
            });
            
            it(@"should obtain the top", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentTopAll)) should] equal:theValue(200)];
            });
            
            it(@"should obtain the vertical center", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentCenterVertical)) should] equal:theValue(150)];
            });
            
            it(@"should obtain the bottom", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentLeftAll)) should] equal:theValue(100)];
            });
            
            it(@"should return nan for invalid enum", ^{
                [[theValue(LL_CGGetValue(rectangle, LLAlignmentNone)) should] equal:theValue(NAN)];
            });
            
        });
        
        context(@"obtaining points", ^{
            
            it(@"should obtain the top left", ^{
                [[theValue(LL_CGGetPoint(rectangle, LLAlignmentTopLeft)) should] equal:theValue(CGPointMake(100, 200))];
            });
            
            it(@"should obtain the top right", ^{
                [[theValue(LL_CGGetPoint(rectangle, LLAlignmentTopRight)) should] equal:theValue(CGPointMake(200, 200))];
            });
            
            it(@"should obtain the bottom left", ^{
                [[theValue(LL_CGGetPoint(rectangle, LLAlignmentBottomLeft)) should] equal:theValue(CGPointMake(100, 100))];
            });
            
            it(@"should obtain the bottom right", ^{
                [[theValue(LL_CGGetPoint(rectangle, LLAlignmentBottomRight)) should] equal:theValue(CGPointMake(200, 100))];
            });
            
            it(@"should obtain the center", ^{
                [[theValue(LL_CGGetPoint(rectangle, LLAlignmentCenter)) should] equal:theValue(CGPointMake(150, 150))];
            });

            
        });
       
        
    });
    
    context(@"aligning rectangles", ^{
       
        const CGRect alignRect = CGRectMake(100, 100, 100, 100);
        const CGRect placementRect = CGRectMake(10, 10, 10, 10);
        
        context(@"without offsets", ^{
            
            context(@"horizontally centered", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentCenter)) should] equal:theValue(CGRectMake(145, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentAboveCenterHorizontal)) should] equal:theValue(CGRectMake(145, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBelowCenterHorizontal)) should] equal:theValue(CGRectMake(145, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });

                it(@"bottom inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 190, 10, 10))];
                });
                
            });
            
            context(@"to the left of", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentCenterVerticalToLeftOf)) should] equal:theValue(CGRectMake(90, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentAboveCenterHorizontal)) should] equal:theValue(CGRectMake(145, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBelowCenterHorizontal)) should] equal:theValue(CGRectMake(145, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"bottom inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 190, 10, 10))];
                });
                
            });
            
            context(@"to the right of", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentCenterVerticalToRightOf)) should] equal:theValue(CGRectMake(200, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentAboveToRightOf)) should] equal:theValue(CGRectMake(200, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopOnToRightOf)) should] equal:theValue(CGRectMake(200, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentTopInsideToRightOf)) should] equal:theValue(CGRectMake(200, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBelowToRightOf)) should] equal:theValue(CGRectMake(200, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomOnToRightOf)) should] equal:theValue(CGRectMake(200, 95, 10, 10))];
                });
                
                it(@"bottom inside", ^{
                    [[theValue(LL_CGAlign(alignRect, placementRect, LLAlignmentBottomInsideToRightOf)) should] equal:theValue(CGRectMake(200, 190, 10, 10))];
                });
                
            });
            
        });
        
        context(@"with offsets", ^{
            
        });
        
    });
        
    describe(@"The CGFloat functions", ^{
        
        context(@"LL_CGFloor", ^{
            
            it(@"should work with fractional values", ^{
                [[theValue(LL_CGFloor(10.4f)) should] equal:theValue(10.0f)];
            });
            
            it(@"should work with non fractional values", ^{
                [[theValue(LL_CGFloor(10.0f)) should] equal:theValue(10.0f)];
            });
            
        });
        
        context(@"LL_CGCeil", ^{
            
        });
        
        context(@"LL_CGRound", ^{
        
        });
        
        context(@"LL_CGAbs", ^{
        
        });
        
    });
    
});

SPEC_END