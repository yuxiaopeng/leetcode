package Test;

import longestSubstringWithoutRepeatingCharacters.LongestSubstringWithoutRepeatingCharacters;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

class MyFirstJUnitJupiterTests {

    private final LongestSubstringWithoutRepeatingCharacters ls = new LongestSubstringWithoutRepeatingCharacters();

    @Test
    void addition() {
    	assertEquals(3, ls.lenghtOfLongestSubstring("abcabcb"));
    }

}
//
//public class Test {
//	@Test
//	public void testLongestCount() {
//		LongestSubstringWithoutRepeatingCharacters ls = new LongestSubstringWithoutRepeatingCharacters();
//		assertEquals(3, ls.lenghtOfLongestSubstring("abcabcb"));
//	}
//	
}
