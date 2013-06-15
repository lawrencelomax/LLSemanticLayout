#import <Kiwi/Kiwi.h>

#import "LLGeometryUtilities.h"

SPEC_BEGIN(LLGeometryUtilitiesSpec)

describe(@"the geometry utilities", ^{
    
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
        
            it(@"sho", <#^(void)aBlock#>)
            
        });
        
        context(@"LL_CGFloatRound", ^{
        
        });
        
        context(@"LL_CGFloatAbs", ^{
        
        });
        
    });
    
});

SPEC_END