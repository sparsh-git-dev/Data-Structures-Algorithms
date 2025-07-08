import '../../../../annotations.dart';

@Greedy()
@SubSequence()
@BackTracking()
class Solution {
  int a = 'a'.codeUnitAt(0);
  String longestSubsequenceRepeatedK(String s, int k) {
    int n = s.length;
    List<int> freq = List.filled(26, 0);

    String ans = '';

    for (int i = 0; i < n; i++) freq[s.codeUnitAt(i) - a]++;

    List<bool> canUse = List.filled(26, false);
    List<int> requiredFreqToBuildSeq = List.filled(26, 0);
    for (int i = 0; i < 26; i++) {
      if (freq[i] < k) continue;
      canUse[i] = true;
      requiredFreqToBuildSeq[i] = freq[i] ~/ k;
    }

    int maxLen = n ~/ k;

    for (int len = maxLen; len > 0; len--) {
      List<int> tempFreq = List.from(requiredFreqToBuildSeq);
      String res = backTrack(s, '', canUse, tempFreq, k, len);
      if (res.isNotEmpty) return res;
    }
    return ans;
  }

  String backTrack(String s, String curr, List<bool> canUse,
      List<int> requiredFreq, int k, int maxLen) {
    if (curr.length == maxLen) {
      if (isSubsequence(s, curr, k)) {
        return curr;
      }
      return '';
    }

    for (int i = 25; i >= 0; i--) {
      if (!canUse[i] || requiredFreq[i] == 0) continue;
      requiredFreq[i]--;
      String res = backTrack(s, curr + String.fromCharCode(a + i), canUse,
          requiredFreq, k, maxLen);
      if (res.isNotEmpty) return res;
      requiredFreq[i]++;
    }

    return '';
  }

  bool isSubsequence(String s, String curr, int k) {
    int i = 0;
    int j = 0;
    String repeated = curr;
    for (int i = 1; i < k; i++) {
      repeated += curr;
    }
    while (i < s.length && j < repeated.length) {
      if (s[i] == repeated[j]) j++;
      i++;
    }

    return j >= repeated.length;
  }
}
