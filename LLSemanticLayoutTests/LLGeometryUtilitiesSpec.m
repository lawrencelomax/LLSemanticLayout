#import <Kiwi/Kiwi.h>

#import "LLGeometryUtilities.h"

SPEC_BEGIN(LLGeometryUtilitiesSpec)

describe(@"the geometry utilities", ^{
    
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