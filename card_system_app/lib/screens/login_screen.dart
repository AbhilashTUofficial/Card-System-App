import 'package:card_system_app/Palette/constants.dart';
import 'package:card_system_app/Widgets/authInputField.dart';
import 'package:card_system_app/Widgets/logoSpace.dart';
import 'package:card_system_app/Widgets/showSnackBar.dart';
import 'package:card_system_app/resources/auth_methods.dart';
import 'package:card_system_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading=false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  logInUser()async{
    setState(() {
      _isLoading=true;
    });
    String res = await AuthMethods().logInUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading=false;
    });
    if (res == 'success') {

      showSnackBar("Success Logged In", context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
    } else if (res == 'wrong-password') {
      showSnackBar("Your Password is wrong!", context);
    } else if (res == 'too-many-requests') {
      showSnackBar("Slow down buddy", context);
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 100.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                const LogoSpace(),
                const SizedBox(height: 20.0),
                // Enter username
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email", style: labelStyle),
                    AuthInputField(
                      hintText: 'Enter Your Email',
                      type: 'email',
                      textInputType: TextInputType.text,
                      textEditingController: _emailController,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                // Enter Password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Password", style: labelStyle),
                    AuthInputField(
                      hintText: 'Enter Your Password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      type: 'password',
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  width: double.infinity,
                  child: RaisedButton(

                    elevation: 5.0,
                    onPressed: () => logInUser(),
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: _isLoading?const Center(child:SizedBox(child: CircularProgressIndicator(),width: 21,height: 21,)):const Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Not Registered yet? ",
                        style: labelStyle,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignupScreen())),

                      child: Container(
                        child: const Text(
                          "SIGN UP",
                          style: labelStyle,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



