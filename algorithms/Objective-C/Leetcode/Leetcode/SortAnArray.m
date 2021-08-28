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
    [self sort:mutableArray low:0 high:arrayLength - 1 temp:temp];
    return [mutableArray copy];
}

- (void)sort:(NSMutableArray *)array low:(int)low high:(int)high temp:(NSMutableArray *)temp {
    if (low >= high) { // 递归跳出判断
        return;
    }
    int mid = (low + high) / 2; // 对数组进行二分
    [self sort:array low:low high:mid temp:temp]; // 对左侧的分组进行递归二分，low为第一个元素索引，middle为最后一个元素索引
    [self sort:array low:mid + 1 high:high temp:temp]; // 对右侧的分组进行递归二分，middle + 1为第一个元素的索引，high为最后一个元素的索引
    [self merge:array low:low middel:mid high:high temp:temp]; // 对每个有序数组进行回归合并
}

- (void)merge:(NSMutableArray *)array low:(int)low middel:(int)middle high:(int)high temp:(NSMutableArray *)temp {
  for (int i = low; i <= high; i++) { // 将数组元素复制到临时数组
      temp[i] = array[i];
  }
  
  int leftIndex = low; // 左侧数组标记
  int rightIndex = middle + 1; // 右侧数组标记
  int currentIndex = low; // 比较完成后比较小的元素要放的位置标记

  while (leftIndex <= middle && rightIndex <= high) {
    if ([temp[leftIndex] compare:temp[rightIndex]] != NSOrderedDescending) {
        array[currentIndex] = temp[leftIndex]; // 左侧标记的元素小于等于右侧标记的元素
        currentIndex++;
        leftIndex++;
    } else { // 右侧标记的元素小于左侧标记的元素
        array[currentIndex] = temp[rightIndex];
        currentIndex++;
        rightIndex++;
    }
  }
  
  if (leftIndex <= middle) { // 如果完成后左侧数组有剩余
     for (int i = 0; i <= middle - leftIndex; i++) {
        array[currentIndex + i] = temp[leftIndex + i];
    }
  }
}

/**
    分捡、分裂、递归
 */
- (NSMutableArray *)quickSort:(NSMutableArray *)array left:(int)left right:(int)right {
    if (left < right) {
        int splitPoint = [self partition:array left:left right:right];
        [self quickSort:array left:left right:splitPoint - 1];
        [self quickSort:array left:splitPoint + 1 right:right];
    }
    return array;
}

- (int)partition:(NSMutableArray *)array left:(int)left right:(int)right {
    int pivotValue = [array[left] intValue]; // 先选定第一个元素作为中位值
    int leftMark = left + 1; // 左游标，向右移动
    int rightMark = right; // 右游标，向左移动
    BOOL done = NO;
    while (!done) {
        while (leftMark <= rightMark && [array[leftMark] intValue] <= pivotValue) { // 向右移动左游标
            leftMark += 1;
        }
        while ([array[rightMark] intValue] >= pivotValue && rightMark >= leftMark) { // 向左移动右游标
            rightMark -= 1;
        }
        if (rightMark < leftMark) { // 两标相错就结束移动
            done = YES;
        } else { // 左右标值交换
            [array exchangeObjectAtIndex:leftMark withObjectAtIndex:rightMark];
        }
    }
    [array exchangeObjectAtIndex:left withObjectAtIndex:rightMark]; // 中值就位
    return rightMark; // 中值点，也就是分裂点
}

/**
 堆是一棵完全二叉树
 parrent = (i - 1) / 2;
 c1 = i * 2 + 1;
 c2 = i * 2 + 2;
 */
- (void)heapify:(NSMutableArray *)tree n:(int)n i:(int)i {
    if (i > n) {
        return;
    }
    int c1 = 2 * i + 1; // 左子节点的index
    int c2 = 2 * i + 2; // 右子节点的index
    int max = i; // 最大值节点的index，默认先设置为父节点
    if (c1 < n && tree[c1] > tree[max]) {
        max = i;
    }
    if (c2 < n && tree[c2] > tree[max]) {
        max = i;
    }
    if (max != i) {
        [tree exchangeObjectAtIndex:max withObjectAtIndex:i];
        [self heapify:tree n:n i:max];
    }
}

/**
 构建堆：
 按照父节点倒序的方式一层一层构建
 */
- (void)buildHeap:(NSMutableArray *)tree n:(int)n {
    int lastNode = n - 1;
    int parent = (lastNode - 1) / 2;
    int i;
    for (i = parent; i >= 0; i--) {
        [self heapify:tree n:n i:i];
    }
}

/**
 1、先将一棵树构造成堆；
 2、将第一个节点与最后一个节点进行值交换；
 3、砍断最后一个节点；
 4、重复1-3；
 */
- (void)heapSort:(NSMutableArray *)tree n:(int)n {
    [self buildHeap:tree n:n];
    int i;
    for (i = n - 1; i >= 0; i--) {
        [tree exchangeObjectAtIndex:i withObjectAtIndex:0];
        [self heapify:tree n:i i:0];
    }
}

- (void)swap:(NSMutableArray *)array index1:(int)x index2:(int)y {
    int temp = [[array objectAtIndex:x] intValue];
    [array replaceObjectAtIndex:x withObject:[array objectAtIndex:y]];
    [array replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:temp]];
}

@end
