///https://leetcode.com/problems/robot-collisions/

class Robot {
  int position;
  int health;
  String direction;
  int originalIndex;

  Robot(this.position, this.health, this.direction, this.originalIndex);
}

List<int> survivedRobotsHealths(
    List<int> positions, List<int> healths, String directions) {
  int n = positions.length;
  // Step 1: Create robot objects
  List<Robot> robots = [];
  for (int i = 0; i < n; i++) {
    robots.add(Robot(positions[i], healths[i], directions[i], i));
  }
  // Step 2: Sort by position
  robots.sort((a, b) => a.position.compareTo(b.position));
  // Stack for right-moving robots
  List<Robot> rightStack = [];
  // List to store surviving robots
  List<Robot> survivors = [];
  // Step 3: Process each robot
  for (Robot current in robots) {
    if (current.direction == 'R') {
      rightStack.add(current);
    } else {
      // Handle collisions with right-moving robots
      while (rightStack.isNotEmpty && current.health > 0) {
        Robot top = rightStack.removeLast();
        if (top.health > current.health) {
          top.health--;
          rightStack.add(top);
          current.health = 0;
        } else if (top.health < current.health) {
          current.health--;
        } else {
          // Both destroyed
          current.health = 0;
        }
      }
      // If current (L) survives
      if (current.health > 0) {
        survivors.add(current);
      }
    }
  }
  // Add remaining right-moving robots
  survivors.addAll(rightStack);
  // Step 4: Sort by original index
  survivors.sort((a, b) => a.originalIndex.compareTo(b.originalIndex));
  // Step 5: Extract healths
  return survivors.map((robot) => robot.health).toList();
}
