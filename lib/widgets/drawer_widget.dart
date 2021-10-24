import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Trideep Sardar"),
                  accountEmail: Text("trideepSardar@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/login_image.png"))),
            ),
            ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text("Home", style: TextStyle(color: Colors.white))),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, MyRoute.loginRoute);
                },
                leading:
                    Icon(CupertinoIcons.profile_circled, color: Colors.white),
                title: Text("Profile", style: TextStyle(color: Colors.white))),
            ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white),
                title: Text("mail", style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

class CuperTinoIcons {}
