import 'dart:math';

import 'package:collection/collection.dart';

import 'Linked_list/linked_list.dart';

void main() {
  final a = [1, 2, 2];
  final boxGrid = [
    ["#", ".", "#"]
  ];
  // [
  //   ["#", ".", "*", "."],
  //   ["#", "#", "*", "."]
  // ];
  print(rotateTheBox(boxGrid));
}

List<List<String>> rotateTheBox(List<List<String>> box) {
  int r = box.length, c = box[0].length;
  List<List<String>> rotated = List.generate(c, (_) => List.filled(r, ''));

  for (int j = 0; j < rotated[0].length; j++) {
    int row = r - 1 - j;
    for (int i = 0; i < rotated.length; i++) {
      rotated[i][j] = box[row][i];
    }
  }

  for (int j = 0; j < rotated[0].length; j++) {
    int count = 0;
    for (int i = 0; i < rotated.length; i++) {
      if (rotated[i][j] == "#") {
        rotated[i][j] == ".";
        count++;
      } else if (rotated[i][j] == "*") {
        if (count == 0) continue;
        for (int l = 1; l <= count; l++) {
          rotated[i - l][j] = "#";
        }
        count = 0;
      }
    }
    if (count > 0) {
      int row = rotated.length - 1;
      for (int l = 0; l < count; l++) {
        rotated[row - l][j] = "#";
      }
    }
  }

  return rotated;
}
