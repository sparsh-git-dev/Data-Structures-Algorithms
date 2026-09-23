import 'dart:math';

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

String answerString2Pointers(String word, int numFriends) {
  if (numFriends == 1) return word;

  int n = word.length;

  int i = 0;
  int j = 1;

  while (j < n) {
    int k = 1;
    if (word[j].compareTo(word[i]) > 0) {
      i = j;
    } else if (word[j].compareTo(word[i]) == 0) {
      while (i + k < j && j + k < n) {
        if (word[j + k].compareTo(word[i + k]) > 0) {
          i = j;
          break;
        } else if (word[j + k].compareTo(word[i + k]) < 0) {
          break;
        }
        k++;
      }
    }
    j++;
  }
  int maxLen = n - numFriends + 1;
  return word.substring(i, (i + maxLen < n) ? i + maxLen : n);
}
