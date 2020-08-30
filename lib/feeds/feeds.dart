//import 'package:finalyearproject/login.dart';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalyearproject/loginpages/login_page_tutor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:finalyearproject/loginpages/login_page.dart';
import 'package:finalyearproject/drawerpages/page1.dart';
import 'package:finalyearproject/services/auth.dart';
import 'package:finalyearproject/services/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'activity_feed.dart';
import 'package:finalyearproject/drawerpages/page2.dart';
import 'package:finalyearproject/drawerpages/page3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feeds extends StatelessWidget {
Widget _buildDrawer(BuildContext context){


  return
        new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(  "${currentUserTutor.displayName}",   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.white,fontWeight:FontWeight.w100),),
          ),
              accountEmail: new Text( "${currentUserTutor.email}",   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.white,fontWeight:FontWeight.w100),),
          ),
              decoration: BoxDecoration(
                color: Colors.indigo[500],
              ),
              currentAccountPicture: new CircleAvatar(
                   backgroundImage:
                          CachedNetworkImageProvider(currentUserTutor.photoUrl),
              //  child: new Text('Kain'),
              ),
              // otherAccountsPictures: <Widget>[
              //   new CircleAvatar(
              //       backgroundColor: Colors.white, child: new Text('k'))
              // ],
            ),
            new ListTile(
                title: new Text('Feeds',   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.favorite),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Feeds(),
                  ));
                }),
                //   new ListTile(
                // title: new Text('Student Profile'),
                // trailing: new Icon(Icons.pages),
                // onTap: () {
                //   Navigator.of(context).pop();

                //   Navigator.of(context).push(new MaterialPageRoute(
                //     builder: (BuildContext context) => new StuProfile(),
                //   ));
                // }),
                 new ListTile(
                title: new Text('Notifications' ,  style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.notifications),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ActivityFeed(),
                  ));
                }),
                     new Divider(),
                   // Text("Communicate",style:TextStyle(color: Colors.black)),
            new ListTile(
                title: new Text('About App',   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.android),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new NewPage2("Certificates"),
                  ));
                }),
            new ListTile(
                title: new Text('Share',   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.share),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new NewPage3('Share'),
                  ));
                }),
        
            new ListTile(
                title: new Text('Ratings',   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.star),
               // onTap: logout,
               ),
                 new ListTile(
                title: new Text('Sign Out',   style: GoogleFonts.aclonica(textStyle: TextStyle(color:Colors.black,fontWeight:FontWeight.w100),),
          ),
                trailing: new Icon(Icons.close),
                // onTap: logout,
                ),
          ],
        ),
      );}
  //      logout() {
  //   googleSignIn.signOut();
  // }
  @override
  Widget build(BuildContext context) {
    
  //   var devicesize = MediaQuery.of(context).size;
  //    logout() async {
  //   await googleSignIn.signOut();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  // }
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Feeds", style: GoogleFonts.aclonica()),
        actions: <Widget>[
          
        ],
        backgroundColor: Colors.indigo[500],
     //   elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
 drawer: _buildDrawer(context),
     
      body:
        
          ListView(
        children: <Widget>[
    
       //   _buildFeed(),
         
        ],
      ),
     
    );
  }
  

  Widget _buildFeed() {
    var title;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.indigo[500],
        ),
        height: 360,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(child: Text('user')
                            // child: Image(
                            //   height: 50.0,
                            //   width: 50.0,
                            //  // image: AssetImage(posts[index].authorImageUrl),
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      ),
                    ),

                    title: Text(
                      // title[index].authorName,
                      'kainat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // subtitle: Text(posts[index].timeAgo),
                    subtitle: Text(
                      'Teacher',
                      style: TextStyle(fontSize: 13),
                    ),

                    trailing: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                      onPressed: () => print('More'),
                    ),
                  ),
                  //  InkWell(
                  //                 onDoubleTap: () => print('Like post'),
                  //                 onTap: (){}

                  //                 ),
                ],
              ),
            ),

            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.lightBlue,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlue,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                  'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Windows, Mac, Linux, Google Fuchsia and the web. The first version of Flutter was known as codename "Sky" and ran on the Android operating system',
                  style: TextStyle(color: Colors.white, letterSpacing: 1)),
              padding: EdgeInsets.all(20),
            ),
//=======

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            iconSize: 30.0,
                            onPressed: () => print('Like post'),
                          ),
                          Text(
                            '515',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.0),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.chat,
                              color: Colors.white,
                            ),
                            iconSize: 30.0,
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => ViewPostScreen(
                              //       post: posts[index],
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.filePdf,
                      color: Colors.white,
                    ),
                    iconSize: 30.0,
                    // onPressed: () => print('upload doc'),
                    onPressed: () {
                      // UserManagement().logOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
    
  }
  
}
