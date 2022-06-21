import "package:flutter/material.dart";
import 'package:flutter_catelog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login.png", fit: BoxFit.cover),
          const SizedBox(
            height: 20.0,
          ),
          const Text("Welcome", style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          )),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        labelStyle: TextStyle(
                            color: Colors.blue
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      minimumSize: Size(200, 35),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
