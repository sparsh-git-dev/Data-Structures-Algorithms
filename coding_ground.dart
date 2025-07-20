import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

void main() {
  maximumLength([1, 2, 3, 4]);
}

maximumLength(List<int> nums) {
  int odd = 0, even = 0, parity = -1, alter = 0;
  for (int x in nums) {
    bool isEven = x % 2 == 0;
    if (parity == -1) {
      parity = x % 2;
    } else {
      if (parity % 2 == 0 && !isEven) {
        parity = 1;
        alter++;
      } else if (parity % 2 != 0 && isEven) {
        parity = 0;
        alter++;
      }
    }

    if (isEven) {
      even++;
    } else {
      odd++;
    }
  }
  int sameParity = max(odd, even);
  return max(sameParity, alter);
}
