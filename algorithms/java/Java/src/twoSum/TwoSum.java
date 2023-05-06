package twoSum;

import java.util.*;

public class TwoSum {
	/**
	 * Solution 1: Use of Force
	 * Run two loops to test each combination in the supplied array.
	 * nums[i] + [j] == target
	 * return i,j
	 * @param nums
	 * @param target
	 * @return
	 */
	public int[] twoSum(int nums[], int target) {
		int n = nums.length;
		for (int i = 0; i < n; ++i) {
			for (int j = i + 1; j < n; ++j) {
				if (nums[i] + nums[j] == target) {
					return new int[] {i, j};
				}
			}
		}
		return new int[0];
	}
	
	/**
	 * Solution 2: Hashmap
	 * uses a map to keep track of the numbers in the list. 
	 * It loops through the list and checks
	 * @param nums
	 * @param target
	 * @return
	 */
	public int[] twoSumSolution2(int nums[], int target) {
		Map<Integer, Integer> hashMap = new HashMap<Integer, Integer>();
		for (int i = 0; i < nums.length; ++i) {
			if (hashMap.containsKey(target - nums[i])) {
				return new int[] {hashMap.get(target - nums[i]), i};
			}
			hashMap.put(nums[i], i);
		}
		return new int[0];
	}
}
