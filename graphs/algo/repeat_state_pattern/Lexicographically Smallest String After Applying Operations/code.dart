//  https://leetcode.com/problems/lexicographically-smallest-string-after-applying-operations/description/?envType=daily-question&envId=2025-10-19


class Solution {

String findLexSmallestString(String s, int a, int b) {
  String ans = s;
  List<String> q = [s];
  Set<String> visited = {s};
  while (q.isNotEmpty) {
    String word = q.removeAt(0);
     if (word.compareTo(ans) < 0) ans = word;
    String addition = add(word, a);
    String r = rotate(word+word, b);
    if (visited.contains(r)) {
    } else {
      visited.add(r);
      q.add(r);
    }
    if (visited.contains(addition)) {
    } else {
      visited.add(addition);
      q.add(addition);
    }


  }

  return ans;
}

String rotate(String w, int by) {
  int size = w.length ~/ 2;
  int start = size - by;
  return w.substring(start, start + size);
}

String add(String w, int a) {
  String ans = '';
  for (int i = 0; i < w.length; i++) {
   if (i % 2 == 1){
      ans += ((int.parse(w[i]) + a) % 10).toString();
    } else {
      ans += w[i];
    }
  }
  return ans;
}

}