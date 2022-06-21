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
  final _formKey = GlobalKey<FormState>();

  goToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/hey.png", fit: BoxFit.cover),
            const SizedBox(
              height: 20.0,
            ),
            Text("Welcome $name", style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
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
                        validator: (value){
                          if(value == null || value == ""){
                            return "Username cannot be empty";
                          }
                        },
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
                        validator: (value){
                          if(value == null || value == ""){
                            return "Password cannot be empty";
                          }else if(value.length < 6){
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
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
                      Material(
                          borderRadius: BorderRadius.circular(changeButton ? 45 : 10),
                          color: Colors.deepPurple,
                          child: InkWell(
                              onTap: () => goToHome(context),
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 45,
                                  width: changeButton ? 45 : 160,
                                  alignment: Alignment.center,
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
                      )
                    ],
                  ),
                )
            )
          ],
        )
      )
    );
  }
}
