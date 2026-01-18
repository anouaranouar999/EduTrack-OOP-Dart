class Repository<T> {
  final List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  void remove(T item) {
    _items.remove(item);
  }

   List<T> getAll() {
    return List.unmodifiable(_items);
  }

  T? find(bool Function(T) test) {
    for (var item in _items) {
      if (test(item)) {
        return item;
      }
    }
    return null;
  }


}
