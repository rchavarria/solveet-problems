import "dart:io";
import "assert.dart";

class Choices {
  static String HEADS = 'heads';
  static String TAILS = 'tails';
}

void main() {
  Asserts assertThat = new Asserts();

  assertThat.areEqual('Dave', play( ['Jane', 'John', 'Dave'], [Choices.HEADS, Choices.HEADS, Choices.TAILS] ), message: 'Dave must win');
  assertThat.areEqual('John', play( ['Jane', 'John', 'Dave'], [Choices.HEADS, Choices.TAILS, Choices.HEADS] ), message: 'John must win');
  
  stdout.writeln('Ok!');
}

String play(players, choices) {
  if (choices[0] == choices[1]) {
    return players[2];
  }
  
  return players[1];
}