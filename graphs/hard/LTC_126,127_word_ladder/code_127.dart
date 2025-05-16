// https://leetcode.com/problems/word-ladder/description/

import 'dart:collection';

int ladderLength(String beginWord, String endWord, List<String> wordList) {
  int level = 1; // start at level 1 because beginWord is counted
  Set<String> wordsSet = wordList.toSet();
  if (!wordsSet.contains(endWord)) return 0;

  Queue<String> q = Queue();
  q.add(beginWord);
  wordsSet.remove(beginWord);

  while (q.isNotEmpty) {
    int size = q.length;
    for (int i = 0; i < size; i++) {
      String node = q.removeFirst();
      if (node == endWord) return level;

      List<String> neighbours = getNeighbours(node, wordsSet);
      for (String s in neighbours) {
        q.add(s);
      }
    }
    level++;
  }

  return 0; // if we finish BFS and never find endWord
}

List<String> getNeighbours(String word, Set<String> wordsSet) {
  List<String> result = [];
  int a = 'a'.codeUnitAt(0);
  for (int i = 0; i < word.length; i++) {
    for (int alpha = 0; alpha < 26; alpha++) {
      String replaceWith = String.fromCharCode(alpha + a);
      String newWord =
          word.substring(0, i) + replaceWith + word.substring(i + 1);
      if (wordsSet.contains(newWord)) {
        wordsSet.remove(newWord);
        result.add(newWord);
      }
    }
  }

  return result;
}
