import 'package:flutter/material.dart';
import '../../utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  bool onChange = false;
  final String originalUser = "trideep";
  final String originalPassword = "trideep123";

  gotoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onChange = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        onChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: context.canvasColor,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login_image.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 32),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username can't be empty";
                            } else if (value != originalUser) {
                              return "username is incorrect";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              hintText: "enter your username",
                              labelText: "UserName"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username can't be empty";
                            } else if (value.length < 6) {
                              return "password length should be atleast 6";
                            } else if (value != originalPassword) {
                              return "password is incorrect";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "enter your password",
                              labelText: "Password"),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Material(
                          borderRadius:
                              BorderRadius.circular(onChange ? 50 : 10),
                          color: onChange ? Colors.green : Colors.orangeAccent,
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () => gotoHome(context),
                            child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                alignment: Alignment.center,
                                height: onChange ? 50 : 40,
                                width: onChange ? 50 : 130,
                                child: onChange
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
