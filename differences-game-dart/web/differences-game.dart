import "dart:io";
import "assert.dart";

void main() {
  AssertThat assertThat = new AssertThat();
  assertThat.isTrue(true, 'Must be true');
  
  stdout.writeln("Hello Dart world!");
}
