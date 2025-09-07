### Count Set Bit

``` dart
int countSetBits(int n) {
  int count = 0;
  while (n > 0) {
    count += n & 1;
    n >>= 1;
  }
  return count;
}


```

![alt text](image.png)