import "dart:io";
import "assert.dart";

void main() {
  Asserts assertThat = new Asserts();

  assertThat.areEqual('Dave', play( ['Jane', 'John', 'Dave'], ['tails', 'tails', 'heads']));
  
  stdout.writeln('Ok!');
}
