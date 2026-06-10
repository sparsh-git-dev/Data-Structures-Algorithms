import 'dart:math';

import 'package:collection/collection.dart';

import 'Linked_list/linked_list.dart';
import 'trees/helpers/tree_node.dart';

void main() {
  final nums = [1, 3, 2], k = 2;
  int a = maxTotalValue(nums, k);
  print(a);
}

int maxTotalValue(List<int> nums, int k) {
  int ans = 0;
  MinMaxSegmentTree t = MinMaxSegmentTree(nums);
  List<List<int>> all = t.queue.toList();

  for (int i = 0; i < k; i++) {
    ans += all[i][0] - all[i][1];
  }
  return ans;
}

class MinMaxSegmentTree {
  late final int n;
  late final List<int> arr;
  late final List<int> minTreeNodes;
  late final List<int> maxTreeNodes;
  PriorityQueue<List<int>> queue =
      PriorityQueue((a, b) => (b[0] - b[1]).compareTo(a[0] - a[1]));

  MinMaxSegmentTree(this.arr) {
    n = arr.length;
    minTreeNodes = List.filled(4 * n, 0);
    maxTreeNodes = List.filled(4 * n, 0);
    _buildTree(0, 0, n - 1);
  }
  void _buildTree(int node, int l, int r) {
    if (l == r) {
      maxTreeNodes[node] = arr[l];
      minTreeNodes[node] = arr[l];
      return;
    }
    int left = 2 * node + 1;
    int right = 2 * node + 2;
    int mid = (l + r) >> 1;
    _buildTree(left, l, mid);
    _buildTree(right, mid + 1, r);
    minTreeNodes[node] = min(minTreeNodes[left], minTreeNodes[right]);
    maxTreeNodes[node] = max(maxTreeNodes[left], maxTreeNodes[right]);
    queue.add([maxTreeNodes[node], minTreeNodes[node]]);
  }
}
