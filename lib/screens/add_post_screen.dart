import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventhub/providers/user_provider.dart';
import 'package:eventhub/resources/auth_method.dart';
import 'package:eventhub/utils/colors.dart';
import 'package:eventhub/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  void logOut() {
    AuthMethods().signOut();
  }

  Uint8List? _file;

  _selectImage(BuildContext context) async {
//  show a simple dialog box
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(title: Text('make a post'), children: <Widget>[
            SimpleDialogOption(
              child: const Text('take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              child: const Text('choose from gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              child: const Text('cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // getuser photo url and display it in the provider
    // final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectImage(context),
                icon: const Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text(
                'Post to',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Post',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      )),
                )
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1719864932976-85716ff1f9a7?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'write a caption',
                            border: InputBorder.none),
                        // maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  // add image here, will be uint8list later
                                  image: NetworkImage(""),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter),
                            ),
                          )),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
          );
  }
}
