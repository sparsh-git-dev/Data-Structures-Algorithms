import 'dart:math';

int minTime(List<int> skills, List<int> mana) {
  int n = skills.length, m = mana.length;
  List<int> finishTime = List.filled(n, 0);
  for (int j = 0; j < m; j++) {
    finishTime[0] += (mana[j] * skills[0]);

    for (int i = 1; i < n; i++) {
      finishTime[i] =
          max(finishTime[i], finishTime[i - 1]) + mana[j] * skills[i];
    }

    for (int i = n - 1; i > 0; i--) {
      finishTime[i - 1] = finishTime[i] - (skills[i] * mana[j]);
    }
  }
  return finishTime.last;
}
