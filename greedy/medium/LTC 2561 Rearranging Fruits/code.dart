import 'dart:math';

int minCost(List<int> basket1, List<int> basket2) {
  int ans = 0;

  final Map<int, int> freq = {};
  int minEl = 1 << 31;

  for (int x in basket1) {
    freq[x] = (freq[x] ?? 0) + 1;
    minEl = min(minEl, x);
  }

  for (int x in basket2) {
    freq[x] = (freq[x] ?? 0) - 1;
    minEl = min(minEl, x);
  }

  List<int> swappables = [];

  for (MapEntry<int, int> entry in freq.entries) {
    int cost = entry.key;
    int count = (entry.value).abs();
    if (count == 0) continue;

    if (count % 2 != 0) return -1;
    swappables.addAll(List.filled(count ~/ 2, cost));
  }
  swappables.sort();

  for (int i = 0; i < swappables.length ~/ 2; i++) {
    ans += min(swappables[i], 2 * minEl )   ;
  }
  return ans;
}
