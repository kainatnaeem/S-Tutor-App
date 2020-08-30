import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalyearproject/feeds/activity_feed.dart';
import 'package:finalyearproject/feeds/progress.dart';
import 'package:finalyearproject/loginpages/login_page_tutor.dart';
import 'package:finalyearproject/models/tutormodel.dart';
import 'package:finalyearproject/profile/edit_profile.dart';
import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/profile/profile_Tutor.dart';
import 'package:finalyearproject/profile/profile_student.dart';

import 'package:flutter/material.dart';

import 'package:finalyearproject/models/user.dart';

import 'package:finalyearproject/loginpages/login_page.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin<Search> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot> searchResultsFuture;

  handleSearch(String query) {
   
         Future<QuerySnapshot> tutors = tutorRef
        .where("edustatus", isGreaterThanOrEqualTo: query)
        .getDocuments();
    setState(() {
      // searchResultsFuture = users;
        searchResultsFuture = tutors;
    });
  }

  clearSearch() {
    searchController.clear();
  }

  AppBar buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: clearSearch,
          ),
        ),
        onFieldSubmitted: handleSearch,
      ),
    );
  }

  Container buildNoContent() {
    // final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(

 decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo[400],
          Colors.lightBlueAccent,
        ]),
      ),

      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // SvgPicture.asset(
            //   'assets/images/search.svg',
            //   height: orientation == Orientation.portrait ? 300.0 : 200.0,
            // ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        List<UserResult> searchResults = [];
        snapshot.data.documents.forEach((doc) {
          UserTutor user = UserTutor.fromDocument(doc);
          UserResult searchResult = UserResult(user);
          searchResults.add(searchResult);
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      appBar: buildSearchField(),
      body:
          searchResultsFuture == null ? buildNoContent() : buildSearchResults(),
    );
  }
}

class UserResult extends StatelessWidget {
  final UserTutor user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () =>  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>TutorProfile(
    profileTutorId:user.tid,
      ),
    ),
  ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              ),
              title: Text(
                user.displayName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                user.edustatus,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
  showProfileTutor(BuildContext context, {String profileId}) {
 
}
}

