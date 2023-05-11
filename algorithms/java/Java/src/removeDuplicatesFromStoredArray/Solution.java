package removeDuplicatesFromStoredArray;

public class Solution {
	/**
	 * Input: nums = [1,1,2]
	 * 1. 1 != 1 => slow = 1, fast = 2, nums = [1,1,2]
	 * 2. 1 != 2 => nums[1] = nums[2] => nums = [1,2,2], slow = 2, fast = 3
	 * 3. return 2
	 * Output: 2, nums = [1,2,_]
	 * @param nums
	 * @return
	 */
	public static int removeDuplicates(int[] nums) {
        int n = nums.length
        if (n == 0) {
        	return 0;
        }
        int fast = 1;
        int slow = 1;
        while (fast < n) {
        	if (nums[fast] != nums[fast - 1]) {
        		nums[slow] = nums[fast];
        		++slow;
        	}
        	++fast;
        }
        return slow;
    }
}
