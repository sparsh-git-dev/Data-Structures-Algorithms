import 'height_of_the_tree.dart';
import 'tree_node.dart';
// https://leetcode.com/problems/balanced-binary-tree/description/?envType=daily-question&envId=2026-02-08
bool isBalanced(TreeNode? root) {
  if (root == null) return true;
  int leftH = heightOfTheTree(root.left);
  int rightH = heightOfTheTree(root.right);
  if ((leftH - rightH).abs() > 1) return false;
  return isBalanced(root.left) && isBalanced(root.right);
}