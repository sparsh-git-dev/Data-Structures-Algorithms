// PARt 1

class Solution {
  int lengthAfterTransformations(String s, int t) {
    const int MOD = 1000000007;
    List<int> asciis = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      asciis[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    for (int j = 0; j < t; j++) {
      List<int> tmp = List.filled(26, 0);
      for (int i = 0; i < 26; i++) {
        if (i == 25) {
          tmp[0] = (tmp[0] + asciis[i]) % MOD;
          tmp[1] = (tmp[1] + asciis[i]) % MOD;
        } else {
          tmp[i + 1] = (tmp[i + 1] + asciis[i]) % MOD;
        }
      }
      asciis = tmp;
    }

    int len = 0;
    for (int c in asciis) {
      len = (len + c) % MOD;
    }

    return len;
  }
}
