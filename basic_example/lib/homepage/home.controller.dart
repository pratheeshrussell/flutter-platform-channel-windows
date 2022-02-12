import 'package:basic_example/common/platform.channel.dart';
import 'package:flutter/material.dart';
import 'home.variables.dart';

class HomeController with HomeVariables{
  // Just a handler to check input values
  // Check the add(int a, int b) function in AppPlatformChannel class
  Future<void> add() async{
    int? ia = int.tryParse(a.text);
    int? ib = int.tryParse(b.text);
    String result = "";
    if(ia == null || ib == null){
      result = "Check the values please";
    } else {
      // This is the main call, check this function
      result = (await AppPlatformChannel.add(ia,ib)).toString();
    }
    // Just refresh the state
    currentState((){
      c=result;
    });
  }

  // just to save state and context
  // in real case use something like getx
  initialize(BuildContext ctx, StateSetter state){
    currentContext = ctx;
    currentState = state;
  }
}