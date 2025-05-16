import 'dart:collection';

List<List<String>> findLadders(
    String beginWord, String endWord, List<String> wordList) {
  Set<String> wordSet = wordList.toSet();
  List<List<String>> result = [];
  if (!wordSet.contains(endWord)) return [];
  Queue<List<String>> q = Queue();
  q.add([beginWord]);
  bool found = false;
  Set<String> visited = {};

  while (q.isNotEmpty && !found) {
    int size = q.length;
    Set<String> currentLevels = {};
    for (int i = 0; i < size; i++) {
      List<String> path = q.removeFirst();
      String lastWord = path.last;
      List<String> neighbours = getNeighbours(lastWord, wordSet);
      for (String neighbour in neighbours) {
        if (visited.contains(neighbour)) continue;
        List<String> newPath = List.from(path)..add(neighbour);
        if (neighbour == endWord) {
          found = true;
          result.add(newPath);
        } else {
          q.add(newPath);
          currentLevels.add(neighbour);
        }
      }
    }
    visited.addAll(currentLevels);
  }

  return result;
}

List<String> getNeighbours(String word, Set<String> wordSet) {
  List<String> result = [];
  int a = 'a'.codeUnitAt(0);
  for (int i = 0; i < word.length; i++) {
    // int charCode = word.codeUnitAt(0) - a;
    for (int j = 0; j < 26; j++) {
      String c = String.fromCharCode(j + a);
      if (c == word[i]) continue;
      String newWord = word.substring(0, i) + c + word.substring(i + 1);
      if (wordSet.contains(newWord)) result.add(newWord);
    }
  }
  return result;
}
