import 'dart:math';

class Solution {
int findMin(List<int> nums) {
  int ans = 1e9.toInt();
  int n = nums.length;
  int s = 0, e = n - 1;
  while (s <= e) {
    int m = (s + e) ~/ 2;
    ans = min(nums[m], ans);
    ans = min(min(nums[s], nums[e]), ans);

    if (nums[s] < nums[m]) {
      s = m + 1;
    } else if(nums[s] > nums[m])  {
      e = m - 1;
    } else{
      // [10,10,1,10,10,10]
      // both the ends have same value as of mid
      // we don't know either to go Left or Right,
      // Therefore, it's better to reduce the constraint by reducing 
      // the size by 1;
         e--;
    }
  }
  return ans;
}
}