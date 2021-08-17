//
//  ReverseWordsString.m
//  Leetcode
//
//  Created by 于晓鹏 on 2020/11/24.
//

#import "ReverseWordsString.h"

@implementation ReverseWordsString

/*语言特性法
 1.将传入的字符串拆分成单字数组；
 2.将单词数组进行reverse并返回反转之后的单词数组；
 3.将单词数组转成字符串并返回；
 O(1)
 */
+ (NSString *)reverseWords:(NSString *)str {
    NSArray *words = [str componentsSeparatedByString:@" "];
    NSArray *reverseWords = [[words reverseObjectEnumerator] allObjects];
    return [reverseWords componentsJoinedByString:@" "];
}

/*通用法
 1.forloop将每个字符添加到word临时变量；
 2.遇到空格将word添加到数组array中并把word清空；
 3.一旦遍历到最后一个字符直接将word添加到array；
 4.逆序遍历array添加到result字符串；
 5.空格：在result不为空时添加空格，即result的前面不用加空格；
 O(n)
 */
+ (NSString *)reverseWords2:(NSString *)str {
    NSString *result = @"";
    NSString *word = @"";
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [str length]; i++) {
        char ch = [str characterAtIndex:i];
        if (ch == ' ' && [word length] > 0) {
            [array addObject:word];
            word = @"";
            continue;
        }
        if (i == [str length] - 1) {
            word = [NSString stringWithFormat:@"%@%c", word, ch];
            [array addObject:word];
            word = @"";
            break;
        }
        word = [NSString stringWithFormat:@"%@%c", word, ch];
    }
//    NSLog(@"%c", ch);
    for (int i = ((int)[array count]  - 1); i >= 0; i--) {
        result = [NSString stringWithFormat:@"%@%@%@", result, [result isEqualToString:@""] ? @"" : @" ", [array objectAtIndex:i]];
    }
    return result;
}

@end
