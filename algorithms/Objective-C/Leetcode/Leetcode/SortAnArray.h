//
//  SortAnArray.h
//  Leetcode
//
//  Created by 于晓鹏 on 2021/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortAnArray : NSObject

- (NSArray *)bubbleSort:(NSArray *)array;
- (NSArray *)selectionSort:(NSArray *)array;
- (NSArray *)insertionSort:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
