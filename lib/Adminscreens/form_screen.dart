import 'package:flutter/material.dart';
// import 'package:prototype/Adminscreens/display_page.dart';
import 'package:prototype/models/task.dart';
// import 'package:prototype/models/mock_data.dart';
// import 'package:prototype/models/task.dart';
// import 'package:prototype/models/todo.dart';

class FormScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _place = "";
  String _state = "";
  String _image = "";
  String _status = "";
  bool _favorite = false;
  Task task;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPlace() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Place'),
      maxLength: 10,
      validator: (String _place) {
        if (_place.isEmpty) {
          return 'Place is Required';
        }

        return null;
      },
      onChanged: (value) => _place = value,
    );
  }

Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'State'),
      maxLength: 10,
      validator: (String _state) {
        if (_state.isEmpty) {
          return 'State is Required';
        }

        return null;
      },
      onChanged: (value) => _state = value,
    );
  }

Widget _buildImage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Image'),
      maxLength: 10,
      validator: (String _image) {
        if (_image.isEmpty) {
          return 'Image is Required';
        }

        return null;
      },
      onChanged: (value) => _image = "img/"+value+".jpg",
    );
  }

 Widget _buildStatus() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Status'),
      maxLength: 10,
      validator: (String _status) {
        if (_status.isEmpty) {
          return 'Status is Required';
        }

        return null;
      },
      onChanged: (value) => _status = value,
    
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Form Demo")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPlace(),
              _buildState(),
              _buildImage(),
              _buildStatus(),
              SizedBox(height: 100),
              RaisedButton(

                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                 onPressed: () {
                   Task task = new Task(
                      place: _place,
                      state: _state,
                      image: _image,
                      status: _status,
                      favorite: _favorite,
                   );

                   
                   Navigator.of(context).pop(task);
                 }

              )
            ],
          ),
        ),
      ),
    );
  }
}
// TODO Implement this library.// TODO Implement this library.
