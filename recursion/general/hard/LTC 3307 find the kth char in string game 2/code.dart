String kthCharacter(int k, List<int> operations) {
  if (k == 1) return 'a';
  int n = operations.length;
  int opType = -1, len = 1, newK = k;

  for (int i = 0; i < n; i++) {
    len *= 2;
    if (len >= k) {
      opType = operations[i];
      newK = k - (len ~/ 2);
      break;
    }
  }

  String res = kthCharacter(newK, operations);
  if (opType == 0) return res;
  if (res == 'z') return 'a';
  return String.fromCharCode(res.codeUnitAt(0) + 1);
}
