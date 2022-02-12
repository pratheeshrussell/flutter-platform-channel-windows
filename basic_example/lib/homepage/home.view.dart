import 'package:basic_example/homepage/widgets/custom_textfield.widget.dart';
import 'package:flutter/material.dart';
import 'home.controller.dart';
import 'widgets/custom_button.widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    // just initialize
    WidgetsBinding.instance?.
    addPostFrameCallback((_) => controller.initialize(context,setState));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(controller.a,"Value a"),
            CustomTextField(controller.b,"Value b"),
            Text(controller.c),
            CustomButton(controller.add,buttonText:"Add")
          ],
        ),
    );
  }

}