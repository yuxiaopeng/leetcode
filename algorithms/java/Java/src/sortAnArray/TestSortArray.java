package sortAnArray;

import longestSubstringWithoutRepeatingCharacters.LongestSubstringWithoutRepeatingCharacters;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TestSortArray {
	private final LongestSubstringWithoutRepeatingCharacters ls = new LongestSubstringWithoutRepeatingCharacters();
	private final SortAnArray sortArray = new SortAnArray();

    @Test
    void addition() {
//    	int length = ls.lenghtOfLongestSubstring("abcabcb");
//    	System.out.println("length of longest substring:" + length);
//    	assertEquals(3, ls.lenghtOfLongestSubstring("abcabcb"));
    	assertEquals([1,2,3,5], sortArray.BubbleSort([5,2,3,1]));
    }

}
