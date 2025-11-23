import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/userdata.dart';
import 'package:flutter_application_6/views/friendslist.dart';
import 'package:flutter_application_6/views/infoheader.dart';
import 'package:flutter_application_6/views/mainheader.dart';
import 'package:flutter_application_6/views/postslist.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  Userdata userdata = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendslist(userdata: userdata),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
              child: Row(children: [
                Text('Posts', style: followTxtStyle)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Postslist(userdata: userdata),
        ],
      ),
    );
  }
}