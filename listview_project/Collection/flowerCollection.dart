class flowerCollection {
  static Map<String, int> someMap = Map();
  @override
  flowerCollection() {
    // = new Map(String, int);
  }

  static void add(int id, String name) {
    someMap[name] = id;
  }
}
