import 'package:flutter/material.dart';
import 'package:prototype/models/userMockData.dart';

import 'AccountSetting.dart';
import 'HelpSupport.dart';
import 'notification.dart';
import 'editProfile.dart';
import 'changePassword.dart';
import '../models/user.dart';
import '../models/userMockData.dart';

class SettingUser extends StatefulWidget {
  //static final String path = "li"
  @override
  _SettingUserState createState() => _SettingUserState();
}

class _SettingUserState extends State<SettingUser> {
  editProfileNavi() async {
    Users returnUserData = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Changepassword(userMockData)));
    if (returnUserData != null) {
      setState(() => userMockData = returnUserData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context,userMockData),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.blueAccent,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile(userMockData)));
                },
                title: Text('Personal Information'),
                leading: CircleAvatar(
                    backgroundImage: userMockData.userImage == null
                        ? null
                        : FileImage(userMockData.userImage),
                    backgroundColor: Colors.white),
                trailing: Icon(Icons.edit),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Card(
            elevation: 8.0,
            // margin: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.grey[200],
            child: Column(children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.collections_bookmark, color: Colors.blueAccent),
                onTap: () {},
                title: Text('Favorite'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.blueAccent),
                onTap: editProfileNavi,
                title: Text('Change Password'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.vpn_key, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSetting()),
                  );
                },
                title: Text('Account'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSetting()),
                  );
                },
                title: Text('Notification'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              _buildDivider(),
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpSupport()),
                  );
                },
                title: Text('Help and Support'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              _buildDivider(),
            ]),
          )
        ],
      )),
    );
  }

  Container _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}