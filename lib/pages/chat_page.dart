import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yotta_test_six/pages/group_info.dart';
import 'package:yotta_test_six/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatPage({Key? key, required this.groupId, required this.groupName, required this.userName}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String admin = "";
  Stream<QuerySnapshot>? chats;
  @override
  void initState() {
    // TODO: implement initState
    getChatandAdmin();
    super.initState();
    
  }

  getChatandAdmin(){
    /////////Start from here//////////
    ///Time stamp 2:41:39 on Youtube///////
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed:() {
            nextScreen(context,  GroupInfo(
              groupId: widget.groupId,
              groupName: widget.groupName,
              adminName: widget.userName,
            ));
          },
          icon: const Icon(Icons.info)
          )
        ],
      ),
    );
  }
}