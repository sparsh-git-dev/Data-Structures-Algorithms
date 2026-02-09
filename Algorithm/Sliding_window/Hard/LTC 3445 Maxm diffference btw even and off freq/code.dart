import 'dart:math';

int maxDifference(String s, int k) {
  int n = s.length;
  int maxDiff = -1 << 30;

  for (int len = k; len <= n; len++) {
    List<int> freq = List.filled(5, 0); // For digits '0' to '4'

    // Initialize frequency for first window of length `len`
    for (int i = 0; i < len; i++) {
      freq[int.parse(s[i])]++;
    }

    maxDiff = max(maxDiff, getMaxFreqDiff(freq));

    // Slide the window
    for (int start = 1; start + len <= n; start++) {
      freq[int.parse(s[start - 1])]--; // remove left char
      freq[int.parse(s[start + len - 1])]++; // add right char

      maxDiff = max(maxDiff, getMaxFreqDiff(freq));
    }
  }

  return maxDiff;
}

int getMaxFreqDiff(List<int> freq) {
  int maxDiff = -1 << 30;
  for (int a = 0; a < 5; a++) {
    if (freq[a] % 2 == 1) {
      // odd freq
      for (int b = 0; b < 5; b++) {
        if (freq[b] > 0 && freq[b] % 2 == 0) {
          maxDiff = max(maxDiff, freq[a] - freq[b]);
        }
      }
    }
  }
  return maxDiff;
}
