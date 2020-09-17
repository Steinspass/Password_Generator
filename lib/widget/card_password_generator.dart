import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/generator/password_generator.dart';

class BuildCardGetPassword extends StatefulWidget {
  BuildCardGetPassword({Key key}) : super(key: key);

  @override
  _BuildCardGetPasswordState createState() => _BuildCardGetPasswordState();
}

class _BuildCardGetPasswordState extends State<BuildCardGetPassword> {
  
  String password = 'Password';

  double _sliderTotalLength = 8.0;

  bool _isSelectedUppercaseLetters = false;
  bool _isSelectedLowercaseLetters = false;
  bool _isSelectedNumbers = false;
  bool _isSelectedSymbols = false;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2.2,
        width: MediaQuery.of(context).size.width / 2.6,
        child: Card(
          color: Colors.grey[850],
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
          ),
          child: _columnOfItems(),
        ),
      ),
    );
  }

  Widget _columnOfItems() {
    return Column(
      children: [
        _containerPasswordGenerated(),
        _getPasswordLength(),
        _checkContainsUppercaseLetters(),
        _checkContainsLowercaseLetters(),
        _checkContainsNumbers(),
        _checkContainsSymbols(),
        _buttonGeneratedPassword()
      ],
    );
  }


 Widget _containerPasswordGenerated() {
   return GestureDetector(
     onTap: (){
        Clipboard.setData(ClipboardData(text: password));

        _copyWithSuccessSnackbar();
     },
     child: Container(
       margin: EdgeInsets.all(8.0),
       padding: EdgeInsets.all(15.0),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(2.0),
         color: Colors.grey[900],
       ),
       child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Text(
            password,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.yellowAccent[400],
              fontSize: 28.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.content_copy,
            color: Colors.yellowAccent,
            size: 36,
          )
         ],
       )
     ),
   );
 }

 Widget _getPasswordLength() {
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
      'Total Password Length: ${_sliderTotalLength.toInt()}',
      style: TextStyle(
        color: Colors.grey[100],
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic
      ),
    ),
        Slider(
      value: _sliderTotalLength, 
      onChanged: (newValue){
        setState(() {
          _sliderTotalLength = newValue;
        });
      },
      inactiveColor: Colors.yellowAccent[100],
      activeColor: Colors.yellowAccent[400],
      min: 8.0,
      max: 32.0,
      divisions: 24,
      label: '${_sliderTotalLength.toInt()}',
    ),
      ],
    ),
    
  );
 }

 Widget _checkContainsUppercaseLetters() {
  return CheckboxListTile(
    value: _isSelectedUppercaseLetters, 
    onChanged: (newValue){
      setState(() {
        _isSelectedUppercaseLetters = newValue;
      });
    },
    checkColor: Colors.indigo[900],
    activeColor: Colors.yellowAccent,
    title: Text(
      'Contains Uppercase letters',
      style: TextStyle(
        color: Colors.grey[100],
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic
      ),
    ),
  );
 }

 Widget _checkContainsLowercaseLetters() {
   return CheckboxListTile(
    value: _isSelectedLowercaseLetters, 
    onChanged: (newValue){
      setState(() {
        _isSelectedLowercaseLetters = newValue;
      });
    },
    checkColor: Colors.indigo[900],
    activeColor: Colors.yellowAccent,
    title: Text(
      'Contains Lowercase letters',
      style: TextStyle(
        color: Colors.grey[100],
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic
      ),
    ),
  );
 }

 Widget _checkContainsNumbers() {
   return CheckboxListTile(
    value: _isSelectedNumbers, 
    onChanged: (newValue){
      setState(() {
        _isSelectedNumbers = newValue;
      });
    },
    checkColor: Colors.indigo[900],
    activeColor: Colors.yellowAccent,
    title: Text(
      'Contains Numbers',
      style: TextStyle(
        color: Colors.grey[100],
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic
      ),
    ),
  );
 }

 Widget _checkContainsSymbols() {
   return CheckboxListTile(
    value: _isSelectedSymbols, 
    onChanged: (newValue){
      setState(() {
        _isSelectedSymbols = newValue;
      });
    },
    checkColor: Colors.indigo[900],
    activeColor: Colors.yellowAccent,
    title: Text(
      'Contains Symbols',
      style: TextStyle(
        color: Colors.grey[100],
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic
      ),
    ),
  );
 }

 Widget _buttonGeneratedPassword() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 80.0,
      vertical: 10.0
    ),
    child: RaisedButton(
      padding: EdgeInsets.all(10.0),
      onPressed: (){

        password = generatorOfPassword(
          totalLength: _sliderTotalLength.toInt(),
          isLowercases: _isSelectedLowercaseLetters,
          isUppercases: _isSelectedUppercaseLetters,
          isNumbers: _isSelectedNumbers,
          isSymbols: _isSelectedSymbols
        );

        setState(() {});

        

      },
      color: Colors.yellowAccent[400],
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Center(
        child: Text(
          'Generate a Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold
          ),
        ),
        
      ),
    ),
  );
 }

  void _copyWithSuccessSnackbar() {
    Flushbar(

      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: MediaQuery.of(context).size.width / 2.6,
      ),
      borderRadius: 10,
      backgroundGradient: LinearGradient(
        colors: [Colors.yellowAccent[400], Colors.green[400],],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadows: [BoxShadow(offset: Offset(0.5, 0.5), blurRadius: 1.0,)],
      duration: Duration(seconds: 3),
      messageText: Text(
        'Copied the Password',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
        ),
        ),
    )..show(context);
  }


}