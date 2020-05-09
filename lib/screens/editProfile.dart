import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../models/user.dart';
import '../models/userMockData.dart';
import 'package:image_picker/image_picker.dart';


class EditProfile extends StatefulWidget {
  final Users userData;
  EditProfile(this.userData);

  @override
  _EditProfileState createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfile>{

  File imageFile;
  String _username;
  String _fname;
  String _lname;
  String _email;

  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        userMockData =
            Users(imageFile, _fname, _lname, _username, _email, widget.userData.pass);
        print('Success');
        Navigator.of(context).pop();
      });
    } else {
      setState(() {});
    }
  }

  String validateUsername(String value) {
    if (value.isEmpty)
      return 'Username cannot be blank';
    else if (value.length < 6)
      return 'Username must be 6 characters or more';
    else
      return null;
  }

  String validateFname(String value) {
    if (value.isEmpty) {
      return 'First name cannot be blank';
    } else
      return null;
  }

  String validateLname(String value) {
    if (value.isEmpty) {
      return 'Last name cannot be blank';
    } else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be blank';
    } else if (value.length < 6)
      return 'Password must be 6 characters or more';
    else
      return null;
  }

  String validatePhone(String value) {
    if (!(value.length >= 10 && value.length <= 11))
      return 'Please enter a valid phone number';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a valid email';
    else
      return null;
  }

  getImage(){
      if (widget.userData.userImage != null) {
      return FileImage(widget.userData.userImage);
    } else if (imageFile == null) {
      return AssetImage('img/user.png');
    } else {
      return FileImage(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(EvaIcons.arrowBackOutline)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: _validateInputs,
              child: Icon(EvaIcons.checkmark),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: MediaQuery.of(context).padding,
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(50.0),
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () async {
                       var picture = await ImagePicker.pickImage(
                          source: ImageSource.gallery);

                      setState(() {
                        imageFile = picture;
                        userMockData.userImage = imageFile;
                      });
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage: getImage(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'First Name',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextFormField(
                          validator: validateFname,
                          onSaved: (String val) {
                            _fname = val;
                          },
                          initialValue: widget.userData.fname,
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Last Name',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextFormField(
                          validator: validateLname,
                          onSaved: (String val) {
                            _lname = val;
                          },
                          initialValue: widget.userData.lname,
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextFormField(
                          validator: validateUsername,
                          onSaved: (String val) {
                            _username = val;
                          },
                          initialValue: widget.userData.username,
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextFormField(
                          validator: validateEmail,
                          onSaved: (String val) {
                            _email = val;
                          },
                          initialValue: widget.userData.email,
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}