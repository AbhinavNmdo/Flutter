import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
