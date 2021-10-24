import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/modals/cart.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

// class AddToCart extends StatefulWidget {
//   final Item catalog;

//   const AddToCart({
//     Key? key,
//     required this.catalog,
//   }) : super(key: key);

//   @override
//   _AddToCartState createState() => _AddToCartState();
// }

// final _cart = CartModel();

// class _AddToCartState extends State<AddToCart> {
//   @override
//   Widget build(BuildContext context) {
//     bool btnClick = _cart.items.contains(widget.catalog) ? true : false;

//     return ElevatedButton(
//         style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(context.theme.buttonColor)),
//         onPressed: () {
//           if (btnClick == false) {
//             btnClick = btnClick.toggle();

//             final _catalog = CatalogModel();

//             _cart.catalog = _catalog;
//             _cart.add(widget.catalog);
//             setState(() {});
//           }
//         },
//         child: btnClick
//             ? Icon(
//                 Icons.done,
//                 color: context.cardColor,
//               )
//             : Icon(CupertinoIcons.cart_fill_badge_plus,
//                 color: context.cardColor));
//   }
// }

class AddToCart extends StatelessWidget {
  final Item catalog;

  final CartModel cart = (VxState.store as MyStore).cart;

  AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    bool btnClick = cart.items.contains(catalog) ? true : false;

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        onPressed: () {
          if (btnClick == false) {
            btnClick = btnClick.toggle();

            final _catalog = CatalogModel();

            cart.catalog = _catalog;
            AddMutation(catalog);
          }
        },
        child: btnClick
            ? Icon(
                Icons.done,
                color: context.cardColor,
              )
            : Icon(CupertinoIcons.cart_fill_badge_plus,
                color: context.cardColor));
  }
}
