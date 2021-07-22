import 'package:flutter/material.dart';

class MessageForm extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const MessageForm({Key key, this.onSubmit}) : super(key: key);
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  String _message;
  final _controller = TextEditingController();

  void _onPressed() {
    widget.onSubmit(_message);
    _message = "";

    _controller.clear();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'Type a message',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(10)),
            minLines: 1,
            maxLines: 3,
            onChanged: (value) {
              setState(() {
                _message = value;
              });
            },
          )),
          SizedBox(
            width: 5,
          ),
          RawMaterialButton(
            onPressed: _message == null || _message.isEmpty ? null : _onPressed,
            fillColor: _message == null || _message.isEmpty
                ? Colors.blueGrey
                : Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'SEND',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
