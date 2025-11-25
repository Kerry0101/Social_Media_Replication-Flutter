import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_6/models/usercomments.dart';
import 'dart:convert';

class Commentpersistentservice {
  static final Commentpersistentservice _instance = Commentpersistentservice._internal();
  factory Commentpersistentservice() => _instance;
  Commentpersistentservice._internal();

  static const String _commentsKey = 'post_comments';

  Future<void> addComment(String postId, Usercomments comment) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Get existing comments
    final Map<String, List<Usercomments>> allComments = await _getAllComments(prefs);
    
    // Add new comment
    if (!allComments.containsKey(postId)) {
      allComments[postId] = [];
    }
    allComments[postId]!.add(comment);
    
    // Save back to storage
    await _saveAllComments(prefs, allComments);
  }

  Future<List<Usercomments>> getComments(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, List<Usercomments>> allComments = await _getAllComments(prefs);
    return allComments[postId] ?? [];
  }

  Future<void> clearComments(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, List<Usercomments>> allComments = await _getAllComments(prefs);
    allComments.remove(postId);
    await _saveAllComments(prefs, allComments);
  }

  Future<Map<String, List<Usercomments>>> _getAllComments(SharedPreferences prefs) async {
    final String? commentsJson = prefs.getString(_commentsKey);
    if (commentsJson == null) {
      return {};
    }
    
    try {
      final Map<String, dynamic> decoded = json.decode(commentsJson);
      final Map<String, List<Usercomments>> result = {};
      
      for (final entry in decoded.entries) {
        final List<dynamic> commentList = entry.value;
        result[entry.key] = commentList.map((commentJson) {
          return Usercomments(
            commenterImg: commentJson['commenterImg'],
            commenterName: commentJson['commenterName'],
            commenterTime: commentJson['commenterTime'],
            commenterContent: commentJson['commenterContent'],
          );
        }).toList();
      }
      
      return result;
    } catch (e) {
      print('Error loading comments: $e');
      return {};
    }
  }

  Future<void> _saveAllComments(SharedPreferences prefs, Map<String, List<Usercomments>> allComments) async {
    final Map<String, dynamic> encoded = {};
    
    for (final entry in allComments.entries) {
      encoded[entry.key] = entry.value.map((comment) {
        return {
          'commenterImg': comment.commenterImg,
          'commenterName': comment.commenterName,
          'commenterTime': comment.commenterTime,
          'commenterContent': comment.commenterContent,
        };
      }).toList();
    }
    
    await prefs.setString(_commentsKey, json.encode(encoded));
  }
}