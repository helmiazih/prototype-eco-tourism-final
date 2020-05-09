import 'dart:io';

class Users {
  File userImage;
  String fname;
  String lname;
  String username;
  String email;
  final String pass;

  Users(this.userImage, this.fname, this.lname, this.username, this.email,
      this.pass);

  Users.copy(Users from)
      : this(from.userImage, from.fname, from.lname, from.username, from.email,
            from.pass);
}
