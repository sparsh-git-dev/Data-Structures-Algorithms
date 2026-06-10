import 'dart:math';

/*
A standard segment tree **does not store every possible range**.
It stores only a specific set of ranges that arise from recursively splitting the array into halves.
For an array of size 8, the nodes store ranges like:

```
[0,7]
├── [0,3]
│   ├── [0,1]
│   │   ├── [0,0]
│   │   └── [0,1]
│   └── [2,3]
│       ├── [2,2]
│       └── [3,3]
└── [4,7]
    ├── [4,5]
    └── [6,7]
```

The stored ranges are:

```
[0,7]
[0,3], [4,7]
[0,1], [2,3], [4,5], [6,7]
[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]
```

Notice that ranges such as:

```
[1,4]
[2,6]
[1,3]
[3,5]
```

are **not stored as individual nodes**.

However, any query range can be represented as a union of a small number of stored ranges. For example:

```
[1,4] = [1,1] ∪ [2,3] ∪ [4,4]
```

and

```
[2,6] = [2,3] ∪ [4,5] ∪ [6,6]
```

This is the key idea behind segment trees:

* Total possible ranges in an array of size (n): (n(n+1)/2) (quadratic).
* Segment tree stores only (O(n)) carefully chosen ranges (about (2n) to (4n) nodes).
* Any query interval can be decomposed into (O(\log n)) stored ranges.

So the answer is:

> **A segment tree misses most ranges as explicit nodes. It stores only the canonical ranges produced by recursive halving, but every possible range can be expressed as a union of a few stored nodes.**
*/
class SegmentTree {
  late List<int> tree, arr;
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
    int left = 2 * node + 1, right = 2 * node + 2;
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
    int left = 2 * node + 1, right = 2 * node + 2;

    if (index <= mid)
      _update(left, start, mid, index, value);
    else
      _update(right, mid + 1, end, index, value);

    tree[node] = max(tree[left], tree[right]);
  }

  int query(int l, int r) {
    return _query(0, 0, n - 1, l, r);
  }

  int _query(int node, int rangeStart, int rangeEnd, int l, int r) {
    // No overlap
    if (r < rangeStart || rangeEnd < l) return -1000000000;

    // Complete overlap
    if (l <= rangeStart && rangeEnd <= r) return tree[node];

    int mid = (rangeStart + rangeEnd) ~/ 2;

    int left = 2 * node + 1, right = 2 * node + 2;

    int leftMax = _query(left, rangeStart, mid, l, r);
    int rightMax = _query(right, mid + 1, rangeEnd, l, r);

    return max(leftMax, rightMax);
  }
}
