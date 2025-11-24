import 'package:flutter_application_6/models/usercomments.dart';
class CommentService {
  static final CommentService _instance = CommentService._internal();
  factory CommentService() => _instance;
  CommentService._internal();

  final Map<String, List<Usercomments>> _postComments = {};

  void addComment(String postId, Usercomments comment) {
    if (!_postComments.containsKey(postId)) {
      _postComments[postId] = [];
    }
    _postComments[postId]!.add(comment);
  }

  List<Usercomments> getComments(String postId) {
    return _postComments[postId] ?? [];
  }

  void clearComments(String postId) {
    _postComments.remove(postId);
  }
}