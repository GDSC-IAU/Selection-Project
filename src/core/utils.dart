// TODO: Add any utility functions here

// Just a method for frame for the title
void printTitleFrame(String appTitle, int frameLength) {
  String leftFrame = '-' * (frameLength ~/ 2);
  String rightFrame = '-' * (frameLength - (frameLength ~/ 2) - 1);
  print('$leftFrame $appTitle $rightFrame');
}