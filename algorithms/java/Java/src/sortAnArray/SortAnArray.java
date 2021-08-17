package sortAnArray;

public class SortAnArray {
	public int[] BubbleSort(int[] array) {
		int length = array.length;
		for (int i = length; i >= 0; i--) {
			boolean sorted = true;
			for (int j = 0; j < i; j++) {
				if (array[j] > array[j + 1]) {
					swap(array, j, j + 1);
					sorted = false;
				}
			}
			if (sorted) {
				break;
			}
		}
		return array;
	}
	
	private void swap(int[] array, int x, int y) {
		int temp = array[x];
		array[x] = array[y];
		array[y] = temp;
	}
}
