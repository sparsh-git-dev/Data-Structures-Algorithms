import 'dart:math';

import 'graphs/medium/LTC_399_evaluate_division/code.dart';

void main() {
  final a = [-15, -13, 4, 7];
  final b = [3,1,1,2];
  minNumberOperations(b);
}
  int minNumberOperations(List<int> target) {
    int p = 0;
    int ans =0;
    for(int i = 0 ; i < target.length ; i++){
        int t = target[i] ;
        if( t > p){
            ans += t - p;            
        }
        p = t;
    }
    return ans =0;

  }