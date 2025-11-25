import 'package:flutter/material.dart';
import 'package:flutter_application_6/commentservice.dart';
import 'package:flutter_application_6/models/usercomments.dart';
import 'package:flutter_application_6/models/userdata.dart';
import 'package:flutter_application_6/models/userposts.dart';
import 'package:flutter_application_6/views/commentinput.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPosts});

  final Userposts userPosts;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();
  final CommentService commentService = CommentService();
  late List<Usercomments> commentsList;
  bool _isLoading = true;

  final nametxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  final boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void initState() {
    super.initState();
    _loadComments();
  }


  Future<void> _loadComments() async {
    try {
      final comments = await commentService.getComments(widget.userPosts.id);
      setState(() {
        commentsList = comments;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        commentsList = List<Usercomments>.from(userData.commentsList);
        _isLoading = false;
      });
    }
  }

  Future<void> addComment(String text) async {
    if (text.trim().isEmpty) return;

    final newComment = Usercomments(
      commenterName: userData.myUserAccount.name,
      commenterContent: text,
      commenterImg: userData.myUserAccount.img,
      commenterTime: 'Just now',
    );

    try {
      await commentService.addComment(widget.userPosts.id, newComment);
      setState(() {
        commentsList.add(newComment);
      });
    } catch (e) {
      // Optionally handle error
    }
  }

  Widget commentBtn(Usercomments userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userComment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  Widget commentDesc(Usercomments userComment) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userComment.commenterName, style: boldtxtStyle),
            const SizedBox(height: 5),
            Row(
              children: [Text(userComment.commenterContent)],
            ),
          ],
        ),
      );

  Widget commentSpace(Usercomments userComment) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(35, 158, 158, 158),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomments userComment) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
          radius: 20,
        ),
      );

  Widget userCommenterline(Usercomments userComments) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(userComments),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commentSpace(userComments),
                commentBtn(userComments)
              ],
            ),
          ),
        ],
      );

  Widget userPostDetails(Usercomments userComments) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          userCommenterline(userComments),
        ],
      );

  Widget commenter() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('${commentsList.length} Comments', style: boldtxtStyle),
                const Spacer(),
                Text('${widget.userPosts.numshare} Shares', style: boldtxtStyle),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldtxtStyle1),
                const Icon(Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
        ],
      );

  Widget buttons(Userposts userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        userPost.isLiked ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_rounded, size: 20),
                  label: const Text('Liked'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.comment_rounded, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.share_rounded, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget userline(Userposts userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage(userPost.userimg),
                radius: 20,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userPost.username,
                style: nametxtStyle,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('.'),
                  const Icon(
                    Icons.group_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget postimage(Userposts userPosts) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [Text(userPosts.postcontent)],
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                userPosts.postimg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      userline(widget.userPosts),
                      postimage(widget.userPosts),
                      buttons(widget.userPosts),
                      commenter(),
                      ...commentsList.map((userComment) => userPostDetails(userComment)),
                      const SizedBox(height: 20),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Commentinput(
              onCommentAdded: addComment,
              userImg: userData.myUserAccount.img,
            ),
          ),
        ],
      ),
    );
  }
}

