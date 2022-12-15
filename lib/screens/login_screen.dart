import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                  "LogIn",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Email"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Password"),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                    child: Text("LogIn"),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    CupertinoButton(
                        onPressed: () {},
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
