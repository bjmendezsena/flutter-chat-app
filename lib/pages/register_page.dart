import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text('Regístrate',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('Crea tu nueva cuenta, es gratis',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700])),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: 'Nombre', controler: nameCtrl),
                          makeInput(label: 'Email', controler: emailCtrl),
                          makeInput(
                              label: 'Contraseña',
                              obscureText: true,
                              controler: passCtrl),
                          makeInput(
                              label: 'Confirmar contraseña',
                              obscureText: true,
                              controler: confirmCtrl),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border(
                                bottom: BorderSide(color: Colors.black87),
                                top: BorderSide(color: Colors.black87),
                                left: BorderSide(color: Colors.black87),
                                right: BorderSide(color: Colors.black87),
                              )),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: authService.autenticando
                                ? null
                                : () async {
                                    if (passCtrl.text == confirmCtrl.text) {
                                      final registroOk =
                                          await authService.register(
                                              nameCtrl.text.trim(),
                                              emailCtrl.text.trim(),
                                              passCtrl.text);

                                      if (registroOk == true) {
                                        //TODO: Conectar a socket server
                                        Navigator.pushReplacementNamed(
                                            context, 'usuarios');
                                      }else{
                                        mostrarAlerta(
                                          context,
                                          'Registro incorrecto incorrecto',
                                          registroOk);
                                      }
                                    } else {
                                      mostrarAlerta(
                                          context,
                                          'Registro incorrecto incorrecto',
                                          'Las contraseñas deben coincidir');
                                    }
                                  },
                            color: Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'Regístrate',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('¿Ya tienes cuenta?'),
                        Text('¡Regístrate!',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false, controler}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87)),
      SizedBox(height: 5),
      TextField(
        controller: controler,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
      ),
      SizedBox(height: 30)
    ],
  );
}
