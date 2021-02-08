import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:setup_app/models/chat.dart';
import 'package:setup_app/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:setup_app/ui/views/chat_view/chat_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.nonReactive(
      viewModelBuilder: () => ChatViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Chat with Me',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder(
                      stream: model.populateChat,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                verticalSpaceSmall,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              if ('topperboy1999@gmail.com' ==
                                  snapshot.data.docs[index]['sentBy']) {
                                return _MyMessage(
                                  body: snapshot.data.docs[index]['body'],
                                  date: snapshot.data.docs[index]['time'],
                                  sentby: snapshot.data.docs[index]['sentBy'],
                                );
                              } else {
                                return _OtherPartyMessage(
                                  body: snapshot.data.docs[index]['body'],
                                  date: snapshot.data.docs[index]['time'],
                                  sentby: snapshot.data.docs[index]['sentBy'],
                                );
                              }
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                )),
                _InputWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyMessage extends StatelessWidget {
  final String body;

  final String sentby;

  final Timestamp date;
  const _MyMessage({
    this.body,
    this.date,
    this.sentby,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            constraints: BoxConstraints(
              maxWidth: screenWidth(context) * 0.75,
            ),
            child: Text(
              body,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(sentby,
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Text(
                DateTime.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch)
                    .toString(),
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class _OtherPartyMessage extends StatelessWidget {
  final String body;

  final String sentby;

  final Timestamp date;
  const _OtherPartyMessage({
    Key key,
    this.body,
    this.date,
    this.sentby,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            constraints: BoxConstraints(maxWidth: screenWidth(context) * 0.75),
            child: Text(
              body,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(sentby,
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Text(
                DateTime.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch)
                    .toString(),
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ],
        )
      ],
    );
  }
}

class _InputWidget extends HookViewModelWidget<ChatViewModel> {
  _InputWidget({Key key}) : super(key: key);
  final Chat chat = Chat();
  @override
  Widget buildViewModelWidget(BuildContext context, model) {
    var message = useTextEditingController();
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              hintText: 'Enter Message',
            ),
            controller: message,
          ),
        ),
        verticalSpaceSmall,
        GestureDetector(
          onTap: () {
            chat.body = message.text;
            chat.sentBy = model.currentUser;
            chat.time = Timestamp.now();

            model.addChat(chat);
            message.clear();
          },
          child: Icon(Icons.send),
        ),
      ],
    );
  }
}
