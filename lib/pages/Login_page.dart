import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final formkey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    {
      if (formkey.currentState!.validate()) {
        setState(() {
          changeButton = true;
        });
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoute.homeRoute);
        setState(() {
          changeButton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/undraw_fitness_stats_sht6.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Welcome To",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Shopping App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Email", labelText: "Email"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Emailcannot be empty";
                          } else if (!value.contains('@gmail.com')) {
                            return "Invalid Email address";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter Password", labelText: "Passward"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          } else if (!value.contains(RegExp('[0-9]'))) {
                            return "Password should contain atleast one number";
                          } else if (!value.contains(RegExp('[A-Z]'))) {
                            return "Password should contain atleast one uppercase letter";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 70 : 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () => MoveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 40 : 100,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.black,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //   child: Text(
                      //     "Login",
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoute.HomeRoute);
                      //   },
                      //   style: TextButton.styleFrom(
                      //     backgroundColor:
                      //         const Color.fromARGB(255, 123, 101, 220),
                      //     minimumSize: Size(100, 40),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
