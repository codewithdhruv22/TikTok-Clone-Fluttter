import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_yt/controller/auth_controller.dart';
import 'package:tiktok_yt/view/widgets/glitch.dart';

import '../../widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _setpasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          //const - Constant - Value - String , Int  - Fix Rahega  - Use Karna
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GlithEffect(child: const Text("Welcome To TikTok" ,style: TextStyle(fontWeight: FontWeight.w900 , fontSize: 30),)),
              SizedBox(height: 25,),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();

                },
                child: Stack(
                  children: [
                    const CircleAvatar(backgroundImage: NetworkImage("https://st3.depositphotos.com/1767687/16607/v/450/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg"), radius: 60,),
                    Positioned( bottom: 0, right: 0, child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.edit , size: 20,color: Colors.black,)))
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setpasswordController,
                  myLabelText: "Set Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _confirmpasswordController,
                  myLabelText: "Confirm Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernameController,
                  myLabelText: "Username",
                  myIcon: Icons.person,
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){


             AuthController.instance.SignUp(_usernameController.text, _emailController.text,_setpasswordController.text, AuthController.instance.proimg);
              }, child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),

                  child: Text("Sign Up")))
            ],
          ),

        ),
      ),
    );
  }
}
