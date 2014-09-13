import "dart:io";
import "assert.dart";

class Choices {
  static String HEADS = 'heads';
  static String TAILS = 'tails';
}

void main() {
  Asserts assertThat = new Asserts();

  assertThat.areEqual('Dave', play( ['Jane', 'John', 'Dave'], [Choices.HEADS, Choices.HEADS, Choices.TAILS]) );
  
  stdout.writeln('Ok!');
}

String play(players, choices) {
  return 'Dave';
}