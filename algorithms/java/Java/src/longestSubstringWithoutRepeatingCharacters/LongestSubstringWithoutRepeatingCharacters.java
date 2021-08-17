package longestSubstringWithoutRepeatingCharacters;

import java.util.HashMap;
import java.lang.Character;

public class LongestSubstringWithoutRepeatingCharacters {

	/*
	 思路：
	 1、声明一个int变量maxLength用来存储无重复字符的最大长度；
	 2、声明一个哈希表用来存储无每一个不重复的字符；
	 3、声明一个数组用来依存将字符串拆成的字符数组；
	 4、使用一个forloop逐个遍历所有字符并从map里查找是否已有；
	 5、如果已有就证明出现了重复将当前的map.size与maxLength比较将大值赋值组maxLength再把map清空；
	 6、如果没有则添加到map；
	 存在的问题：一旦遇到map里已存在的字符就会结束这个循环进入下一个循环那就把这个字符丢弃掉了；
	 解决方案：在清空map之后把当前的字符再添加到map；
    */
	public int solution1(String str) {
		int maxLength = 0;
		HashMap<Character, Character> map = new HashMap<Character, Character>();
		char[] array;
		if (str.length() == 0) {
			return maxLength;
		} else {
			array  = str.toCharArray();
		}
		for (int i = 0; i < str.length(); i++) {
			char c = array[i];
			if (map.containsKey(c)) {
				maxLength = maxLength > map.size() ? maxLength : map.size();
				map.clear();
				map.put(c, c);
			} else {
				map.put(c, c);
			}
		}
		maxLength = maxLength > map.size() ? maxLength : map.size();
		return maxLength;
	}
	
	public int lenghtOfLongestSubstring(String str) {
		HashMap<Character, Integer> window = new HashMap<Character, Integer>();
		int left = 0, right = 0;
		int res = 0; // 记录结果
		char[] s = str.toCharArray();
		while(right < str.length()) {
			char key = s[right];
			right++;
			window.put(key, window.get(key) + 1);
			while(window.get(key) > 1) {
				char c = s[left];
				left++;
				int v = window.get(c);
				v--;
			}
			res = Math.max(res, right - left);
		}
		return res;
	}
}
