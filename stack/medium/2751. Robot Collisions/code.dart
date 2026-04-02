///https://leetcode.com/problems/robot-collisions/

class Solution {
  List<int> survivedRobotsHealths(List<int> positions, List<int> healths, String directions) {
    int n = positions.length;
    List<int> survivors = [];
    List<int> survivorIndexes = [];
    
    // Create a list of tuples (position, health, direction, index)
    List<List<dynamic>> robots = [];
    for (int i = 0; i < n; i++) {
      robots.add([positions[i], healths[i], directions[i], i]);
    }
    
    // Sort the robots by their positions
    robots.sort((a, b) => a[0].compareTo(b[0]));
    
    // Use a stack to process the collisions
    List<List<dynamic>> stack = [];
    
    for (var robot in robots) {
      if (robot[2] == 'R') {
        stack.add(robot); // push the robot moving right to the stack
      } else {
        // Process collisions
        while (stack.isNotEmpty && stack.last[2] == 'R' && stack.last[1] < robot[1]) {
          var collidedRobot = stack.removeLast();
          robot[1] -= 1; // reduce health of current left-moving robot
        }
        if (stack.isNotEmpty && stack.last[2] == 'R') {
          if (stack.last[1] == robot[1]) {
            stack.removeLast(); // both robots are destroyed
          } else {
            stack.last[1] -= 1; // reduce health of the right-moving robot
          }
        } else {
          survivors.add(robot[1]); // current robot survived
          survivorIndexes.add(robot[3]); // keep the original index
        }
      }
    }
    
    // Add remaining right-moving robots to survivors
    for (var robot in stack) {
      survivors.add(robot[1]);
      survivorIndexes.add(robot[3]);
    }
    
    // Sort the survivors by their original indexes
    List<int> result = List.filled(n, 0);
    for (int i = 0; i < survivors.length; i++) {
      result[survivorIndexes[i]] = survivors[i];
    }
    
    return result.where((health) => health != 0).toList();
  }
}
