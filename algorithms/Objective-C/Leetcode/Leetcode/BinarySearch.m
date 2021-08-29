//
//  BinarySearch.m
//  Leetcode
//
//  Created by roc on 2021/8/29.
//

#import "BinarySearch.h"

@implementation BinarySearch

- (int)search:(NSArray *)array target:(int)target {
    int pivot = 0;
    int left = 0;
    int right = (int)array.count - 1;
    while (left < right) {
        pivot = (left + right) / 2;
        if ([array[pivot] intValue] == target) {
            return pivot;
        }
        if (target < [array[pivot] intValue]) {
            right = pivot - 1;
        } else {
            left = pivot + 1;
        }
    }
    return -1;
}

@end
