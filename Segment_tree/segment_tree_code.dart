import 'dart:math';

class SegmentTree {
  late List<int> tree;
  late List<int> arr;
  late int n;

  SegmentTree(List<int> nums) {
    arr = List.from(nums);
    n = arr.length;

    tree = List.filled(4 * n, 0);

    build(0, 0, n - 1);
  }

  void build(int node, int start, int end) {
    if (start == end) {
      tree[node] = arr[start];
      return;
    }

    int mid = (start + end) ~/ 2;

    int left = 2 * node + 1;
    int right = 2 * node + 2;

    build(left, start, mid);
    build(right, mid + 1, end);

    tree[node] = max(tree[left], tree[right]);
  }

  void update(int index, int value) {
    _update(0, 0, n - 1, index, value);
  }

  void _update(int node, int start, int end, int index, int value) {
    if (start == end) {
      arr[index] = value;
      tree[node] = value;
      return;
    }

    int mid = (start + end) ~/ 2;

    int left = 2 * node + 1;
    int right = 2 * node + 2;

    if (index <= mid) {
      _update(left, start, mid, index, value);
    } else {
      _update(right, mid + 1, end, index, value);
    }

    tree[node] = max(tree[left], tree[right]);
  }

  int query(int l, int r) {
    return _query(0, 0, n - 1, l, r);
  }

  int _query(int node, int rangeStart, int rangeEnd, int l, int r) {
    // No overlap
    if (r < rangeStart || rangeEnd < l) {
      return -1000000000;
    }

    // Complete overlap
    if (l <= rangeStart && rangeEnd <= r) {
      return tree[node];
    }

    int mid = (rangeStart + rangeEnd) ~/ 2;

    int left = 2 * node + 1;
    int right = 2 * node + 2;

    int leftMax = _query(left, rangeStart, mid, l, r);
    int rightMax = _query(right, mid + 1, rangeEnd, l, r);

    return max(leftMax, rightMax);
  }
}
