import 'package:flutter/services.dart';

class AppPlatformChannel{
  static Future<String> add(int a, int b) async{
    const MethodChannel channel = MethodChannel('calc_channel');
    try{
      var result = await channel.invokeMethod('add', {'a': a, 'b': b});
      return(result);
    }catch(e){
      return(e.toString());
    }
  }

  static Future<String> multiply(int a, int b) async{
    const MethodChannel channel = MethodChannel('calc_channel');
    try{
      var result = await channel.invokeMethod('multiply', {'a': a, 'b': b});
      return(result);
    }catch(e){
      return(e.toString());
    }
  }
}