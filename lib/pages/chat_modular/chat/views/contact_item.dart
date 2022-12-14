import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String img;
  final String name;
  final String orgName;
  final String lastContent;
  final String time;
  final int unreadCount;
  final bool isTop;
  final bool isSytemContact;
  final VoidCallback onTap;

  const ContactItem(
      {super.key,
      required this.img,
      required this.name,
      required this.orgName,
      required this.lastContent,
      required this.time,
      required this.unreadCount,
      required this.isTop,
      required this.isSytemContact,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget child = InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    lastContent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time),
                SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: unreadCount > 0,
                  child: Badge(
                    badgeContent: Text(
                      '${unreadCount>99?'99+':unreadCount}',
                      style: TextStyle(color: Colors.white,
                      fontSize: 8),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    if (isTop) {
      child = Stack(
        children: [
          child,
          Positioned(
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: ClipThreeAgore(),
              child: Container(
                width: 15,
                height: 15,
                color: Colors.blue.withOpacity(0.5),
              ),
            ),
          )
        ],
      );
    }
    return child;
  }
}

class ClipThreeAgore extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
