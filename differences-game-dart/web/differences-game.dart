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
  playWithPredefinedPlayers('draw', [Choices.HEADS, Choices.HEADS, Choices.HEADS], 'The game is a draw');

  playWithPredefinedPlayers('Dave', [Choices.TAILS, Choices.TAILS, Choices.HEADS], 'Dave must win');
  playWithPredefinedPlayers('John', [Choices.TAILS, Choices.HEADS, Choices.TAILS], 'John must win');
  playWithPredefinedPlayers('Jane', [Choices.HEADS, Choices.TAILS, Choices.TAILS], 'Jane must win');
  playWithPredefinedPlayers('draw', [Choices.TAILS, Choices.TAILS, Choices.TAILS], 'The game is a draw');
    
  stdout.writeln('Ok!');
}

void playWithPredefinedPlayers(winner, choices, message) {
  Asserts assertThat = new Asserts();
  List players = ['Jane', 'John', 'Dave'];
  
  assertThat.areEqual(winner, play(players, choices), message: message);
}

String play(players, choices) {
  if (choices.every((choice) => choice == choices[0])) return 'draw';
  if (choices[0] == choices[1]) return players[2];
  return play(rotate(players), rotate(choices));
}

List rotate(list) {
  list.add(list.removeAt(0));
  return list;
}
