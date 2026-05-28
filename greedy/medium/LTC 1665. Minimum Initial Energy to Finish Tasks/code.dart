/* You are given an array tasks where tasks[i] = [actuali, minimumi]:

actuali is the actual amount of energy you spend to finish the ith task.
minimumi is the minimum amount of energy you require to begin the ith task.
For example, if the task is [10, 12] and your current energy is 11, you cannot start this task. However, if your current energy is 13, you can complete this task, and your energy will be 3 after finishing it.

You can finish the tasks in any order you like.

Return the minimum initial amount of energy you will need to finish all the tasks.  */

import 'dart:math';

class Solution {
  int minimumEffort(List<List<int>> tasks) {
    int ans = 1e9.toInt();

    tasks.sort((a, b) {
      return (b[1] - b[0]).compareTo(a[1] - a[0]);
    });
    int minmFuel = 0;
    int maxmFuel = 0;

    for (List<int> task in tasks) {
      minmFuel += task[0];
      maxmFuel = max(maxmFuel, task[1]);
    }

    int s = minmFuel, e = minmFuel + maxmFuel;
    while (s <= e) {
      int m = (s + e) ~/ 2;
      if (ableToCover(tasks, m)) {
        ans = min(m, ans);
        e = m - 1;
      } else {
        s = m + 1;
      }
    }

    return ans;
  }

  bool ableToCover(List<List<int>> tasks, int fuel) {
    for (List<int> t in tasks) {
      if (fuel < t[1] || fuel <= 0) return false;
      fuel = fuel - t[0];
    }
    return true;
  }
}
