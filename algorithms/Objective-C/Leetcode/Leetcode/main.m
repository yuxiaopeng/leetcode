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
        NSArray *array = @[@5, @2, @3, @1, @0];
        NSArray *sortedArray = [sortAnArray shellSort:array];
        NSLog(@"bubble sorted array:%@", sortedArray);
    }
    return 0;
}
