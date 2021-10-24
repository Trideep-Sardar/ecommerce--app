import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/product_detail.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => (Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (ProductDetail(catalog: catalog))))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
