class Solution {
  String answerString(String word, int numFriends) {
    if (numFriends == 1) return word;

    int n = word.length;
    int maxLen = n - numFriends + 1;
    String result = "";
    String maxChar = word[0];

    for (int i = 0; i < n; i++) {
      if (word[i].compareTo(maxChar) >= 0) {
        String current = word.substring(i, (i + maxLen < n) ? i + maxLen : n);
        if (current.compareTo(result) > 0) result = current;
        maxChar = word[i];
      }
    }

    return result;
  }
}
