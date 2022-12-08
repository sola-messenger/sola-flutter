library pchat;

import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';

class PChat {
  /// 连接属性
  static Client? client;

  /// 初始化连机器
  static Client? initClient() {
    client = Client(
      "SolaChat",
      databaseBuilder: (_) async {
        final dir =
            await getApplicationSupportDirectory(); // Recommend path_provider package
        final db = HiveCollectionsDatabase('matrix_sola_chat', dir.path);
        await db.open();
        return db;
      },
    );
    client?.onLoginStateChanged.stream.listen((event) {
      print('[PChat] Login State:${event.toString()}');
    });

    client?.onEvent.stream.listen((event) {
      print('[PChat] event :${event.toString()}');
    });

    client?.onRoomState.stream.listen((event) {
      print('[PChat] room state :${event.toString()}');
      
    });

    client?.init();
    return client;
  }

  /// 发送文本
  static Future<String?> sendTextMessage(String roomId,String text)async{
    String? result =  await client?.getRoomById(roomId)?.sendTextEvent(text);
    print('[PChat sendTextMessage] result :${result?.toString()}');
    return result;
  }


  
}
