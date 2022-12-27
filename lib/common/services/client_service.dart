import 'dart:async';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sola/common/app_constants.dart';

abstract class ClientService extends GetxService {
  Future<void> init();

  Client get client;

}

class ClientServiceImpl extends ClientService {
  late Client _client;
  late Profile _userProfile;

  @override
  Client get client => _client;

  @override
  Future<void> init() async {
    _client = Client(
      AppConstants.clientName,
      databaseBuilder: _databaseBuilder,
    );
    await client.init();
  }

  FutureOr<DatabaseApi> _databaseBuilder(_) async {
    final dir = await getApplicationSupportDirectory();
    final db = HiveCollectionsDatabase(AppConstants.databaseName, dir.path);
    await db.open();
    return db;
  }

}
