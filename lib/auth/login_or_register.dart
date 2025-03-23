import 'package:ecommerce_app_task/view/login_page/login_page.dart';
import 'package:ecommerce_app_task/view/register_page/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially ,show login page
  bool showLoginPage=true;
  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  //toggle b/w login and register page
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages,);
    }else{
      return RegisterPage(onTap: togglePages,);
    }


  }
}