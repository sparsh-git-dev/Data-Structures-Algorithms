import 'dart:collection';
import 'dart:convert';
import 'dart:math';

void main() {
  final r = getWordsInLongestSubsequence(
      ["bad", "dc", "bc", "ccd", "dd", "da", "cad", "dba", "aba"],
      [9, 7, 1, 2, 6, 8, 3, 7, 2]);
  print(r);
}

List<String> getWordsInLongestSubsequence(
    List<String> words, List<int> groups) {
  List<String> ans = [];
  if (words.length == 1) return words;

  Map<String, List<String>> memo = {};
  int n = words.length;
  List<String> _helper(int i, int lastGroup, String lastWord) {
    if (i >= n) return [];
    String newWord = words[i];
    int newGroup = groups[i];
    String key = "$i|$lastGroup|$lastWord";
    if (memo.containsKey(key)) return memo[key]!;
    List<String> take = [];
    List<String> skip = [];

    if (newWord.length == lastWord.length &&
        newGroup != lastGroup &&
        hammingDistanceAllowed(newWord, lastWord)) {
      take = [newWord, ..._helper(i + 1, newGroup, newWord)];
    }
    skip = List.from(_helper(i + 1, lastGroup, lastWord));

    if (take.length > skip.length) {
      memo[key] = List.from(take);
    } else {
      memo[key] = List.from(skip);
    }

    return memo[key]!;
  }

  for (int i = 0; i < words.length - 1; i++) {
    List<String> res = [words[i], ..._helper(i + 1, groups[i], words[i])];
    if (ans.length < res.length) ans = res;
  }

  return ans;
}

bool hammingDistanceAllowed(String w1, String w2) {
  int dist = 0;
  for (int i = 0; i < w1.length; i++) {
    if (w1[i] != w2[i]) dist++;
  }
  return dist == 1;
}
