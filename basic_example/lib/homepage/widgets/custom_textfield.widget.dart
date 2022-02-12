import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController txtControl;
  final String label;
  const CustomTextField(this.txtControl,this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin:const EdgeInsets.only(top:10,bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                Text(
                  label + ': ',
                ),
                 Container(
                    margin:const EdgeInsets.only(left:10),
                    width: 100,
                    child: TextField(
                      controller: txtControl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: label,
                ),),
                 ),
              ],),
            );
  }
}