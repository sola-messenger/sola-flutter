import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'chat_set_controller.dart';

class ChatSetPage extends GetView<ChatSetController> {
  const ChatSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatSetController(),
        id: 'chat set',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Chat Set'),
            ),
            body: SafeArea(child: _buildView()),
          );
        });
  }

  Widget _buildView() => ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        children: [
          Text('Create Group'),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueAccent,
                    )),
                alignment: Alignment.center,
                child: const Text(
                  '+',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
          const MyRadioListTile(
            title: 'Chat Top',
            isSelect: false,
          ),
          const MyRadioListTile(title: 'Don\'t disturb', isSelect: false),
          const ListTile(
            title: Text('Clear chat history'),
          )
        ],
      );
}
