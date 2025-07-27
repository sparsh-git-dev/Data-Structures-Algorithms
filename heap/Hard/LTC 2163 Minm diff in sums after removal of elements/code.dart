import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  int a = 15;
  int b = 16;
  List<int> data = [1, 2, 3];
  if (data.isEmpty) {
    print('object');
  }

  for(int i =0 ; i < 5 v; i++){
    if( i < 2 ){
      print("22");
    }
  }
}

class Solution {
  int minimumDifference(List<int> nums) {
    int ans = 1e19.toInt();
    int size = nums.length;
    List<int> smaller = List.filled(size, 0);
    List<int> greater = List.filled(size, 0);
    PriorityQueue<int> minHeap = PriorityQueue<int>();
    PriorityQueue<int> maxHeap = PriorityQueue<int>((a, b) => b - a);
    int n = size ~/ 3;
    int sum = 0;
    for (int i = 0; i < n; i++) {
      sum += nums[i];
      maxHeap.add(nums[i]);
    }
    smaller[n - 1] = sum;
    for (int i = n; i < size - n; i++) {
      int peak = maxHeap.first;
      if (nums[i] < peak) {
        sum = sum - maxHeap.removeFirst();
        sum = sum + nums[i];
        maxHeap.add(nums[i]);
      }
      smaller[i] = sum;
    }
    sum = 0;
    for (int i = size - 1; i >= size - n; i--) {
      sum += nums[i];
      minHeap.add(nums[i]);
    }
    greater[size - n] = sum;
    for (int i = size - n - 1; i >= n; i--) {
      int peak = minHeap.first;
      if (nums[i] > peak) {
        sum = sum - minHeap.removeFirst();
        sum = sum + nums[i];
        minHeap.add(nums[i]);
      }
      greater[i] = sum;
    }

    for (int i = n - 1; i < size - n; i++) {
      ans = min(ans, smaller[i] - greater[i + 1]);
    }

    return ans;
  }
}
