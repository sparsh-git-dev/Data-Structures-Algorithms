/// https://leetcode.com/problems/create-binary-tree-from-descriptions/?envType=daily-question&envId=2026-06-07

import '../../helpers/tree_node.dart';

class Solution {
  TreeNode? createBinaryTree(List<List<int>> descriptions) {
    final Map<int, TreeNode> rec = {};
    final Set<int> children = {};

    for (List<int> d in descriptions) {
      int parentValue = d[0];
      int childValue = d[1];
      bool isLeft = d[2] == 1; // Fixed the typo here

      // 1. Retrieve or create the parent node
      TreeNode parentNode =
          rec.putIfAbsent(parentValue, () => TreeNode(parentValue));

      // 2. Retrieve or create the child node
      TreeNode childNode =
          rec.putIfAbsent(childValue, () => TreeNode(childValue));

      // 3. Establish the relationship
      if (isLeft) {
        parentNode.left = childNode;
      } else {
        parentNode.right = childNode;
      }

      // Record this value as a child
      children.add(childValue);
    }

    // 4. Find the root (the parent that is never a child)
    for (List<int> d in descriptions) {
      int parentValue = d[0];
      if (!children.contains(parentValue)) {
        return rec[parentValue];
      }
    }

    return null;
  }
}
