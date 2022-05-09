class flowerCollection {
  static Map<int, String> someMap = Map();
  @override
  flowerCollection() {
    // = new Map(String, int);
  }

  static void add(int id, String name) {
    bool exist = false;
    for (var id in someMap.keys) {
      exist = true;
      print("Employee already exist!");
    }

    if (!exist) {
      someMap = {id: name};
    }
  }
}
