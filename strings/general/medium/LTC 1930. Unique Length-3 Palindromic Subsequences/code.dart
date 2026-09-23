int countPalindromicSubsequence(String s) {
  List<int> first = List.filled(26, -1);
  List<int> last = List.filled(26, -1);
  for (int i = 0; i < s.length; i++) {
    int curr = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
    if (first[curr] == -1) first[curr] = i;
    last[curr] = i;
  }
  int ans = 0;
  for (int i = 0; i < 26; i++) {
    if (first[i] == -1) continue;
    Set<int> st = {};
    for (int middle = first[i] + 1; middle < last[i]; middle++) {
      st.add(s.codeUnitAt(middle));
    }
    ans += st.length;
  }
  return ans;
}
