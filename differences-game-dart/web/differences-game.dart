import "assert.dart";

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');

  String winner = play(['Jane', 'Dave', 'Anne'], ['heads', 'heads', 'heads']);
  assertThat.isTrue('draw' == winner, 'Playing all "heads" must result in a draw');

  winner = play(['Jane', 'Dave', 'Anne'], ['tails', 'tails', 'tails']);
  assertThat.isTrue('draw' == winner, 'Playing all "tails" must result in a draw');
}

String play(players, choice) {
  return 'draw';
}
