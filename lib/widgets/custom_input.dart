import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassowrd;

  const CustomInput({
    Key key,
    @required this.icon,
    @required this.placeHolder,
    @required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassowrd = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: Offset(0, 5),
                      blurRadius: 5)
                ]),
            child: TextField(
              controller: this.textController,
              autocorrect: false,
              keyboardType: this.keyboardType,
              obscureText: this.isPassowrd,
              decoration: InputDecoration(
                  prefixIcon: Icon(this.icon),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: this.placeHolder),
            ),
          )
        ],
      ),
    );
  }
}
