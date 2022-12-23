// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/popu/menu_popup.dart';
import 'package:sola/r.dart';



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
  final bool? isMute;
  final bool? isOnline;
  final List<MenuPopupItemEntity>? menuItems;

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
      required this.onTap,
      this.isMute,
      this.isOnline,
      this.menuItems});

  @override
  Widget build(BuildContext context) {
    Widget child = InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.mainBlueColor,
                    shape: BoxShape.circle,
                  ),
                ),
                if (isOnline == true)
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainBlueColor,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                      ))
              ],
            ),
            const SizedBox(
              width: 5.5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 21 / 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    lastContent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        height: 18 / 12,
                        color: Color(0xFF6E8597)),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (isMute == true)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          R.assetsIconMuteIcon,
                          width: 15,
                          height: 15,
                        ),
                      ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF6E8597),
                        fontSize: 12,
                        height: 18 / 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: unreadCount > 0,
                  child: Badge(
                    elevation: 0.0,
                    badgeContent: Text(
                      '${unreadCount > 99 ? '99+' : unreadCount}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w700),
                    ),
                    badgeColor: AppColors.mainBlueColor,
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
              clipper: ClipThreeAngle(),
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
    if(menuItems!= null){
      return MenuPopup(
          menuItem: menuItems!,
          child: child);
    }
    return child;
  }
}

class ClipThreeAngle extends CustomClipper<Path> {
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