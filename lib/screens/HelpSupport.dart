import 'package:flutter/material.dart';



class HelpSupport extends StatelessWidget
{
  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
      ),

      body: 

      
      SingleChildScrollView(
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('Help & Support', 
        style: TextStyle(
          fontSize:20.0, 
          fontWeight: FontWeight.bold,
          color:  Colors.blue),
     
        ),
      ),
      

        
              Card(
                
                child: Column(
                  
                  children: <Widget>[

                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Report a Problem'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    
                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Help Center'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Support Request'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Privacu and Security Help'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                  ],
        
                )
              ),
        ],
          
        ),
      ),
    );
  }
}