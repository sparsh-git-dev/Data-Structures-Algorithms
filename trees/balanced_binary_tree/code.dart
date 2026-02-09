import '../helpers/list_to_bst.dart';
import '../helpers/tree_node.dart';

// https://leetcode.com/problems/balance-a-binary-search-tree/description/?envType=daily-question&envId=2026-02-09
TreeNode? balanceBST(TreeNode? root) {
  List<int> sortedList = [];
  Inorder(root, sortedList);
  return sortedListToBST(sortedList,0,sortedList.length -1);
}

void Inorder(TreeNode? root, List<int> sortedList) {
  if (root == null) return;
  Inorder(root.left, sortedList);
  sortedList.add(root.val);
  Inorder(root.right, sortedList);
}
