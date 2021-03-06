import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class FormValidationWithDropdown extends StatefulWidget {
  @override
  _FormValidationWithDropdownState createState() =>
      _FormValidationWithDropdownState();
}

class _FormValidationWithDropdownState
    extends State<FormValidationWithDropdown> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String selectedGender;
  String name;

  String _seletedGov = "Two";
  int _seletedYear ;
  List _governate = [
    'Oneeeeeeeee',
    'Two',
    'Three',
    'Four',
  ];
  List <int> years = List();

   DateTime tm =  DateTime.now();
   int sub ;
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    final items = List<DateTime>.generate(70, (i) =>
        DateTime.utc(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ).add(Duration(days: i)));
    DateTime tenYearsLater = DateTime(now.year - 10, now.month, now.day);
    int n=  tm.year.toInt();
    sub = tm.year.toInt() - 70 ;

    for( var i = sub ; i <=n ; i++ ) {
      years.add(i);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Text(tm.year.toString()),
            Text(sub.toString()),
            Text(tenYearsLater.year.toString()),
            DropdownButton(
              hint: Text("اختر المحافظه"),
              value: _seletedGov,
                items: _governate.map((e) {
                  return DropdownMenuItem(child: Text(e), value: e,);
                }).toList(),
                onChanged: (value){
                setState(() {
                  _seletedGov= value;
                });
            }),
            DropdownButton(
                hint: Text("اختر سنه"),
                value: _seletedYear,
                items: years.map((e) {
                  return DropdownMenuItem(child: Text((e).toString()), value: e,);
                }).toList(),
                onChanged: (value){
                  setState(() {
                    _seletedYear= value;
                  });
                }),
            Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          hint: Text(
                            'النوع',
                          ),
                          onChanged: (gender) =>
                              setState(() => selectedGender = gender),
                          validator: (value) =>
                              value == null ? 'field required' : null,
                          items: ['انثى', 'ذكر']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Name'),
                          validator: (value) =>
                              value.isEmpty ? 'Name is required' : null,
                          onSaved: (value) => name = value,
                        ),
                        RaisedButton(
                          child: Text('PROCEED'),
                          color: Colors.blue,
                          onPressed: () {
                            if (_formKey.currentState.validate() && _seletedGov!=null) {
                              //form is valid, proceed further
                              _formKey.currentState.save();
                              print(selectedGender);
                              print(_seletedGov);
                              print(_seletedYear.toString());
                              //save once fields are valid, onSaved method invoked for every form fields
                            } else {
                              setState(() {
                                _autovalidate = true;//enable realtime validation
                              });
                            }
                          },
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
