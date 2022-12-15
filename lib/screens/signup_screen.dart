import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SignUp",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                InkWell(
                  child: CircleAvatar(
                    radius: 70,
                  ),
                ),
                const SizedBox(height: 10),

                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your FullName"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Email"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Password"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration:
                      InputDecoration(hintText: "Enter your confirm Password"),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                    child: Text("SignUp"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
