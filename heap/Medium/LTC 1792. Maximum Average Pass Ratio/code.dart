import 'package:collection/collection.dart';

double maxAverageRatio(List<List<int>> classes, int extraStudents) {
  int n = classes.length;

  // [max-delta, index]
  PriorityQueue<List<double>> pq = PriorityQueue<List<double>>(
    (a, b) => b[0].compareTo(a[0]),
  );

  for (int i = 0; i < n; i++) {
    double currentPR = classes[i][0] / classes[i][1];
    double newPR = (classes[i][0] + 1) / (classes[i][1] + 1);
    double delta = newPR - currentPR;
    pq.add([delta, i.toDouble()]);
  }

  while (extraStudents-- > 0) {
    List<double> curr = pq.removeFirst();
    int idx = curr[1].toInt();

    classes[idx][0]++;
    classes[idx][1]++;

    double currentPR = classes[idx][0] / classes[idx][1];
    double newPR = (classes[idx][0] + 1) / (classes[idx][1] + 1);
    double delta = newPR - currentPR;

    pq.add([delta, idx.toDouble()]);
  }

  double result = 0.0;
  for (int i = 0; i < n; i++) {
    result += classes[i][0] / classes[i][1];
  }

  return result / n;
}
