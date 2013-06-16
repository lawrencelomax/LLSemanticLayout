#import <Kiwi/Kiwi.h>

#import "LLGeometryUtilities.h"

SPEC_BEGIN(LLGeometryUtilitiesSpec)

describe(@"the geometry utilities", ^{

    describe(@"obtaining alignment", ^{
        
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
    
    describe(@"Obtaining positions functions", ^{
       
        const CGRect rectangle = CGRectMake(100, 100, 100, 100);
        
        it(@"should obtain the top left", ^{
            [[theValue(LL_CGRectGetPoint(rectangle, LLAlignmentTopLeft)) should] equal:theValue(CGPointMake(100, 200))];
        });
        
        it(@"should obtain the top right", ^{
            [[theValue(LL_CGRectGetPoint(rectangle, LLAlignmentTopRight)) should] equal:theValue(CGPointMake(200, 200))];
        });

        it(@"should obtain the bottom left", ^{
            [[theValue(LL_CGRectGetPoint(rectangle, LLAlignmentBottomLeft)) should] equal:theValue(CGPointMake(100, 100))];
        });

        it(@"should obtain the bottom right", ^{
            [[theValue(LL_CGRectGetPoint(rectangle, LLAlignmentBottomRight)) should] equal:theValue(CGPointMake(200, 100))];
        });
        
        it(@"should obtain the center", ^{
            [[theValue(LL_CGRectGetPoint(rectangle, LLAlignmentCenter)) should] equal:theValue(CGPointMake(150, 150))];
        });
        
    });
    
    context(@"aligning rectangles", ^{
       
        const CGRect alignRect = CGRectMake(100, 100, 100, 100);
        const CGRect placementRect = CGRectMake(10, 10, 10, 10);
        
        context(@"without offsets", ^{
            
            context(@"horizontally centered", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentCenter)) should] equal:theValue(CGRectMake(145, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentAboveCenterHorizontal)) should] equal:theValue(CGRectMake(145, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBelowCenterHorizontal)) should] equal:theValue(CGRectMake(145, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });

                it(@"bottom inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 190, 10, 10))];
                });
                
            });
            
            context(@"to the left of", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentCenterVerticalToLeftOf)) should] equal:theValue(CGRectMake(90, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentAboveCenterHorizontal)) should] equal:theValue(CGRectMake(145, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBelowCenterHorizontal)) should] equal:theValue(CGRectMake(145, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomOnCenterHorizontal)) should] equal:theValue(CGRectMake(145, 95, 10, 10))];
                });
                
                it(@"bottom inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomInsideCenterHorizontal)) should] equal:theValue(CGRectMake(145, 190, 10, 10))];
                });
                
            });
            
            context(@"to the right of", ^{
                
                it(@"vertically centered", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentCenterVerticalToRightOf)) should] equal:theValue(CGRectMake(200, 145, 10, 10))];
                });
                
                it(@"above", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentAboveToRightOf)) should] equal:theValue(CGRectMake(200, 90, 10, 10))];
                });
                
                it(@"top on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopOnToRightOf)) should] equal:theValue(CGRectMake(200, 95, 10, 10))];
                });
                
                it(@"top inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentTopInsideToRightOf)) should] equal:theValue(CGRectMake(200, 100, 10, 10))];
                });
                
                it(@"below", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBelowToRightOf)) should] equal:theValue(CGRectMake(200, 200, 10, 10))];
                });
                
                it(@"bottom on", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomOnToRightOf)) should] equal:theValue(CGRectMake(200, 95, 10, 10))];
                });
                
                it(@"bottom inside", ^{
                    [[theValue(LL_CGRectAlign(alignRect, placementRect, LLAlignmentBottomInsideToRightOf)) should] equal:theValue(CGRectMake(200, 190, 10, 10))];
                });
                
            });
            
        });
        
        context(@"with offsets", ^{
            
        });
        
    });
    
    describe(@"The CGFloat functions", ^{
        
        context(@"LL_CGFloatFloor", ^{
            
            it(@"should work with fractional values", ^{
                [[theValue(LL_CGFloatFloor(10.4f)) should] equal:theValue(10.0f)];
            });
            
            it(@"should work with non fractional values", ^{
                [[theValue(LL_CGFloatFloor(10.0f)) should] equal:theValue(10.0f)];
            });
            
        });
        
        context(@"LL_CGFloatCeil", ^{
        
            //it(@"sho", <#^(void)aBlock#>)
            
        });
        
        context(@"LL_CGFloatRound", ^{
        
        });
        
        context(@"LL_CGFloatAbs", ^{
        
        });
        
    });
    
});

SPEC_END