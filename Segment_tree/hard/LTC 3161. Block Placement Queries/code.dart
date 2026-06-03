class Solution {
  static const int N = 50000;
  late List<int> seg;

  void update(int idx, int val, int node, int l, int r) {
    if (l == r) {
      seg[node] = val;
      return;
    }

    int mid = (l + r) >> 1;

    if (idx <= mid) {
      update(idx, val, node * 2 + 1, l, mid);
    } else {
      update(idx, val, node * 2 + 2, mid + 1, r);
    }

    seg[node] = seg[node * 2 + 1] > seg[node * 2 + 2]
        ? seg[node * 2 + 1]
        : seg[node * 2 + 2];
  }

  int query(int qs, int qe, int node, int l, int r) {
    if (r < qs || l > qe) return 0;

    if (qs <= l && r <= qe) return seg[node];

    int mid = (l + r) >> 1;

    int left = query(qs, qe, node * 2 + 1, l, mid);
    int right = query(qs, qe, node * 2 + 2, mid + 1, r);

    return left > right ? left : right;
  }

  List<bool> getResults(List<List<int>> queries) {
    seg = List.filled(4 * N, 0);

    List<int> obstacles = [0];
    List<bool> ans = [];

    for (final q in queries) {
      if (q[0] == 1) {
        int x = q[1];

        int pos = lowerBound(obstacles, x);

        int pre = obstacles[pos - 1];

        update(x, x - pre, 0, 0, N - 1);

        if (pos < obstacles.length) {
          int nxt = obstacles[pos];
          update(nxt, nxt - x, 0, 0, N - 1);
        }

        obstacles.insert(pos, x);
      } else {
        int x = q[1];
        int sz = q[2];

        int pos = upperBound(obstacles, x) - 1;
        int pre = obstacles[pos];

        int maxGap = query(0, pre, 0, 0, N - 1);

        int best = maxGap > (x - pre) ? maxGap : (x - pre);

        ans.add(best >= sz);
      }
    }

    return ans;
  }

  // first index >= target
  int lowerBound(List<int> arr, int target) {
    int l = 0;
    int r = arr.length;

    while (l < r) {
      int mid = (l + r) >> 1;

      if (arr[mid] < target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }

    return l;
  }

  // first index > target
  int upperBound(List<int> arr, int target) {
    int l = 0;
    int r = arr.length;

    while (l < r) {
      int mid = (l + r) >> 1;

      if (arr[mid] <= target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }

    return l;
  }
}
