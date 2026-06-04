import 'dart:math';

extension ExInt on int {
  length() => (log(this) / ln10).floor() + 1;
}
