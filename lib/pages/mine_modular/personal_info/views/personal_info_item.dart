import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersionalInfoItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onEdit;

  const PersionalInfoItem(
      {super.key,
      required this.title,
      required this.content,
       this.onEdit});

  @override
  Widget build(BuildContext context) {
    Widget rightWidget = Text(
      content,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
    if(onEdit != null){
      rightWidget = GestureDetector(
        onTap: onEdit,
        child: Row(
          children: [
            rightWidget,
            const Icon(Icons.edit),
          ],
        ),
      );
    }
    
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr),
          rightWidget,
        ],
      ),
    );
  }
}
