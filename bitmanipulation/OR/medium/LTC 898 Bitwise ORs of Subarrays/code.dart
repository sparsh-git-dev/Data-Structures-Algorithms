int subarrayBitwiseORs(List<int> arr) {
  Set<int> ans = {};
  Set<int> previosOrs = {};

  for (int a in arr) {
    Set<int> currOrs = {a};

    for (int r in previosOrs) {
      currOrs.add(r | a);
    }
    previosOrs = currOrs;
    ans.addAll(currOrs);
  }

  return ans.length;
}
