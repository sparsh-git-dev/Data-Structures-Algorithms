import 'tree_node.dart';

TreeNode? sortedListToBST(List<int> sorted, int start, int end) {
  if (start > end) return null;
  int mid = start + (end - start) ~/ 2;
  TreeNode? node = TreeNode(
    sorted[mid],
    sortedListToBST(sorted, start, mid - 1),
    sortedListToBST(sorted, mid + 1, end),
  );
  return node;
}
