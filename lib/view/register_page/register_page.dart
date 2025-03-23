import 'package:ecommerce_app_task/components/my_button/my_button.dart';
import 'package:ecommerce_app_task/components/my_textfield/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // email and password textediting controller
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _conpasswordcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  //register logic
  void register() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message, size: 60, color: Colors.blue),
            SizedBox(height: 50),
            //welcome back message
            Text(
              "Lets Create an account for you",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 50),

            //email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,
            ),
            SizedBox(height: 10),
            //pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordcontroller,
            ),
            SizedBox(height: 10),
            //confirmpw textfield
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _conpasswordcontroller,
            ),
            SizedBox(height: 10),
            //login button
            MyButton(onTap: register, text: "Register"),
            //register now
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
