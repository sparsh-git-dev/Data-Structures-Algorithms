import 'dart:collection';

void main() {
  avoidFlood([0, 2, 0, 2, 0, 2]);
}

List<int> avoidFlood(List<int> rains) {
  int n = rains.length;
  List<int> ans = List.filled(n, 1);
  List<int> dryDays = [];
  Map<int, int> lastRain = {};

  for (int i = 0; i < n; i++) {
    int lake = rains[i];
    if (lake == 0) {
      dryDays.add(i);
      continue;
    }

    ans[i] = -1; // raining day

    if (lastRain.containsKey(lake)) {
      // find the smallest dry day index greater than lastRain[rains[i]]
      int prev = lastRain[lake]!;
      int dryDay = _nextGreater(dryDays, prev);

      if (dryDay == -1) return []; // no available dry day -> flood
      ans[dryDay] = lake;
      dryDays.remove(dryDay);
    }

    lastRain[lake] = i;
  }

  return ans;
}

int _nextGreater(List<int> dryDays, int prev) {
  int ans = -1;
  int l = 0;
  int r = dryDays.length - 1;
  while (r >= l) {
    int mid = l + (r - l) ~/ 2;
    if (dryDays[mid] > prev) {
      ans = dryDays[mid];
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}
