class UniqueIdGenerator {
  static int _nextId = 1;

  static int generate() {
    return _nextId++;
  }
}
