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

# 🚀 If you want next

I can:

* Convert this into **tabulation DP (super clean)**
* Show **why this reduces from exponential → O(m*n*3)**
* Or help you derive this in interviews step-by-step

Just tell me 👍
