import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/modules/auth/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        /*builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x132238), Color(0x0075A8)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogoSection(),
                SizedBox(height: 80),
                _buildSignInButton(context),
                SizedBox(height: 20),
                _buildSignUpButton(context),
                SizedBox(height: 20),
                _buildFingerprintSection(),
              ],
            ),
          ),
        ),
      ),*/
        builder: (_) => Scaffold(
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: _.onUsernameChanged,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "username",
                        ),
                      ),
                      TextField(
                        onChanged: _.onPasswordChanged,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "password",
                        ),
                      ),
                      FlatButton(
                        onPressed: _.submit,
                        color: Colors.black,
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

Widget _buildLogoSection() {
  return Container(
    alignment: Alignment.center,
    child: Image.asset(
      'assets/logo.png',
      height: 150,
      width: 150,
    ),
  );
}

Widget _buildFingerprintSection() {
  return Container(
    margin: EdgeInsets.only(top: 40, bottom: 20),
    child: Column(
      children: [
        Text(
          'Login Rápido con Touch ID',
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        SizedBox(height: 20),
        Icon(
          Icons.fingerprint,
          size: 90,
          color: Colors.grey,
        ),
        SizedBox(height: 20),
        Text(
          'Touch ID',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    ),
  );
}

Widget _buildSignInButton(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Color(0x132238).withAlpha(100),
            offset: Offset(2, 4),
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
        color: Colors.white,
      ),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ),
  );
}

Widget _buildSignUpButton(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Text(
        'Registrarse',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
