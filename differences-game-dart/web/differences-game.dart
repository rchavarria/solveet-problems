import "dart:io";
import "assert.dart";

void main() {
  Asserts assertThat = new Asserts();
  assertThat.isTrue(true, 'Must be true');
  
  stdout.writeln("Hello Dart world!");
}
