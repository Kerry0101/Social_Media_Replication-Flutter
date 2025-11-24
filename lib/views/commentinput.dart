import 'package:flutter/material.dart';

class Commentinput extends StatefulWidget {
  final Function(String) onCommentAdded;
  final String userImg;

  const Commentinput({
    super.key,
    required this.onCommentAdded,
    required this.userImg,
  });

  @override
  _CommentinputState createState() => _CommentinputState();
}

class _CommentinputState extends State<Commentinput> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.userImg),
            radius: 15,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: 'Write a comment...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              final commentText = _commentController.text.trim();
              if (_commentController.text.trim().isNotEmpty) {
                 widget.onCommentAdded(commentText);
                _commentController.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}