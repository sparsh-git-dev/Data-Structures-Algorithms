// PARt 2

//  529 / 536 testcases passed
int lengthAfterTransformations(String s, int t, List<int> nums) {
  int lengthAfterTransformations = 0;
  int A = 'a'.codeUnitAt(0);
  List<int> asciis = List.filled(26, 0);
  for (int i = 0; i < s.length; i++) {
    int code = s.codeUnitAt(i);
    int index = code - A;
    asciis[index]++;
  }

  for (int transform = 1; transform <= t; transform++) {
    List<int> tmp = List.filled(26, 0);
    for (int i = 0; i < 26; i++) {
      if (asciis[i] == 0) continue;
      int nextConsecutive = nums[i];
      for (int turn = 1; turn <= nextConsecutive; turn++) {
        int index = (i + turn + 26) % 26;
        tmp[index] = (tmp[index] + asciis[i]) % MOD;
      }
    }
    asciis = List.from(tmp);
  }

  for (int i = 0; i < 26; i++) {
    lengthAfterTransformations = (lengthAfterTransformations + asciis[i]) % MOD;
  }
  return lengthAfterTransformations;
}

int MOD = 1e9.toInt() + 7;
