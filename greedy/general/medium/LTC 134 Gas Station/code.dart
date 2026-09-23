int canCompleteCircuit(List<int> gas, List<int> cost) {
  int n = gas.length;

  int sumGas = 0, sumCost = 0;
  for (int i = 0; i < gas.length; i++) {
    sumGas += gas[i];
    sumCost += cost[i];
  }

  if (sumGas < sumCost) return -1;

  int total = 0;
  int result = 0;

  for (int i = 0; i < n; i++) {
    total += gas[i] - cost[i];
    if (total < 0) {
      total = 0;
      result = i + 1;
    }
  }

  return result;
}
