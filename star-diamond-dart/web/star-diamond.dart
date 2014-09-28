main() {
  int halfHeight = 5;
  List rows = buildRows(halfHeight);
  
  rows.forEach((row) => print(row));
}

List buildRows(int halfHeight) {
  return [' *', '* *', ' *'];
}
