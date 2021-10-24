import 'package:flutter/material.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import '../add_button.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.xl.make(),
            catalog.desc.text.caption(context).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}"
                    .text
                    .xl2
                    .color(context.theme.focusColor)
                    .make(),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: AddToCart(catalog: catalog),
                )
              ],
            )
          ],
        ))
      ],
    )).square(150).color(context.cardColor).make().py16();
  }
}

