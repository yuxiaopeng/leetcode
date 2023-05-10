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
    
    /**
     * Intuition
     * The given code is a solution to the Merge Sorted Array problem,
     * which requires merging two sorted arrays into one sorted array.
     * Approach
     * The intuition behind the solution is to use three pointers, 
     * one at the end of the first array (initialized to m-1), 
     * one at the end of the second array (initialized to n-1), 
     * and one at the end of the merged array (initialized to m+n-1). 
     * We then compare the elements at the two pointers from the end of the two arrays, 
     * and place the larger element at the end of the merged array. 
     * We continue this process until all elements have been merged.
     * Complexity
     * Time complexity:
     * The time complexity of the solution is O(m+n), 
     * where m and n are the lengths of the two input arrays. 
     * This is because we iterate through both arrays once, 
     * and each iteration involves constant time operations.
     * Space complexity:
     * The space complexity of the solution is O(1), 
     * as it only uses a constant amount of extra space to store the three pointers. 
     * The merging is done in-place in the first input array, 
     * so no extra space is required for the merged array.
     * 
     * nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     * i = 2, j = 2, k = 5
     * 1. nums1[i] > nums2[j] => 3 > 6 => nums1[k--] = nums2[j--] => nums1[5] = 6, k = 4, i = 2, j = 1, nums1 = [1,2,3,0,0,6]
     * 2. nums1[i] > nums2[j] => nums1[2] > nums2[1] => 3 > 5 => nums1[k--] = nums2[j--] => nums1[4] = 5, k = 3, i = 2, j = 0, nums1 = [1,2,3,0,5,6] 
     * 3. nums1[i] > nums2[j] => nums1[2] > nums2[0] => 3 > 2 => nums1[k--] = nums1[i--] => nums1[3] = 3, k = 2, i = 1, j = 0, nums1 = [1,2,3,3,5,6]
     * 4. nums1[i] > nums2[j] => nums1[1] > nums2[0] => 2 > 2 => nums1[k--] = nums1[j--] => nums1[2] = 2, k = 1, i = 1, j = -1, nums1 = [1,2,2,3,5,6]
     * 5. j < 0 => nums1[k--] = nums1[i--] => nums1[1] = 2, k = 0, i = 0, j = -1, nums1 = [1,2,2,3,5,6]
     * 6. j < 0 => nums1[k--] = nums1[i--] => nums1[0] = 1, k = -1, i = -1, j = -1, nums1 = [1,2,2,3,5,6]
     * 
     * @param nums1
     * @param m
     * @param nums2
     * @param n
     */
    public void mergeThreePointer(int[] nums1, int m, int[] nums2, int n) {
    	int i = m - 1;
    	int j = n - 1;
    	int k = m + n - 1;
    	while (k >= 0) {
    		if (j < 0 || (i >= 0 && nums1[i] > nums2[j])) {
    			nums1[k--] = nums1[i--];
    		} else {
    			nums1[k--] = nums2[j--];
    		}
    	}
    }
}
