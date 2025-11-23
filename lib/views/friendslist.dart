import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/friends.dart';
import 'package:flutter_application_6/models/userdata.dart';


class Friendslist extends StatelessWidget {
  Friendslist({super.key, required this.userdata});

  final Userdata userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friends friend) => Card(
    child: Column(
      children: [
        Expanded(child: Image.asset(
          friend.img
        )),
        Padding (padding: const EdgeInsets.all(8.0), 
        child: Text(friend.name)),
      ],
    ),
  );

  Widget friendsListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 180,
    ),
    itemCount: userdata.friendsList.length,
    itemBuilder: (BuildContext ctx, index){
      return friend(userdata.friendsList[index]);
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [
              Text('${userdata.friendsList.length} Friends')
            ],
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(height: 300, child: friendsListGrid()),
        SizedBox(height: 10, child: Container (color: Colors.grey)),
      ],
    ); 
  }
}