
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/userMockData.dart';

class Changepassword extends StatefulWidget {
  final Users userData;
  Changepassword(this.userData);

  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  
  String _pass;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    print(widget.userData.pass);
  }

  _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        userMockData = Users(
            widget.userData.userImage,
            widget.userData.fname,
            widget.userData.lname,
            widget.userData.username,
            widget.userData.email,
            _pass);
      });
      Navigator.of(context).pop();
      print(_pass);
    } else {
      setState(() {});
    }
  }

  String validateOldPass(String value) {
    if (value.isEmpty)
      return 'Old password cannot be blank';
    else if (value != widget.userData.pass) {
      print(widget.userData.pass);
      return 'Invalid old password';
    } else
      return null;
  }

  String validateConPass(String value) {
    if (value.isEmpty)
      return 'Confirm password cannot be blank';
    else if (value != _pass)
      return 'Password does not match';
    else
      return null;
  }

  String validateNewPass(String value) {
    setState(() {
      _pass = value;
    });
    if (value.isEmpty) {
      return 'New password cannot be blank';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: _validateInputs,
              child: Icon(Icons.check),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Old Password',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onSaved: (val) {
                  },
                  validator: validateOldPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter old password',
                      border: OutlineInputBorder(),
                      isDense: true),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'New Password',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onSaved: (val) {
                    _pass = val;
                  },
                  obscureText: true,
                  validator: validateNewPass,
                  decoration: InputDecoration(
                      hintText: 'Enter new password',
                      border: OutlineInputBorder(),
                      isDense: true),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Confirm new Password',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onSaved: (val) {
                  },
                  obscureText: true,
                  validator: validateConPass,
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(),
                      isDense: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
