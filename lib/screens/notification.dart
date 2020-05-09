import 'package:flutter/material.dart';



class NotificationSetting extends StatelessWidget
{
  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),

      body: 

      
      SingleChildScrollView(
      
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('Notification Settings', 
        style: TextStyle(
          fontSize:20.0, 
          fontWeight: FontWeight.bold,
          color:  Colors.blue),
     
        ),
      ),
      SwitchListTile(

        value: true,
        title: Text('Received Notification'),
        onChanged: (val){},
        ),
      
      SwitchListTile(
        
        value: true,
        title: Text('Notification Sound'),
        onChanged: (val){},
        ),

      SwitchListTile(
        
        value: false,
        title: Text('Received NewsLetter'),
        onChanged:null,
        ),
        SwitchListTile(
        
        value: false,
        title: Text('Received App Updates'),
        onChanged: null,
        ),

        
        
          ],
          
        ),
      ),
    );
  }
}