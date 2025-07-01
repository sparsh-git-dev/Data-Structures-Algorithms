int longestSubsequence(String s, int k) {
  int length = 0;
  int powerValue = 1; // pow(2,0);
  for (int i = s.length - 1; i >= 0; i--) {
    if (s[i] == '0') {
      length++;
    } else if (powerValue <= k) {
      length++;
      k -= powerValue;
    }

    /// Saving overflow of bit int, if `[powerValue]` is greater than
    /// we need no to increase value, and only 0 inclusion is possible
    if (powerValue <= k) powerValue *= 2;
  }
  return length;
}
