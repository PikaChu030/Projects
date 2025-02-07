void merge_sort(int *, int, int);
void merge(int *, int, int, int);

int main() {
    int *result = 0x0000;
    // int array[8] = {2, 4, 3, 1, 25, 7, 31, 0};
    int *array = 0x4000;
    *array = 2;
    *(array + 1) = 4;
    *(array + 2) = 3;
    *(array + 3) = 1;
    *(array + 4) = 25;
    *(array + 5) = 7;
    *(array + 6) = 31;
    *(array + 7) = 0;

    merge_sort(array, 0, 7);
    for (int i = 0; i < 8; i++) {
        *(result++) = array[i];
    }

    return 0;
}

void merge_sort(int *arr, int start, int end) {
    if (start < end) {
        int mid = (end + start) / 2;
        merge_sort(arr, start, mid);
        merge_sort(arr, mid + 1, end);
        merge(arr, start, mid, end);
    }
}

void merge(int *arr, int start, int mid, int end) {
    int length = end - start + 1;
    int tmp[length];

    for (int i = 0; i < length; i++) {
        tmp[i] = arr[start + i];
    }

	int left_index = 0;
	int right_index = mid - start + 1;
	int left_max = mid - start;
	int right_max = end - start;
	int arr_index = start;

	while(left_index <= left_max && right_index <= right_max){
		if(tmp[left_index] <= tmp[right_index]){
			arr[arr_index] = tmp[left_index];
			arr_index++;
			left_index++;
		}
		else{
			arr[arr_index] = tmp[right_index];
			arr_index++;
			right_index++;
		}
	}
    while(left_index <= left_max){
        arr[arr_index] = tmp[left_index];
        arr_index++;
        left_index++;
    }
    while(right_index <= right_max){
        arr[arr_index] = tmp[right_index];
        arr_index++;
        right_index++;
    }
}