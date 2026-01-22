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

List<int> nse(List<int> arr) {
  int n = arr.length;
  List<int> stack = [];
  List<int> ans = List.filled(n, 1);
  for (int i = 0; i < n; i++) {
    while (stack.isNotEmpty && arr[stack.last] > arr[i]) {
      ans[stack.removeLast()] = arr[i];
    }
    stack.add(i);
  }
  return ans;
}

void main() {
  final List<int> arr = [4, 5 ,2, 8, 10];
  print(nse(arr));
  print(nge(arr));
}
