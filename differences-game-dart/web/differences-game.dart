import "dart:io";
import "assert.dart";

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');

  String winner = play(['Jane', 'Dave', 'Anne'], ['heads', 'heads', 'heads']);
  assertThat.isTrue('draw' == winner, 'Playing all "heads" must result in a draw');
  stdout.writeln('And the winner is...: ${winner}');
}
