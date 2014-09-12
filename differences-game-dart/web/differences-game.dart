import "dart:io";
import "assert.dart";

String HEADS = 'heads';
String TAILS = 'tails';

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');

  String winner = '';
  
  winner = playWithPlayers([HEADS, HEADS, HEADS, HEADS, HEADS, HEADS]);
  assertThat.isTrue('draw' == winner, 'Playing all "heads" must result in a draw');

  winner = playWithPlayers([TAILS, TAILS, TAILS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('draw' == winner, 'Playing all "tails" must result in a draw');

  winner = playWithPlayers([HEADS, TAILS, TAILS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('Jane' == winner, 'Jane must win, she plays different');

  winner = playWithPlayers([TAILS, HEADS, TAILS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('Dave' == winner, 'Dave must win, he plays different');

  winner = playWithPlayers([TAILS, TAILS, HEADS, TAILS, TAILS, TAILS]);
  assertThat.isTrue('Anne' == winner, 'Anne must win, she plays different');

  winner = playWithPlayers([TAILS, TAILS, TAILS, HEADS, TAILS, TAILS]);
  assertThat.isTrue('Pete' == winner, 'Pete must win, she plays different');

  winner = playWithPlayers([TAILS, TAILS, TAILS, TAILS, HEADS, TAILS]);
  assertThat.isTrue('Fifth' == winner, 'Fifth must win, she plays different');

  winner = playWithPlayers([TAILS, TAILS, TAILS, TAILS, TAILS, HEADS]);
  assertThat.isTrue('Sixth' == winner, 'Sixth must win, she plays different');
  
  stdout.writeln('Ok!');
}

String playWithPlayers(choices) {
  return play(['Jane', 'Dave', 'Anne', 'Pete', 'Fifth', 'Sixth'], choices);
}

String play(players, choice) {
  if (choice[0] != choice[1]) {
    if (choice[1] == choice[2]) {
      return players[0];
    }

    return players[1];

  } else if (choice[1] != choice[2]) {
    if (choice[2] == choice[3]) {
      return players[1];
    }

    return players[2];

  } else if (choice[2] != choice[3]) {
    if (choice[3] == choice[4]) {
      return players[2];
    }

    return players[3];

  } else if (choice[3] != choice[4]) {
    if (choice[4] == choice[5]) {
      return players[3];
    }

    return players[4];

  } else if (choice[4] != choice[5]) {
//    if (choice[5] == choice[6]) {
//      return players[4];
//    }

    return players[5];
  }
  
  return 'draw';
}
