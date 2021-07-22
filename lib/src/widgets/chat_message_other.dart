import 'package:flutter/material.dart';

class ChatMessageother extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  final bool showAvatar;
  const ChatMessageother(
      {Key key, this.index, this.data, this.showAvatar = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar)
            CircleAvatar(
              backgroundImage: NetworkImage(data['photo_url']),
            )
          else
            SizedBox(width: 40),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['author']} said :',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(data['value']),
              ],
            ),
          )
        ],
      ),
    );
  }
}
