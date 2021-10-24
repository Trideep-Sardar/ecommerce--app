import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:flutter_application_2/widgets/add_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  final Item catalog;

  const ProductDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.xl4.color(context.theme.focusColor).make(),
          Container(height: 40, width: 120, child: AddToCart(catalog: catalog))
        ],
      ),
      appBar: AppBar(),
      body: Container(
        color: context.theme.highlightColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: SafeArea(child: Image.network(catalog.image)))
                  .box
                  .square(250)
                  .color(context.theme.highlightColor)
                  .make(),
              Expanded(
                child: VxArc(
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  height: 20,
                  child: Container(
                    color: context.theme.dividerColor,
                    width: context.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        children: [
                          catalog.name.text
                              .color(context.accentColor)
                              .xl3
                              .make(),
                          catalog.desc.text.xl.caption(context).make(),
                          "Lorem tempor ipsum et duo sea justo sed. Et erat sit voluptua dolor tempor amet sit aliquyam kasd. At eos.Sed ea invidunt diam kasd sed sed erat, dolores labore sadipscing amet voluptua at diam eos, kasd magna sit dolor.Sea gubergren lorem gubergren amet diam duo, consetetur at voluptua duo justo amet consetetur. Amet magna clita eirmod et ipsum. Tempor ipsum gubergren diam dolore dolore et no, et justo."
                              .text
                              .caption(context)
                              .center
                              .make()
                              .px32()
                              .py(20)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
