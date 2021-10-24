import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatefulWidget {
  @override
  _CatalogHeaderState createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.color(context.theme.buttonColor).make(),
        "Trending products".text.xl2.color(context.theme.splashColor).make(),
      ],
    );
  }
}
