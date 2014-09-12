import "dart:io";
import "assert.dart";

String HEADS = 'heads';
String TAILS = 'tails';

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');

  String winner = '';
  
  winner = playWithPlayers([HEADS, HEADS, HEADS, HEADS]);
  assertThat.isTrue('draw' == winner, 'Playing all "heads" must result in a draw');

  winner = playWithPlayers([TAILS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('draw' == winner, 'Playing all "tails" must result in a draw');

  winner = playWithPlayers([HEADS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('Jane' == winner, 'Jane must win, she plays different');

  winner = playWithPlayers([TAILS, HEADS, TAILS, TAILS]);
  assertThat.isTrue('Dave' == winner, 'Dave must win, he plays different');

  winner = playWithPlayers([TAILS, TAILS, HEADS, TAILS]);
  assertThat.isTrue('Anne' == winner, 'Anne must win, she plays different');

  winner = playWithPlayers([TAILS, TAILS, TAILS, HEADS]);
  assertThat.isTrue('Pete' == winner, 'Pete must win, she plays different');
  
  stdout.writeln('Ok!');
}

String playWithPlayers(choices) {
  return play(['Jane', 'Dave', 'Anne', 'Pete'], choices);
}

String play(players, choice) {
  if (choice[0] != choice[1]) {
    if (choice[1] != choice[2]) {
      return players[1];
    }

    return players[0];

  } else if (choice[1] != choice[2]) {
    return players[2];
  }
  
  return 'draw';
}
