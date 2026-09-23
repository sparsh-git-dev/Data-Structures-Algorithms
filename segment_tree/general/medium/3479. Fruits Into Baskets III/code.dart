import 'package:collection/collection.dart';

class Solution {
  int numOfUnplacedFruits(List<int> fruits, List<int> baskets) {
    int n = fruits.length;
    List<int> segmentTree = List.filled(4 * n, 0);

    // Build segment tree
    build(0, 0, n - 1, baskets, segmentTree);

    int unplaced = 0;
    for (var fruit in fruits) {
      if (!querySegmentTree(0, 0, n - 1, segmentTree, fruit)) {
        unplaced++;
      }
    }

    return unplaced;
  }

  void build(int i, int l, int r, List<int> baskets, List<int> segmentTree) {
    if (l == r) {
      segmentTree[i] = baskets[l];
      return;
    }
    int m = (l + r) ~/ 2;

    build(2 * i + 1, l, m, baskets, segmentTree);
    build(2 * i + 2, m + 1, r, baskets, segmentTree);

    segmentTree[i] = segmentTree[2 * i + 1] > segmentTree[2 * i + 2]
        ? segmentTree[2 * i + 1]
        : segmentTree[2 * i + 2];
  }

  bool querySegmentTree(int i, int l, int r, List<int> segmentTree, int val) {
    if (segmentTree[i] < val) {
      return false; // No basket in this segment
    }

    if (l == r) {
      segmentTree[i] = -1; // Mark basket as used
      return true;
    }

    int mid = (l + r) ~/ 2;
    bool placed;

    if (segmentTree[2 * i + 1] >= val) {
      placed = querySegmentTree(2 * i + 1, l, mid, segmentTree, val);
    } else {
      placed = querySegmentTree(2 * i + 2, mid + 1, r, segmentTree, val);
    }

    segmentTree[i] = segmentTree[2 * i + 1] > segmentTree[2 * i + 2]
        ? segmentTree[2 * i + 1]
        : segmentTree[2 * i + 2];

    return placed;
  }
}
