import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/modules/auth/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Scaffold(
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
                          Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                TextField(
                                    onChanged: _.onUsernameChanged,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: "Nombre de Usuario")),
                                TextField(
                                    onChanged: _.onPasswordChanged,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: "Contraseña")),
                                SizedBox(height: 50),
                                FlatButton(
                                    onPressed: _.submit,
                                    color: Colors.black,
                                    child: Text("Ingresar",
                                        style: TextStyle(color: Colors.white)))
                              ]))
                        ])))));
  }
}

Widget _buildLogoSection() {
  return Container(
      alignment: Alignment.center,
      child: Image.asset('assets/logo.png', height: 150, width: 150));
}
