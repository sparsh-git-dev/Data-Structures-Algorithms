// https://leetcode.com/problems/evaluate-division/description/

calcEquation(List<List<String>> equations, List<double> values,
    List<List<String>> queries) {
  Map<String, Map<String, double>> adjMatrix = {};
  for (int i = 0; i < equations.length; i++) {
    List<String> eq = equations[i];
    String a = eq[0];
    String b = eq[1];
    double v = values[i];
    if (adjMatrix.containsKey(a)) {
      adjMatrix[a] = {...adjMatrix[a]!, b: v};
    } else {
      adjMatrix[a] = {b: v};
    }

    if (adjMatrix.containsKey(b)) {
      adjMatrix[b] = {...adjMatrix[b]!, a: 1 / v};
    } else {
      adjMatrix[b] = {a: 1 / v};
    }
  }

  List<double> outputs = [];

  for (List<String> query in queries) {
    if (!adjMatrix.containsKey(query[0]) || !adjMatrix.containsKey(query[1])) {
      outputs.add(-1.0);
    } else if (query[0] == query[1]) {
      outputs.add(1.0);
    } else {
      outputs.add(dfs(query[0], query[1], adjMatrix));
    }
  }
  return outputs;
}

dfs(String start, String target, Map<String, Map<String, double>> adjMatrix) {
  Set<String> seen = {};
  double ans = -1;

  _helper(String start, String target, double result) {
    Map<String, double> allNodes = adjMatrix[start]!;
    if (start == target) ans = result;
    if (ans != -1) return;

    for (MapEntry<String, double> node in allNodes.entries) {
      if (seen.contains(node.key)) continue;
      seen.add(node.key);
      _helper(node.key, target, result * node.value);
      seen.remove(node.key);
    }
  }

  _helper(start, target, 1);
  return ans;
}
