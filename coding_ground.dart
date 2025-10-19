import 'dart:math';

void main() {
  maxDistinctElements([8, 8, 10, 9, 9], 1);
}

int maxDistinctElements(List<int> nums, int k) {
  nums.sort();
  List<int> req = [];
  Set<int> unique = {};
  for (int n in nums) {
    if (unique.contains(n)) {
      req.add(n);
    } else {
      unique.add(n);
    }
  }

  for (int r in req) {
    for (int j = -k; j <= k; j++) {
      int num = r + j;
      if (unique.contains(num) == false) {
        unique.add(num);
        break;
      }
    }
  }

  return unique.length;
}
