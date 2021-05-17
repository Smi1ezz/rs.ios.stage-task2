#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSMutableArray *tempArray = [numbersArray mutableCopy];
    NSMutableString *ipResult = [[NSMutableString alloc] init];
    
    if (numbersArray == nil || numbersArray.count == 0) return @"";
    
    if (numbersArray.count < 4) {
        for (int j=0; j < (4 - numbersArray.count); j++) {
            [tempArray addObject: @0];
        }
    }
    
    for (int i=0; i < 4; i++) {
        if ([tempArray[i] intValue] > 255) return @"The numbers in the input array can be in the range from 0 to 255.";
        
        if ([tempArray[i] intValue] < 0) return @"Negative numbers are not valid for input.";
        
        [ipResult appendString:[tempArray[i] stringValue]];
        [ipResult appendString:@"."];
    }
    return [ipResult substringToIndex:[ipResult length] - 1];
}

@end
