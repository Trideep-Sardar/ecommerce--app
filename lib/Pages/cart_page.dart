import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/modals/cart.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body: Container(
        color: context.canvasColor,
        child: Column(
          children: [
            CartList().p12().expand(),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
                builder: (context, dynamic, _) {
                  return "\$${cart.totalPrice()}"
                      .text
                      .xl5
                      .color(context.theme.focusColor)
                      .make();
                },
                mutations: {RemoveMutation}),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying is not allow yet!".text.make()));
              },
              child: "Buy"
                  .text
                  .center
                  .color(context.cardColor)
                  .make()
                  .w15(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor)),
            )
          ],
        ));
  }
}

class CartList extends StatelessWidget {
  final CartModel cart = (VxState.store as MyStore).cart;
  final _catalog = CatalogModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return cart.items.isEmpty
        ? Center(
            child: "no product is added yet to show here !!"
                .text
                .xl2
                .color(context.accentColor)
                .make(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: cart.items.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Icon(
                  Icons.done,
                  color: context.accentColor,
                ),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(cart.items[index]);
                    },
                    icon: Icon(Icons.delete, color: context.accentColor)),
                title: cart.items[index].name.text
                    .color(context.accentColor)
                    .make(),
              );
            }),
          );
  }
}






// class CartList extends StatefulWidget {
//   const CartList({Key? key}) : super(key: key);

//   @override
//   _CartListState createState() => _CartListState();
// }

// class _CartListState extends State<CartList> {
//   final _cart = CartModel();
//   final _catalog = CatalogModel();
//   @override
//   Widget build(BuildContext context) {
//     return _cart.items.isEmpty
//         ? Center(
//             child: "no product is added yet to show here !!"
//                 .text
//                 .xl2
//                 .color(context.accentColor)
//                 .make(),
//           )
//         : ListView.builder(
//             shrinkWrap: true,
//             itemCount: _cart.items.length,
//             itemBuilder: ((context, index) {
//               return ListTile(
//                 leading: Icon(
//                   Icons.done,
//                   color: context.accentColor,
//                 ),
//                 trailing: IconButton(
//                     onPressed: () {
//                       _cart.remove(_cart.items[index]);
//                       setState(() {});
//                     },
//                     icon: Icon(Icons.delete, color: context.accentColor)),
//                 title: _cart.items[index].name.text
//                     .color(context.accentColor)
//                     .make(),
//               );
//             }),
//           );
//   }
// }