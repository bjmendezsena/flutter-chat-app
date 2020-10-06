import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height  * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Iniciar sesión',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Inicia sesión con tu cuenta',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    CustomInput(
                      icon: Icons.mail_outline,
                      placeHolder: 'Correo',
                      keyboardType: TextInputType.emailAddress,
                      textController: emailCtrl,
                    ),
                    CustomInput(
                      icon: Icons.lock_outline,
                      placeHolder: 'Contraseña',
                      textController: passCtrl,
                      isPassowrd: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: CustomButton(
                  text: 'Iniciar Sesión',
                  onPressed: () {
                    print(this.emailCtrl.text);
                    print(this.passCtrl.text);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿No tienes cuenta?'),
                  Text('¡Regístrate!',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ilustration.png'),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
