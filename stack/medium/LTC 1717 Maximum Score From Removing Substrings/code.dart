import 'dart:math';

int maximumGainWithStack(String s, int x, int y) {
  int res = 0;
  int highValue = max(x, y), lowValue = min(x, y);
  String top = '', low = '';
  if (x > y) {
    top = 'ab';
    low = 'ba';
  } else {
    top = 'ba';
    low = 'ab';
  }

  List<String> stackForHigh = [];

  for (int r in s.runes) {
    String ch = String.fromCharCode(r);
    if (stackForHigh.isNotEmpty &&
        stackForHigh.last == top[0] &&
        ch == top[1]) {
      stackForHigh.removeLast();
      res += highValue;
    } else {
      stackForHigh.add(ch);
    }
  }
  List<String> stackForLow = [];
  for (String s in stackForHigh) {
    if (stackForLow.isNotEmpty && stackForLow.last == low[0] && s == low[1]) {
      stackForLow.removeLast();
      res += lowValue;
    } else {
      stackForLow.add(s);
    }
  }
  return res;
}
