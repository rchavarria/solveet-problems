import "dart:io";
import "assert.dart";

String HEADS = 'heads';
String TAILS = 'tails';

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');

  String winner = play(['Jane', 'Dave', 'Anne'], [HEADS, HEADS, HEADS]);
  assertThat.isTrue('draw' == winner, 'Playing all "heads" must result in a draw');

  winner = play(['Jane', 'Dave', 'Anne'], [TAILS, TAILS, TAILS]);
  assertThat.isTrue('draw' == winner, 'Playing all "tails" must result in a draw');

  winner = play(['Jane', 'Dave', 'Anne'], [HEADS, TAILS, TAILS]);
  assertThat.isTrue('Jane' == winner, 'Jane play different');
  
  stdout.writeln('Ok!');
}

String play(players, choice) {
  if (choice[0] != choice[1]) {
    return players[0];
  }
  
  return 'draw';
}
