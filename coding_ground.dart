import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  countPalindromicSubsequence('adc');
}

int countPalindromicSubsequence(String s) {
  Set<String> pal = {};

  void _helper(int i, String a) {
    if (a.length == 3) {
      print(a);
      if (isPalindrome(a)) pal.add(a);
      return;
    }
    if (i >= s.length) return;
    String pick = a + s[i];
    _helper(i + 1, pick);
    String noPick = a;
    _helper(i + 1, noPick);
  }

  _helper(0, '');
  print(pal);

  return pal.length;
}

bool isPalindrome(String s) {
  if (s[0] != s[2]) return false;
  return false;
}
