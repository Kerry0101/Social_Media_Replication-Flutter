import 'package:flutter/material.dart';
import 'package:flutter_application_6/views/profile.view.dart';
import '../models/userdata.dart';
import '../models/userposts.dart';

class Postslist extends StatefulWidget {
  const Postslist({super.key, required this.userdata});

  final Userdata userdata;
  @override
  State<Postslist> createState() => _PostlistState();
}

class _PostlistState extends State<Postslist>{
  var nametxtStyle = const TextStyle (fontSize: 16, fontWeight: FontWeight.bold);

  gotoPage (BuildContext context, dynamic page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> page));
  }

  Widget buttons (Userposts userPosts) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPosts.isLiked) ? Colors.blue: Colors.grey,
        ),onPressed: (){
            setState(() {
              userPosts.isLiked = (userPosts.isLiked) ? false : true;
            });
        },
        icon: const Icon(Icons.thumb_up_rounded),
        label: const Text('Like'),
      ),
      TextButton.icon(style: TextButton.styleFrom(
        foregroundColor:Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.message_rounded),
        label: const Text('Comment'),
      ),

      TextButton.icon(style: TextButton.styleFrom(
        foregroundColor:Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share_rounded),
        label: const Text('Share'),
      ),
    ],
  );

  Widget postCount (Userposts userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.numcomments} Comments'),
      const Text(''),
      const SizedBox(width: 20,),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage (Userposts userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill,
          ),
      ),
    ),
  ); 

  Widget postHeader(Userposts userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text ('${userPost.time} . '),
              const Icon(Icons.people_rounded, size: 18,),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(Userposts userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
          child: Row(children: [
            Text(userPost.postcontent, style: nametxtStyle)
          ],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)
      ),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        children: widget.userdata.userList.map((userPost){
          return InkWell(
            onTap: (){
              gotoPage(context, ProfileView(userPosts: userPost));
            },
            child: showPost(userPost),
          );
        }).toList(),
      ),
    );
  }

}