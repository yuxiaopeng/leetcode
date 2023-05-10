package mergeSortedArray;

import java.util.Arrays;

class Solution {
	/**
	 * Time complexity: O((m+n)log(m+n))
	 * Space complexity: O(log(m+n))
	 * @param nums1
	 * @param m
	 * @param nums2
	 * @param n
	 */
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = 0; i != n; ++i) {
        	nums1[m + i] = nums2[i];
        }
        Arrays.sort(nums1);
    }
    
    public void mergeTwoPointer(int[] nums1, int m, int[] nums2, int n) {
    	int p1 = 0, p2 = 0;
    	int[] sorted = new int[m + n];
    	int cur;
    	
    }
}
