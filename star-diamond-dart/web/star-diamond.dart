main() {
  printDiamond(1);
  printDiamond(2);
  printDiamond(3, false);
  printDiamond(4);
  printDiamond(5);
  printDiamond(6, false);
  printDiamond(7);
  printDiamond(8);
  printDiamond(9, false);
  printDiamond(10);
}

printDiamond(int halfHeight, [showStars = true]) {
  print('Diamond for h = ' + halfHeight.toString());
  buildDiamond(halfHeight, showStars).forEach((r) => print(r));
}

List buildDiamond(int halfHeight, showStars) {
  List rows = [];
  
  for (int i = 1; i <= (2 * halfHeight - 1); i++) {
    List line = [];
    int numberOfSpaces = (halfHeight - i).abs();
    int numberOfStars = halfHeight - numberOfSpaces;
    
    List spaces = new List.generate(numberOfSpaces, (j) => ' ');
    line.add(spaces.join(''));
    
    for (int j = 0; j < numberOfStars; j++) {
      var shouldShowStar = showStars || j == 0 || j == (numberOfStars - 1);
      line.add(shouldShowStar ? '* ' : '  ');
    }
    
    rows.add(line.join(''));
  }
  
  return rows;
}
