import 'package:flutter_application_6/models/accounts.dart';
import 'package:flutter_application_6/models/friends.dart';
import 'package:flutter_application_6/models/usercomments.dart';
import 'package:flutter_application_6/models/userposts.dart';

class Userdata {
  List<Userposts> userList = [
    
    Userposts(
      userimg: 'assets/my_pfp_picture.png',
      username: 'Kerry Potter',
      time: '2 hrs ago',
      postcontent: 'Always looked like he was  at the edge of a cliff.',
      postimg: 'assets/postimg.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),

    Userposts(
      userimg: 'assets/iane.png',
      username: 'Iane0143',
      time: '4 hrs ago',
      postcontent: '💙⛱🌅.',
      postimg: 'assets/beach.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: true,
    ),

    Userposts(
      userimg: 'assets/Rexar.png',
      username: 'Rexar Kamimura',
      time: '6 hrs ago',
      postcontent: 'Do you still remember this dude? 😂',
      postimg: 'assets/Rex.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: true,
    ),

    Userposts(
      userimg: 'assets/DavidWebb.png',
      username: 'Jason Bourne',
      time: '12 hrs ago',
      postcontent: 'Looking cool this winter season!',
      postimg: 'assets/DavidWebb.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),
  ];

  List<Friends> friendsList = [
    Friends (img: 'assets/Shark.png', name: 'Kat Dontiago'),
    Friends (img: 'assets/Dino.png', name: 'Kate Dump'),
    Friends (img: 'assets/Monkey.png', name: 'Junskie Saray'),
    Friends (img: 'assets/Mountain.png', name: 'Yohan Gian'),
    Friends (img: 'assets/Scorpion.png', name: 'Carl Johanson'),
    Friends (img: 'assets/Cat.png', name: 'Bobita'),
    Friends (img: 'assets/Awwhh.png', name: 'Stevenson')
  ];

  List <Usercomments> commentsList = [
    Usercomments(
    commenterImg: 'assets/Awwhh.png', 
    commenterName: 'Eva Jane',
    commenterTime: '6 hrs', 
    commenterContent: 'Wow Beautiful!',
    ),
    Usercomments(
    commenterImg: 'assets/Awwhh.png', 
    commenterName: 'Vladimir Inputin',
    commenterTime: '2 hrs', 
    commenterContent: 'Wow Beautiful!',
    ),
    Usercomments(
    commenterImg: 'assets/Awwhh.png', 
    commenterName: 'Miko Rojo',
    commenterTime: '8 hrs', 
    commenterContent: 'Wow Beautiful!',
    ),
  ];

  Accounts myUserAccount = Accounts(
    name: 'Ciano, Kerry Anthony A.', 
    email: 'k.ciano.538178@umindanao.edu.ph', 
    img: 'assets/my_pfp_picture.png', 
    numFollowers: '15', 
    numPosts: '9', 
    numFollowing: '230', 
    numFriends: '150'

    );
}