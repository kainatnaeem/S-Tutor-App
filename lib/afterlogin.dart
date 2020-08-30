

import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/profile/profile_student.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:finalyearproject/services/firebase_auth.dart';
//import 'package:finalyearproject/services/root_page.dart';
import 'package:finalyearproject/loginpages/student_sign.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/loginpages/login_page.dart';

import 'feeds/feeds.dart';
import 'loginpages/login_page_tutor.dart';




                   String username;
  String cnic;
  String phoneNumber;
class AfterLogin  extends StatefulWidget {
  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin>
 {
int _currentIndex=0;
final List<Widget> _children=
[
  Feeds(),
   UserProfile(),
];
void onTappedBar(int index) {
  setState((){

_currentIndex =index;
  });
}

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
      centerTitle:true,
      title: Text("S-Tutor"),

        backgroundColor: Colors.indigo[500],
      ),


body: LayoutBuilder(
  builder: (context, constaint) {
    return new GridView(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      
      ),
      children: <Widget>[
     
          
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container( 
                     height:130,
                      width:150,
                       margin: const EdgeInsets.only(top: 150.0),
                      child: Card(
                          color: Colors.lightBlue,
                                           child:   Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                               IconButton(
                      icon: new Icon(Icons.person),color: Colors.white,iconSize: 40,
                      
                      highlightColor: Colors.pink,
                      onPressed: (){ 
                       
                    Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>LoginPage(),
                            ),
                          );
                       } ), 
                    Text("Students", style:TextStyle(color:Colors.white))
                                             ],
                                           ) ,      
                      
                       
                             ),),
             
SizedBox(
  width:10,
),
         
                new Container( 
                  height:130,
                  width:150,
                   margin: const EdgeInsets.only(top: 150.0),
                  child: Card(
                      color: Colors.indigo,
                                       child:   Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: <Widget>[
                                           IconButton(
                  icon: new Icon(Icons.person),color: Colors.white,iconSize: 40,
                  
                  highlightColor: Colors.pink,
                  onPressed: (){ 
                   
                Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>LoginPageTutor(),
                        ),
                      );
                   } ), 
                Text("Tutors", style:TextStyle(color:Colors.white))
                                         ],
                                       ) ,      
                  
                   
                         ),),
           
         
     ],
                ),
            

      ]);})

    );
  }
}
