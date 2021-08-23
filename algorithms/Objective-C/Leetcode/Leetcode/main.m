//
//  main.m
//  Leetcode
//
//  Created by 于晓鹏 on 2020/11/24.
//

#import <Foundation/Foundation.h>
#import "ReverseWordsString.h"
#import "SortAnArray.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSString *str = @"Hello, World!";
//        NSLog(@"reverse words string \"%@\" result:%@", str, [ReverseWordsString reverseWords:str]);
        
//        NSLog(@"reverse words string \"%@\" result:%@", str, [ReverseWordsString reverseWords2:str]);
        SortAnArray *sortAnArray = [[SortAnArray alloc] init];
//        NSArray *array = @[@5, @2, @3, @1];
//        NSArray *sortedArray = [sortAnArray bubbleSort:array];
//        NSArray *sortedArray = [sortAnArray selectionSort:array];
//        NSArray *sortedArray = [sortAnArray insertionSort:array];
//        NSArray *array = @[@5, @2, @3, @1, @0];
//        NSArray *sortedArray = [sortAnArray shellSort:array];
//        NSArray *array = @[@9, @8, @7, @6, @5, @4, @3, @2, @1];
//        NSArray *sortedArray = [sortAnArray mergeSort:array];
        NSMutableArray *array = [@[@54, @26, @93, @17, @77, @31, @44, @55, @20] mutableCopy];
        NSArray *sortedArray = [sortAnArray quickSort:array left:0 right:(int)array.count - 1];
        NSLog(@"bubble sorted array:%@", sortedArray);
    }
    return 0;
}
