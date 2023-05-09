package mergeTwoSortedLists;

/**
 * @author roc
 * If either of the input lists is empty, return the other list.
 * Compare the heads of the two lists.
 * Choose the smaller head as the new head of the merged list.
 * Recursively merge the remaining elements of the list that contributed the smaller head with the entire other list.
 * Return the new merged list.
 * Example1:
 * Input: list1 = [1,2,4], list2 = [1,3,4]
 * Output: [1,1,2,3,4,4]
 * 
 * step1:
 * L1 = 1, L2 = 1, L1 = L2 => return L2, result = [1]
 * step2:
 * L1 = 1, L2 = 3, L1 < L2 => return L1, result = [1, 1]
 * step3:
 * L1 = 2, L2 = 3, L1 < L2 => return L1, result = [1, 1, 2]
 * step4:
 * L1 = 4, L2 = 3, L1 > L2 => return L2, result = [1, 1, 2, 3]
 * step5:
 * L1 = 4, L2 = 4, L1 = L2 => return L2, result = [1, 1, 2, 3, 4]
 * step5:
 * L1 = 4, L2 = null, L2 == null => return L1, result = [1, 1, 2, 3, 4, 4]
 */
class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        if (list1 == null) {
        	return list2;
        } else if (list2 == null) {
        	return list1;
        } else if (list1.val < list2.val) {
        	list1.next = mergeTwoLists(list1.next, list2);
        	return list1;
        } else {
        	list2.next = mergeTwoLists(list1, list2.next);
        	return list2;
        }
    }
}

// Definition for singly-linked list.
public class ListNode {
     int val;
     ListNode next;
     ListNode() {}
     ListNode(int val) { this.val = val; }
     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}
