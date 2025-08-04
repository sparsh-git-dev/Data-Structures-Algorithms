import 'dart:math';

int totalFruit(List<int> fruits) {
  int ans = 0;
  Map<int, int> basket = {};
  int l = 0;
  for (int r = 0; r < fruits.length; r++) {
    int type = fruits[r];
    basket[type] = (basket[type] ?? 0) + 1;

    while (basket.length > 2 && l < r) {
      int removalType = fruits[l];
      basket[removalType] = (basket[removalType] ?? 0) - 1;
      if (basket.containsKey(removalType)) {
        if (basket[removalType]! <= 0) {
          basket.remove(removalType);
        }
      }
      l++;
    }

    ans = max(r - l + 1, ans);
  }
  return ans;
}
