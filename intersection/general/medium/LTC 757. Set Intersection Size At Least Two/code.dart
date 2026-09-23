// https://leetcode.com/problems/set-intersection-size-at-least-two/?envType=daily-question&envId=2025-11-20

int intersectionSizeTwo(List<List<int>> intervals) {
  // Sort: end ascending; if tied → start descending
  intervals.sort((a, b) {
    if (a[1] != b[1]) {
      return a[1].compareTo(b[1]);
    }
    return b[0].compareTo(a[0]);
  });

  int result = 0, first = -1, second = -1, n = intervals.length;
  ;
  for (int i = 0; i < n; i++) {
    int l = intervals[i][0], r = intervals[i][1];
    // both points already inside
    if (l <= first) continue;
    // neither inside
    if (l > second) {
      result += 2;
      second = r;
      first = r - 1;
    } else {
      // only 'second' is inside
      result += 1;
      first = second;
      second = r;
    }
  }
  return result;
}
