import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/chat_modular/chat/views/contact_item.dart';

import 'index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView(
      children: [
        _buildSearchBar(),
        ContactItem(img: 'img', name: 'Jack', orgName: 'DCC DEV', lastContent: 'Come here, to have a meeting', time: '19-11', unreadCount: 1, isTop: true, isSytemContact: false, onTap: (){}),
        ContactItem(img: 'img', name: 'Winnie', orgName: 'DCC DEV', lastContent: '我今天去出差了,有事联系张七', time: '12:09', unreadCount: 1, isTop: false, isSytemContact: false, onTap: (){}),
        ContactItem(img: 'img', name: 'Alan', orgName: 'DCC DEV', lastContent: '你的外卖到了,快来拿', time: '12:09', unreadCount: 1, isTop: false, isSytemContact: false, onTap: (){}),
        ContactItem(img: 'img', name: 'System notification', orgName: 'DCC DEV', lastContent: 'Waiting for pay, organization will be cancelled', time: '12:09', unreadCount: 0, isTop: false, isSytemContact: false, onTap: (){}),
        ContactItem(img: 'img', name: 'Sola对接群 (8)', orgName: 'DCC DEV', lastContent: '下午三点开会', time: '12:09', unreadCount: 101, isTop: false, isSytemContact: false, onTap: (){}),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
        margin: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 6,
          bottom: 4,
        ),
         padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 4,
          bottom: 4,
        ),
        decoration:  BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: const [
            Icon(Icons.search),
            SizedBox(
              width: 8,
            ),
            Text('Search',style: TextStyle(
              color: Colors.black,
            ),)
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: "chat",
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
              title: _buildUserInfo(ctl),actions: [
                PopupMenuButton(
                  onSelected: (value){
                  },
                  icon: Icon(Icons.add), itemBuilder: (BuildContext context) { 
                  return [
                    PopupMenuItem(child: Text('Scan QRCode')),
                    PopupMenuItem(child: Text('Create Group'),onTap: ctl.onCreateGroup,),
                    PopupMenuItem(child: Text('Invite Friends')),
                    PopupMenuItem(child: Text('Add by QRCode')),
                  ];
                 },),
              ],),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  Row _buildUserInfo(ChatController ctl) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Eric Fang'),
                InkWell(
                  onTap: ctl.onChangeOrg,
                  child: Row(
                    children: const [
                      Text(
                        'DCS Card',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
  }
}
