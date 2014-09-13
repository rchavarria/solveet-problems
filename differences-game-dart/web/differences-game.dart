import "dart:io";
import "assert.dart";

class Choices {
  static String HEADS = 'heads';
  static String TAILS = 'tails';
}

void main() {
  Asserts assertThat = new Asserts();

  playWithPredefinedPlayers('Dave', [Choices.HEADS, Choices.HEADS, Choices.TAILS], 'Dave must win');
  playWithPredefinedPlayers('John', [Choices.HEADS, Choices.TAILS, Choices.HEADS], 'John must win');
  playWithPredefinedPlayers('Jane', [Choices.TAILS, Choices.HEADS, Choices.HEADS], 'Jane must win');
  
  stdout.writeln('Ok!');
}

void playWithPredefinedPlayers(winner, choices, message) {
  Asserts assertThat = new Asserts();
  List players = ['Jane', 'John', 'Dave'];
  
  assertThat.areEqual(winner, play(players, choices), message: message);
}

String play(players, choices) {
  if (choices[0] == choices[1]) {
    return players[2];
  }
  
  return players[1];
}