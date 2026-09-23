List<List<String>> accountsMerge(List<List<String>> accounts) {
  List<List<String>> result = [];
  Map<String, List<String>> adjMap = {};
  Map<String, String> seperateCompoment = {};
  for (List<String> account in accounts) {
    String firstEmail = account[1];
    if (!adjMap.containsKey(firstEmail)) adjMap[firstEmail] = [];
    for (int i = 2; i < account.length; i++) {
      adjMap[firstEmail]!.add(account[i]);

      if (adjMap.containsKey(account[i])) {
        adjMap[account[i]]!.add(firstEmail);
      } else {
        adjMap[account[i]] = [firstEmail];
      }
    }

    if (account.length == 2) seperateCompoment[account[0]] = account[1];
  }

  Set<String> visisted = {};
  for (List<String> account in accounts) {
    String name = account[0];
    for (int i = 1; i < account.length; i++) {
      if (visisted.contains(account[i])) continue;
      List<String> r = _dfs(account[i], adjMap, visisted);
      if (r.isEmpty && seperateCompoment.containsKey(name)) {
        result.add([name, seperateCompoment[name]!]);
      } else {
        r.sort();
        result.add([name, ...r]);
      }
    }
  }

  return result;
}

List<String> _dfs(
    String account, Map<String, List<String>> adjMap, Set<String> visited) {
  List<String> n = adjMap[account]!;
  List<String> result = [];
  for (String node in n) {
    if (visited.contains(node)) continue;
    visited.add(node);
    result.add(node);
    result.addAll(_dfs(node, adjMap, visited));
  }
  return result;
}
