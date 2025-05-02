// Problem: https://leetcode.com/problems/push-dominoes/description/

String pushDominoes(String dominoes) {
  List<String> arr = dominoes.split('');
  int n = arr.length;
  String? lastDir = null;
  int lastPos = -1;

  for (int i = 0; i < n; i++) {
    String ch = dominoes[i];
    if (ch == ".") continue;
    if (ch == "R") {
      if (lastDir == "R") {
        for (int s = lastPos + 1; s < i; s++) {
          arr[s] = "R";
        }
      }
    } else if (ch == "L") {
      if (lastDir == null) {
        for (int s = 0; s < i; s++) {
          arr[s] = "L";
        }
      } else if (lastDir == "L") {
        for (int s = lastPos + 1; s < i; s++) {
          arr[s] = "L";
        }
      } else if (lastDir == "R") {
        int l = lastPos;
        int r = i;
        while (r > l) {
          arr[r--] = "L";
          arr[l++] = "R";
        }
      }
    }

    lastDir = ch;
    lastPos = i;
  }
  if (lastDir == "R") {
    for (int s = lastPos + 1; s < n; s++) {
      arr[s] = "R";
    }
  }
  return arr.join('');
}
