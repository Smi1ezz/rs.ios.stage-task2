#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray<NSNumber *> *arrOfNum = [NSMutableArray array];
    NSMutableArray<NSString *> *arrOfStr = [NSMutableArray array];
    
    for (NSArray *subarray in array) {
        if (![subarray isKindOfClass:[NSArray class]]) return @[];

        if ([subarray count] == 0) continue;

        if ([[subarray objectAtIndex:0] isKindOfClass:[NSNumber class]]) {
            for (NSNumber *number in subarray) {
                [arrOfNum addObject:number];
            }
        } else {
            for (NSString *string in subarray) {
                [arrOfStr addObject:string];
            }
        }
    }
    
    [arrOfNum sortUsingComparator:^NSComparisonResult(id first, id second) {
        return [(NSNumber *) first intValue] - [(NSNumber *) second intValue];
    }];
    
    [arrOfStr sortUsingComparator:^NSComparisonResult(id first, id second) {
        return [arrOfNum count] == 0
        ? [(NSString *) first characterAtIndex:0] - [(NSString *) second characterAtIndex:0]
        : [(NSString *) second characterAtIndex:0] - [(NSString *) first characterAtIndex:0];
    }];
    
    if ([arrOfNum count] != 0 && [arrOfStr count] != 0) return @[arrOfNum, arrOfStr];
    
    if ([arrOfNum count] != 0) {
        return arrOfNum;
    } else {
        return arrOfStr;
    }
}

@end
