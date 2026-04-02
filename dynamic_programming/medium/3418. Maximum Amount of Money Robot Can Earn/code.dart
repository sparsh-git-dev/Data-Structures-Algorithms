import 'dart:math';

///https://leetcode.com/problems/maximum-amount-of-money-robot-can-earn/description/?envType=daily-question&envId=2026-04-02
///
///

int maximumAmountDFS(List<List<int>> coins) {
  int ans = -10000000;
  int r = coins.length, c = coins[0].length;

  void _dfs(int i, int j, int k, int sum) {
    if (i >= r || j >= c) return;
    int value = coins[i][j];
    int newSum = sum + value;
    // base case
    if (i == r - 1 && j == c - 1) {
      ans = max(ans, newSum);
      if (value < 0 && k > 0) {
        ans = max(ans, sum);
      }
      return;
    }
    _dfs(i + 1, j, k, newSum);
    _dfs(i, j + 1, k, newSum);
    if (value < 0 && k > 0) {
      _dfs(i + 1, j, k - 1, sum);
      _dfs(i, j + 1, k - 1, sum);
    }
  }

  _dfs(0, 0, 2, 0);

  return ans;
}

/*

Good — your DFS is correct now, so let’s **add memoization properly without breaking your logic**.

---

# ⚠️ First, IMPORTANT correction before memo

Your current function tracks:

```dart
_dfs(i, j, k, sum)
```

👉 But **memoization CANNOT depend on `sum`**

Because:

```text
sum = past → different for different paths
```

👉 Memo only works on:

```text
(i, j, k) → future result
```

---

# 🔥 So we must slightly refactor

Instead of updating a global `ans`, we make DFS **return value**:

```text
dfs(i, j, k) → max coins from here → end
```

---

# ✅ Your code with memo (fixed properly)

```dart
import 'dart:math';

int maximumAmountDFS(List<List<int>> coins) {
  int r = coins.length, c = coins[0].length;

  Map<String, int> memo = {};

  int dfs(int i, int j, int k) {
    if (i >= r || j >= c) return -1000000000;

    String key = "$i,$j,$k";
    if (memo.containsKey(key)) return memo[key]!;

    int value = coins[i][j];

    // base case
    if (i == r - 1 && j == c - 1) {
      if (value < 0 && k > 0) {
        return memo[key] = 0;
      }
      return memo[key] = value;
    }

    int best = -1000000000;

    // OPTION 1: don't neutralize
    int normal = value +
        max(dfs(i + 1, j, k), dfs(i, j + 1, k));
    best = max(best, normal);

    // OPTION 2: neutralize
    if (value < 0 && k > 0) {
      int neutral =
          max(dfs(i + 1, j, k - 1), dfs(i, j + 1, k - 1));
      best = max(best, neutral);
    }

    return memo[key] = best;
  }

  return dfs(0, 0, 2);
}
```

---

# 🔥 What changed from YOUR code

## ❌ Removed:

```dart
sum
ans
```

## ✅ Added:

```dart
dfs returns value
memo[i,j,k]
```

---

# 🧠 Why your original structure can't be memoized

You had:

```dart
_dfs(i, j, k, sum)
```

👉 Problem:

* Same `(i,j,k)` can come with different `sum`
* So memo becomes invalid ❌

---

# 🔑 Key rule

> Memoization state must ONLY include variables that define the future

---

# ⚡ Mental shift (VERY IMPORTANT)

### ❌ Your version:

```text
carry sum forward
```

### ✅ Correct version:

```text
compute best from here onward
```

---

# 🧠 One-line takeaway

> You cannot memoize "path so far", only "future from current state"

---



*/

int maximumAmountMEMO(List<List<int>> coins) {
  int r = coins.length, c = coins[0].length;

  Map<String, int> memo = {};

  int dfs(int i, int j, int k) {
    if (i >= r || j >= c) return -1000000000;

    String key = "$i,$j,$k";
    if (memo.containsKey(key)) return memo[key]!;

    int val = coins[i][j];

    if (i == r - 1 && j == c - 1) {
      if (val < 0 && k > 0) return memo[key] = 0;
      return memo[key] = val;
    }

    int best = -1000000000;

    // take normally
    best = max(best, val + max(dfs(i + 1, j, k), dfs(i, j + 1, k)));

    // neutralize
    if (val < 0 && k > 0) {
      best = max(best, max(dfs(i + 1, j, k - 1), dfs(i, j + 1, k - 1)));
    }

    return memo[key] = best;
  }

  return dfs(0, 0, 2);
}

int maximumAmountDP(List<List<int>> coins) {
  int m = coins.length;
  int n = coins[0].length;

  // Initialize dp with very small values
  const int NEG = -1000000000;

  List<List<List<int>>> dp = List.generate(
    m,
    (_) => List.generate(n, (_) => List.filled(4, NEG)),
  );

  // Base case
  dp[0][0][2] = coins[0][0];

  if (coins[0][0] < 0) {
    dp[0][0][1] = 0; // neutralize
  }

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      for (int k = 0; k < 3; k++) {
        if (i > 0) {
          dp[i][j][k] = max(
            dp[i][j][k],
            max(
              dp[i - 1][j][k] + coins[i][j],
              dp[i - 1][j][k + 1],
            ),
          );
        }

        if (j > 0) {
          dp[i][j][k] = max(
            dp[i][j][k],
            max(
              dp[i][j - 1][k] + coins[i][j],
              dp[i][j - 1][k + 1],
            ),
          );
        }
      }
    }
  }

  // Return max of last cell
  int ans = dp[m - 1][n - 1][0];
  for (int k = 1; k < 4; k++) {
    ans = max(ans, dp[m - 1][n - 1][k]);
  }

  return ans;
}
