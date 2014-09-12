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
  assertThat.isTrue('Jane' == winner, 'Jane must win, she plays different');

  winner = play(['Jane', 'Dave', 'Anne'], [TAILS, HEADS, TAILS]);
  assertThat.isTrue('Dave' == winner, 'Dave must win, he plays different');

  winner = play(['Jane', 'Dave', 'Anne'], [TAILS, TAILS, HEADS]);
  assertThat.isTrue('Anne' == winner, 'Anne must win, she plays different');
  
  stdout.writeln('Ok!');
}

String play(players, choice) {
  if (choice[0] != choice[1]) {
    if (choice[1] != choice[2]) {
      return players[1];
    }

    return players[0];
  }
  
  return 'draw';
}
