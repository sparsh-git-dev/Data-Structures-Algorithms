import 'dart:math';

import 'tree_node.dart';

heightOfTheTree(TreeNode? node) {
  if (node == null) return 0;
  return 1 + max(heightOfTheTree(node.left), heightOfTheTree(node.right));
}
