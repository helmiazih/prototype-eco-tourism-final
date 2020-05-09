import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget
{
  @override
  Widget build (BuildContext context){

    return Scaffold(
     appBar: AppBar(
        title: Text('Account Setting'),
      ),

      body: 

      
      SingleChildScrollView(
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('Account', 
        style: TextStyle(
          fontSize:20.0, 
          fontWeight: FontWeight.bold,
          color:  Colors.blue),
     
        ),
      ),
      

        
              Card(
                elevation: 8.0,
               // margin: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                
                child: Column(
                  
                  children: <Widget>[

                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Privacy'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    
                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Security'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    ListTile(
                      onTap: (){

                      },
                      title:  Text('Change Number'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                    ),
                    
                  ],
        
                )
              ),
              
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Card(
                  elevation: 8.0,
               // margin: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
               // color: Colors.grey[200],
                  child: Column(
                    
                    children: <Widget>[

                      ListTile(
                        onTap: (){

                        },
                        title:  Text('Request Account Info'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        
                      ),
                      
                      ListTile(
                        onTap: (){

                        },
                        title:  Text('Delete My Account'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        
                      ),
                      
                      
                    ],
        
                  )
                ),
              )
        ],
          
        ),
      ),
    );
  }
}