import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  // fun('dabdcbdcdcd');
  // int sol = maxDistance("EEEWNNNS", 1);
  // print(sol);
  int ans = numSubseq([2, 3, 3, 4, 6, 7], 12);
  print(ans);
}

int numSubseq(List<int> nums, int target) {
  int ans = 0;
  int n = nums.length, r = 0;
  for (int l = 0; l < nums.length; l++) {
    r = n - 1;
    while ((nums[r] + nums[l]) > target && r >= l) r--;
    if (r >= l) ans += pow(2, r - l).toInt();
  }
  return ans;
}

class FindSumPairs {
  List<int> _nums2 = [];
  Map<int, int> freq = {};

  FindSumPairs(List<int> nums1, List<int> nums2) {
    for (int n in nums1) {
      freq[n] = (freq[n] ?? 0) + 1;
    }

    _nums2 = List.from(nums2);
  }

  void add(int index, int val) {
    _nums2[index] += val;
  }

  int count(int tot) {
    List<int> _nums2Duplicate = List.from(_nums2);
    _nums2Duplicate.sort();
    int pairs = 0;
    for (int i in _nums2Duplicate) {
      pairs += (freq[tot - i] ?? 0);
    }
    return pairs;
  }
}
