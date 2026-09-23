void main() {
  triangleNumber([3, 4, 5, 6, 7, 8]);
}

int triangleNumber(List<int> sides) {
  // Sort the sides so we can apply the two-pointer technique
  sides.sort();
  int totalTriangles = 0;

  // Fix the largest side at index 'longest'
  for (int longest = sides.length - 1; longest >= 2; longest--) {
    int left = 0; // smallest side
    int right = longest - 1; // middle side

    while (left < right) {
      // Check if smallest + middle > largest
      if (sides[left] + sides[right] > sides[longest]) {
        // All pairs between left..right-1 with right also form valid triangles
        totalTriangles += (right - left);
        right--; // try smaller middle side
      } else {
        left++; // increase smallest side
      }
    }
  }

  return totalTriangles;
}
