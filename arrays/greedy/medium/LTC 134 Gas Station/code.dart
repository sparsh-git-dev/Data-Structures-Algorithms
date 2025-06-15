int canCompleteCircuit(List<int> gas, List<int> cost) {
  int totalTank = 0, currentTank = 0, startIndex = 0;
  for (int i = 0; i < gas.length; i++) {
    int gain = gas[i] - cost[i];
    totalTank += gain;
    currentTank += gain;

    if (currentTank < 0) {
      startIndex = i + 1;
      currentTank = 0;
    }
  }
  return totalTank >= 0 ? startIndex : -1;
}
