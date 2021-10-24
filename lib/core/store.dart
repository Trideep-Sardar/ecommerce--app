import 'package:flutter_application_2/modals/cart.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CartModel cart;
  late CatalogModel catalog;

  MyStore() {
    cart = CartModel();
    catalog = CatalogModel();
    cart.catalog = catalog;
  }
}
