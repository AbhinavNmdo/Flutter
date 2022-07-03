import 'package:flutter_catelog/models/catelog.dart';

class CartModel {
  // Catelog field
  late CatelogModel _catelog;

  // Collection of ids
  final List<int> _itemIds = [];

  // Get Catelog
  CatelogModel get catelog => _catelog;

  // Set Catelog
  set catelog(CatelogModel newCatelog) {
    assert(newCatelog != null);
    _catelog = newCatelog;
  }

  // Get item from cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  // Get total
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
