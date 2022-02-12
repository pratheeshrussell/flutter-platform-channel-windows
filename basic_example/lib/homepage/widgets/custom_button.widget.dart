import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function() callback;
  const CustomButton(this.callback,{this.buttonText="click me",Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top:10,bottom:10),
      child: ElevatedButton(
        child: Text(buttonText),
        onPressed:callback,
        style: ElevatedButton.styleFrom(
             primary: Colors.black,
             
       ),
),
    );
  }
}