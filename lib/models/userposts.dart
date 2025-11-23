class Userposts {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numcomments;
  final String numshare;
  bool isLiked;

  Userposts({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshare,
    required this.isLiked,
  });
}