import "package:flutter/material.dart";
import 'package:flutter_catelog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

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
          Text("Welcome $name", style: const TextStyle(
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
                    ),
                    onChanged: (value){
                      name = value;
                      setState((){});
                    },
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
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      setState((){
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 45,
                      width: changeButton ? 45 : 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(changeButton ? 45 : 10),
                      ),
                      child: changeButton ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      ) : const Text('Login', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),)
                    )
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text('Login'),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: Size(200, 35),
                  //   ),
                  // ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
