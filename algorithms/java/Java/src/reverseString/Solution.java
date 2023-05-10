package reverseString;

public class Solution {
	/**
	 * Input: s = ["h","e","l","l","o"]
	 * left = 0, right = 4
	 * 1.s = [o, e, l, l, h], left = 1, right = 3 
	 * 2.s = [o, l, l, e, h], left = 2, right = 2
	 * Output: ["o","l","l","e","h"]
	 * @param s
	 */
	public void reverseString(char[] s) {
		int n = s.length;
		for (int left = 0, right = n - 1; left < right; ++left, --right) {
			char tmp = s[left];
			s[left] = s[right];
			s[right] = tmp;
		}
    }
}
