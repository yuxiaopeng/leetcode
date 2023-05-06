package twoSum;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TwoSumTest {

	@Test
	void test() {
		TwoSum ts = new TwoSum();
		int[] nums = {2, 7, 11, 15};
    	int[] result = {0, 1};
    	int[] ret = ts.twoSum(nums, 9);
    	assertArrayEquals(result, ret);
	}
	
	@Test
	void testSolution2() {
		TwoSum ts = new TwoSum();
		int[] nums = {2, 7, 11, 15};
    	int[] result = {0, 1};
    	int[] ret = ts.twoSumSolution2(nums, 9);
    	assertArrayEquals(result, ret);
	}

}
