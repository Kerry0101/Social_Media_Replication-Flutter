import 'package:flutter_application_6/models/usercomments.dart';
import 'package:flutter_application_6/commentpersistentservice.dart';


class CommentService {
  static final CommentService _instance = CommentService._internal();
  factory CommentService() => _instance;
  CommentService._internal();

  final Commentpersistentservice _persistentService = Commentpersistentservice();
  final Map<String, List<Usercomments>> _postComments = {};

    Future<void> addComment(String postId, Usercomments comment) async {
    await _persistentService.addComment(postId, comment);
  }

  Future<List<Usercomments>> getComments(String postId) async {
    return await _persistentService.getComments(postId);
  }

  Future<void> clearComments(String postId) async {
    await _persistentService.clearComments(postId);
  }

}