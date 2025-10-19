List<int> nge(List<int> arr) {
  int n = arr.length;
  List<int> stack = [];
  List<int> ans = List.filled(n, 1);
  for (int i = 0; i < n; i++) {
    while (stack.isNotEmpty && arr[stack.last] < arr[i]) {
      ans[stack.removeLast()] = arr[i];
    }
    stack.add(i);
  }
  return ans;
}

