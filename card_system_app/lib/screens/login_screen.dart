import 'package:card_system_app/Palette/constants.dart';
import 'package:card_system_app/Widgets/logoSpace.dart';
import 'package:card_system_app/Widgets/showSnackBar.dart';
import 'package:card_system_app/resources/auth_methods.dart';
import 'package:flutter/material.dart';

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
    } else if (res == 'wrong-password') {
      showSnackBar("Your Password is wrong!", context);
    } else if (res == 'too-many-requests') {
      showSnackBar("Slow down buddy", context);
    } else {
      showSnackBar(res, context);
      print(res);
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
                    InputField(
                      hintText: 'Enter Your Email',
                      isPassword: false,
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
                    InputField(
                      hintText: 'Enter Your Password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPassword: true,
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
                      onTap: () {},
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

class InputField extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController textEditingController;
  final bool isPassword;

  const InputField(
      {Key? key,
      required this.textInputType,
      required this.hintText,
      required this.textEditingController,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: boxDecorationStyle,
      height: 60.0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textEditingController,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: isPassword
              ? const Icon(
                  Icons.lock,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
          hintText: hintText,
          hintStyle: hintTextStyle,
        ),
      ),
    );
  }
}

