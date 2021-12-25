import 'package:card_system_app/Palette/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                // Enter Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text("Email", style: labelStyle),
                    InputField(
                      hintText: 'Enter Your Email',
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                // Enter Password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text("Password", style: labelStyle),
                    InputField(
                      hintText: 'Enter Your Password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                    ),
                  ],
                ),
                const LogInButton(),
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
      child:  TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textEditingController,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: const Icon(
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

class LogoSpace extends StatelessWidget {
  const LogoSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage("assets/img/logo.png"),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
