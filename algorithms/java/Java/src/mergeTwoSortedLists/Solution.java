package mergeTwoSortedLists;

/**
 * @author roc
 * If either of the input lists is empty, return the other list.
 * Compare the heads of the two lists.
 * Choose the smaller head as the new head of the merged list.
 * Recursively merge the remaining elements of the list that contributed the smaller head with the entire other list.
 * Return the new merged list.
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
