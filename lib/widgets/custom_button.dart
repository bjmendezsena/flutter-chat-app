import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({
    Key key, 
    @required this.text, 
    @required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: this.onPressed,
        color: Colors.blue,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          this.text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
