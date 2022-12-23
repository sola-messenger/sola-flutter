// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/pressed_button.dart';

enum MenuPopupType {
  chatList,
  chatMenu,
  messageList,
}

class SeeMenuPopupItemEntity extends MenuPopupItemEntity {
  final List<String> avatars;

  SeeMenuPopupItemEntity({
    required super.title,
    required super.image,
    required super.onTap,
    required this.avatars,
  });

  @override
  Widget buildMenu(OverlayEntry? overlayEntry) => Stack(
        children: [
          super.buildMenu(overlayEntry),
          Positioned(
              left: 100,
              top: 7,
              bottom: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: List.generate(
                      avatars.length,
                      (index) => Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(
                              left: index * 14,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.textBlackColor,
                                border: Border.all(
                                  color: AppColors.mainBlueColor,
                                )),
                          )),
                ),
              )),
        ],
      );
}

class MenuPopupItemEntity {
  final String title;
  final String image;
  final VoidCallback onTap;

  MenuPopupItemEntity(
      {required this.title, required this.image, required this.onTap});

  Widget buildMenu(OverlayEntry? overlayEntry) => MenuPopupItem(
        title: title,
        image: image,
        onTap: () {
          overlayEntry?.remove();
          onTap.call();
        },
      );
}

class MenuPopup extends StatefulWidget {
  final Widget child;
  final List<MenuPopupItemEntity> menuItem;
  final MenuPopupType menuPopupType;

  const MenuPopup(
      {Key? key,
      required this.child,
      required this.menuItem,
      this.menuPopupType = MenuPopupType.chatList})
      : super(key: key);

  @override
  State<MenuPopup> createState() => _MenuPopupState();
}

class _MenuPopupState extends State<MenuPopup> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  void showOverlayEntry() {
    _overlayEntry = OverlayEntry(builder: (ctx) {
      RenderBox? box = context.findRenderObject() as RenderBox?;
      final RenderBox overlay =
          Overlay.of(context)!.context.findRenderObject() as RenderBox;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          box!.localToGlobal(Offset.zero, ancestor: overlay),
          box.localToGlobal(box.size.bottomRight(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      );
      bool isBottom = position.top > Get.mediaQuery.size.height / 2;

      Widget backdropWidget = Positioned(
        top: position.top,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 61,
              color: const Color(0xFFD9D9D9).withOpacity(0.31),
            ),
          ),
        ),
      );
      Widget menuWidget = Positioned(
          top: isBottom ? null : position.top + 15,
          right: 16,
          bottom: isBottom ? position.bottom + 15 : null,
          child: Container(
            width: 199,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0)
            ]),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.menuItem
                    .map((e) => e.buildMenu(_overlayEntry))
                    .toList()),
          ));

      if (widget.menuPopupType == MenuPopupType.chatMenu) {
        backdropWidget = Positioned(
          top: position.top + 56,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                width: Get.mediaQuery.size.width,
                height: Get.mediaQuery.size.height - position.top,
                color: const Color(0xFFD9D9D9).withOpacity(0.31),
              ),
            ),
          ),
        );

        menuWidget = Positioned(
            top: position.top + 40,
            right: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipPath(
                  clipper: ClipTriangle(),
                  child: Container(
                    width: 15,
                    height: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 199,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0)
                  ]),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.menuItem
                          .map((e) => e.buildMenu(_overlayEntry))
                          .toList()),
                ),
              ],
            ));
      } else if (widget.menuPopupType == MenuPopupType.messageList) {
        backdropWidget = const SizedBox();
        menuWidget = Positioned(
            top: isBottom ? null : position.top + 39,
            right: 64,
            bottom: isBottom ? position.bottom + 39 : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 199,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0)
                  ]),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.menuItem
                          .map((e) => e.buildMenu(_overlayEntry))
                          .toList()),
                ),
              ],
            ));
      }
      return Stack(
        children: [
          backdropWidget,
          GestureDetector(
            onTap: () {
              _overlayEntry?.remove();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
            ),
          ),
          menuWidget,
        ],
      );
    });
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;
    if (widget.menuPopupType == MenuPopupType.chatList ||
        widget.menuPopupType == MenuPopupType.messageList) {
      return GestureDetector(
          onLongPress: () {
            showOverlayEntry();
          },
          child: child);
    } else {
      return GestureDetector(
          onTap: () {
            showOverlayEntry();
          },
          child: child);
    }
  }
}

class MenuPopupItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const MenuPopupItem({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressedButton(
      onPressed: onTap,
      color: const Color(0xFFFEFEFE),
      pressedColor: const Color(0xFF010101).withOpacity(0.1),
      hoverColor: const Color(0xFF010101).withOpacity(0.1),
      border: Border(
        bottom: BorderSide(
          color: const Color(0x3C3C435C).withOpacity(0.36),
          width: 0.33,
        ),
      ),
      padding: const EdgeInsets.only(
        left: 13,
        top: 16,
        bottom: 8,
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              height: 25 / 17,
            ),
          )
        ],
      ),
    );
  }
}

class ClipTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
