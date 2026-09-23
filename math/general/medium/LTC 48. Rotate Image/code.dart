/// https://leetcode.com/problems/rotate-image/description/?envType=daily-question&envId=2026-05-04

class Solution {
  void rotate(List<List<int>> matrix) {
    int n = matrix.length;

    // Step 1: Transpose the matrix
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        int temp = matrix[i][j];
        matrix[i][j] = matrix[j][i];
        matrix[j][i] = temp;
      }
    }

    // Step 2: Reverse each row
    for (int i = 0; i < n; i++) {
      matrix[i] = matrix[i].reversed.toList();
    }
  }
}
