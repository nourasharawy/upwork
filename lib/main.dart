import 'package:flutter/material.dart';
import 'package:tryapp/radiobutton.dart';

import 'dropdown_try.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Radio Button Group Example"),
          ),
          body: SafeArea(
              child : Center(
                 child : FormValidationWithDropdown(),
                //child:RadioGroup(),

              )
          )
      ),
    );
  }
}


