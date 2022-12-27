import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/services/client_service.dart';

class ProfileFutureWidget extends StatelessWidget {
  final Widget Function(Profile profile) buildProfile;

  const ProfileFutureWidget({Key? key, required this.buildProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: Get.find<ClientService>().client.fetchOwnProfile(),
      builder: (context, snapshot) => !snapshot.hasData || snapshot.data == null
          ? Container()
          : buildProfile(snapshot.data!),
    );
  }
}
