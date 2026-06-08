import 'dart:math';

import 'package:collection/collection.dart';

import 'Linked_list/linked_list.dart';
import 'trees/helpers/tree_node.dart';

void main() {
  asteroidsDestroyed(5, [4, 9, 23, 4]);
}

bool asteroidsDestroyed(int mass, List<int> asteroids) {
  asteroids.sort();
  int n = asteroids.length;
  int s = 0, e = n - 1;
  int ans = -1;
  int destroyed = 0;
  while (s <= e) {
    int m = (s + e) >> 1;

    if (mass >= m) {
      ans = m;
      s = m + 1;
    } else {
      e = m - 1;
    }
  }
  print(ans);
  if (ans == -1) return false;

  for (int i = ans; i >= 0; i--) {
    mass += asteroids[i];
    destroyed++;
  }
  for (int i = ans + 1; i < n; i++) {
    if (mass >= asteroids[i]) {
      mass += asteroids[i];
      destroyed++;
    }
  }

  return destroyed == n;
}

class Solution {
  TreeNode? createBinaryTree(List<List<int>> descriptions) {
    final Map<int, TreeNode> rec = {};
    final Set<int> children = {};
    for (List<int> d in descriptions) {
      bool isleft = descriptions[2] == 1;
      int parentNodeValue = d[0];
      int childValue = d[1];
      TreeNode childNode = TreeNode(childValue);
      if (rec.containsKey(parentNodeValue)) {
        if (isleft) {
          rec[parentNodeValue]!.left = TreeNode(childValue);
        } else {
          rec[parentNodeValue]!.right = TreeNode(childValue);
        }
      } else {
        TreeNode parentNode = TreeNode(parentNodeValue);
        TreeNode childNode = TreeNode(childValue);
        if (isleft) {
          parentNode.left = childNode;
        } else {
          parentNode.right = childNode;
        }
        rec[parentNodeValue] = parentNode;
      }
      rec[childValue] = childNode;
      children.add(childValue);
    }
    for (List<int> d in descriptions) {
      if (children.contains(d[0])) continue;
      return rec[d[0]];
    }
    return null;
  }
}
