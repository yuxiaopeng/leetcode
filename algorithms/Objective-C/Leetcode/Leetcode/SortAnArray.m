//
//  SortAnArray.m
//  Leetcode
//
//  Created by 于晓鹏 on 2021/8/12.
//

#import "SortAnArray.h"

@implementation SortAnArray

/**
 基本思想：外层循环每一次经过两两比较，把每一轮未排定部分最大的元素放到了数组的末尾；
 「冒泡排序」有个特点：在遍历的过程中，提前检测到数组是有序的，从而结束排序，而不像「选择排序」那样，即使输入数据是有序的，「选择排序」依然需要「傻乎乎」地走完所有的流程。
 */
- (NSArray *)bubbleSort:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    int arrayLength = (int)mutableArray.count;
    for (int i = arrayLength - 1; i >= 0; i--) {
        // 先默认数组是有序的，只要发生一次交换就必须进行下一轮比较
        // 如果内循环中一次都没有进行交换操作，说明此时的数组已经是升序数组了
        BOOL sorted = YES;
        for (int j = 0; j < i; j++) {
            if ([[mutableArray objectAtIndex:j] intValue] > [[mutableArray objectAtIndex:j + 1] intValue]) {
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                sorted = NO;
            }
        }
        if (sorted) {
            break;
        }
    }
    return [mutableArray copy];
}

/**
 思路：每一轮选取未排定的部分中最小的部分交换到未排定部分的最开头，经过若干个步骤，就能排定整个数组。即：先选出最小的，再选出第2小的，以此类推。
 */
- (NSArray *)selectionSort:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    int arrayLength = (int)mutableArray.count;
    for (int i = 0; i < arrayLength - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < arrayLength; j++) {
            if ([[mutableArray objectAtIndex:j] intValue] < [[mutableArray objectAtIndex:minIndex] intValue]) {
                minIndex = j;
            }
        }
        [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
    return [mutableArray copy];
}

/**
 思路：每次将一个数字插入一个有序的数组里，成为一个长度更长的有序数组，有限次操作以后，数组整体有序。
 */
- (NSArray *)insertionSort:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    int arrayLength = (int)mutableArray.count;
    for (int i = 1; i < arrayLength; i++) {
        // 将array[i]插入到array[i - 1]、array[i - 2]、array[i - 3]...之中
        for (int j = i; j > 0 && [[mutableArray objectAtIndex:j] intValue] < [[mutableArray objectAtIndex:j - 1] intValue]; j--) {
            [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j - 1];
        }
    }
    return [mutableArray copy];
}

/**
 思想来源：插入排序的优化。在插入排序里，如果靠后的数字较小，它来到前面就得交换多次。「希尔排序」改进了这种做法。带间隔地使用插入排序，直到最后「间隔」为1的时候，就是标准的「插入排序」，此时数组里的元素已经「几乎有序」了；

 希尔排序是基于插入排序的以下两点性质而提出改进方法的：
 插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率
 但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位
 */
- (NSArray *)shellSort:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    int arrayLength = (int)mutableArray.count;
    // 使用 Knuth 增量序列，找增量的最大值
    int h = 1;
    while (3 * h + 1 < arrayLength) {
        h = 3 * h + 1;
    }
    while (h >= 1) {
        for (int i = h; i < arrayLength; i++) {
            for (int j = i; j >= h && [[mutableArray objectAtIndex:j] intValue] < [[mutableArray objectAtIndex:j - h] intValue]; j -= h) {
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j - h];
            }
        }
        h = h / 3;
    }
    return [mutableArray copy];
}

/**
 基本思路：借助额外空间，合并两个有序数组，得到更长的有序数组。
 */
- (NSArray *)mergeSort:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    int arrayLength = (int)mutableArray.count;
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:arrayLength];
    [self sort:mutableArray left:0 right:arrayLength - 1 temp:temp];
    return [mutableArray copy];
}

- (void)sort:(NSMutableArray *)array left:(int)left right:(int)right temp:(NSMutableArray *)temp {
    if (left < right) {
        int mid = (left + right) / 2;
        [self sort:array left:left right:mid temp:temp];
        [self sort:array left:mid + 1 right:right temp:temp];
        [self merge:array left:left mid:mid right:right temp:temp];
    }
}

- (void)merge:(NSMutableArray *)array left:(int)left mid:(int)mid right:(int)right temp:(NSMutableArray *)temp {
    int i = left;
    int j = mid + 1;
    int t = 0;
    while (i <= mid && j <= right) {
        if ([[array objectAtIndex:i] intValue] <= [[array objectAtIndex:j] intValue]) {
            [temp insertObject:[array objectAtIndex:i++] atIndex:t++];
        } else {
            [temp insertObject:[array objectAtIndex:j++] atIndex:t++];
        }
    }
    while (i <= mid) {
        [temp insertObject:[array objectAtIndex:i++] atIndex:t++];
    }
    while (j <= right) {
        [temp insertObject:[array objectAtIndex:j++] atIndex:t++];
    }
//    for (int k = left; k <= right; k++) {
//        if (i == mid + 1) {
//            [array insertObject:[temp objectAtIndex:j] atIndex:k];
//            j++;
//        } else if (j == right + 1) {
//            [array insertObject:[temp objectAtIndex:j] atIndex:k];
//            i++;
//        } else if ([[temp objectAtIndex:i] intValue] <= [[temp objectAtIndex:j] intValue]) {
//            [array insertObject:[temp objectAtIndex:i] atIndex:k];
//            i++;
//        } else {
//            [array insertObject:[temp objectAtIndex:j] atIndex:k];
//            j++;
//        }
//    }
    while (left <= right) {
        [array insertObject:[temp objectAtIndex:t++] atIndex:left++];
    }
}

- (void)swap:(NSMutableArray *)array index1:(int)x index2:(int)y {
    int temp = [[array objectAtIndex:x] intValue];
    [array replaceObjectAtIndex:x withObject:[array objectAtIndex:y]];
    [array replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:temp]];
}

@end
