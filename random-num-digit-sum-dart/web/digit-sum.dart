
void main() {
  assertTrue(false, "Must be true");
}

void assertTrue(condition, msg) {
  if (!condition) {
    throw new Exception(msg);
  }
}