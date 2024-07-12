import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List following;
  final List followers;
  final String photoUrl;
  final String college;
  final String department;
  final String year;
  final bool oncampus;
  final String hall;
  final String denomination;
  const User(
      {required this.username,
      required this.uid,
      required this.email,
      required this.bio,
      required this.followers,
      required this.following,
      required this.photoUrl,
      required this.college,
      required this.department,
      required this.denomination,
      required this.year,
      required this.hall,
      required this.oncampus});

  // function to Json
  Map<String, dynamic> toJson() => {
        "username": username,
        'uid': uid,
        'email': email,
        "bio": bio,
        'following': [],
        'followers': [],
        'photoUrl': photoUrl,
        'college': '',
        'department': '',
        'year': '',
        'oncampus': false,
        'hall': '',
        'denomination': '',
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl'],
        college: snapshot['college'],
        department: snapshot['department'],
        denomination: snapshot['snapshot'],
        year: snapshot['year'],
        hall: snapshot['hall'],
        oncampus: snapshot['false']);
  }
}
