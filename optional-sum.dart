int optionalSum(int a, int b, [int? c]) {
  if (c == null) {
    return a + b;
  }
  return a + b + c;
}