#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 result = 0;
    NSMutableArray *arrayOfBinary = [[NSMutableArray <NSNumber *> alloc] init];
    NSInteger maxPow = 128;
    
    for (int i = 0; i < 8; i++) {
        [arrayOfBinary addObject: @(n % 2)];
        n = n / 2;
    }

    for (int i = 0; i < 8; i++) {
        result = result + ([arrayOfBinary[i] intValue] * maxPow);
        maxPow = maxPow / 2;
    }
    return result;
}
