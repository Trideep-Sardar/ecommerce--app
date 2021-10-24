import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/modals/catalogs.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/drawer_widget.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  bool islight;

  HomePage({Key? key, required this.islight}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoute.cartRoute);
          },
          child: Icon(
            CupertinoIcons.cart,
            color: context.cardColor,
          ),
          backgroundColor: context.theme.buttonColor,
        ),
      ),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: "Ecommerce App".text.color(context.accentColor).make(),
        actions: [
          Switch.adaptive(
            value: widget.dark,
            onChanged: (state) {
              setState(() {
                widget.light = state;
              });
            },
          )
        ],
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().p12().expand()
              else
                Center(child: CircularProgressIndicator()).expand()
            ],
          ),
        ),
      ),
    );
  }
}
