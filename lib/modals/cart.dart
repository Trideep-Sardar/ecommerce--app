import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;
  late CatalogModel _catalog;

  final List<int> itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => itemIds.map((id) => _catalog.getById(id)).toList();

  num totalPrice() => items.fold(0, (total, item) => total + item.price);

  // void add(Item item) {
  //   itemIds.add(item.id);
  // }

  // void remove(Item item) {
  //   itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart.itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart.itemIds.remove(item.id);
  }
}
