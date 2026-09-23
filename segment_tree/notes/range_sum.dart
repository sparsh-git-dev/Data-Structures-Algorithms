class NumArray {
  late List<int> tree;
  late List<int> arr;
  late int n;

  NumArray(List<int> nums) {
    arr = List.from(nums);
    n = arr.length;
    tree = List.filled(4 * n, 0);
    buildTree(0, 0, n - 1);
  }

  void buildTree(int node, int start, int end) {
    if (start == end) {
      tree[node] = arr[start];
      return;
    }

    int mid = (start + end) >> 1;

    int left = 2 * node + 1;
    int right = 2 * node + 2;

    buildTree(left, start, mid);
    buildTree(right, mid + 1, end);

    tree[node] = (tree[left] + tree[right]);
  }

  void update(int index, int val) {
    _update(0, 0, n - 1, index, val);
  }

  void _update(int node, int start, int end, int index, int val) {
    if (start == end) {
      arr[index] = val;
      tree[node] = val;
      return;
    }
    int mid = (start + end) >> 1;
    int left = 2 * node + 1;
    int right = 2 * node + 2;
    if (index <= mid) {
      _update(left, start, mid, index, val);
    } else {
      _update(right, mid + 1, end, index, val);
    }
    tree[node] = (tree[left] + tree[right]);
  }

  int sumRange(int left, int right) {
    return _query(0, 0, n - 1, left, right);
  }

  int _query(int node, int rangeStart, int rangeEnd, int l, int r) {
    if (rangeEnd < l || r < rangeStart) return 0;

    if (l <= rangeStart && rangeEnd <= r) return tree[node];

    int mid = (rangeStart + rangeEnd) >> 1;
    int left = 2 * node + 1;
    int right = 2 * node + 2;
    int leftMax = _query(left, rangeStart, mid, l, r);
    int rightMax = _query(right, mid + 1, rangeEnd, l, r);
    return (leftMax + rightMax);
  }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = NumArray(nums);
 * obj.update(index,val);
 * int param2 = obj.sumRange(left,right);
 */