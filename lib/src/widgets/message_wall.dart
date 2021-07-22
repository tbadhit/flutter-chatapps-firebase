import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_chat_crew/src/widgets/chat_message.dart';
import 'chat_message_other.dart';

class MessageWall extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;
  final ValueChanged<String> onDelete;

  const MessageWall({Key key, this.messages, this.onDelete}) : super(key: key);

  bool shouldDisplayAvatar(int index) {
    if (index == 0) return true;

    final previousId = messages[index - 1]['author_id'];
    final authorId = messages[index]['author_id'];
    return authorId != previousId;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final data = messages[index];
        final user = FirebaseAuth.instance.currentUser;

        if (user != null && user.uid == data['author_id']) {
          return Dismissible(
            onDismissed: (_) {
              onDelete(messages[index].id);
            },
            key: ValueKey(data['timestamp']),
            child: ChatMessage(
              index: index,
              data: data.data(),
            ),
          );
        }

        return ChatMessageother(
          index: index,
          data: data.data(),
          showAvatar: shouldDisplayAvatar(index),
        ); // before :ListTile(
        //   title: Text(messages[index]['value']),
        // );
      },
    );
  }
}
