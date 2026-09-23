void main() {
  combine(4, 2);
}

List<List<int>> combine(int n, int k) {
  List<List<int>> out = [];

  void _helper(int start, List<int> path) {
    if (path.length == k) {
      out.add(List.from(path));
      return;
    }

    for (int i = start; i <= n; i++) {
      path.add(i);
      _helper(i + 1, path);
      path.removeLast();
    }
  }

  _helper(1, []);

  return out;
}
