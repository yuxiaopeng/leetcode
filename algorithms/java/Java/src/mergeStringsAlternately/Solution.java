package mergeStringsAlternately;

public class Solution {
	/**
	 * Input: word1 = "abc", word2 = "pqr"
	 * 1. i = 0, j = 0, m = 3, n = 3, i < m => ans.append("abc".charAt(0)) => ans = "a", i = 1 => ans.append("pqr".charAt(0)) => ans = "ap", j = 1
	 * 2. ans = "apbq", i = 2, j = 2
	 * 3. ans = "apbqcr", i = 3, j = 3
	 * 
	 * Input: word1 = "ab", word2 = "pqrs"
	 * 1. ans = "ap", i = 1, j = 1
	 * 2. ans = "apbq", i = 2, j = 2
	 * 3. ans = "apbqr"
	 * @param word1
	 * @param word2
	 * @return
	 */
    public String mergeAlternately(String word1, String word2) {
        int i = 0, j = 0, m = word1.length(), n = word2.length();
        StringBuilder ans = new StringBuilder();
        while (i < m || j < n) {
        	if (i < m) {
        		ans.append(word1.charAt(i));
        		++i;
        	}
        	if (j < n) {
        		ans.append(word2.charAt(j));
        		++j;
        	}
        }
        return ans.toString();
    }
}
