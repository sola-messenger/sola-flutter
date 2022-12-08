


import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';

abstract class LoggerService extends GetxService{
  
  Future<void> init();

  void write(String content);

}


class LoggerServiceImpl extends LoggerService{
  Logger? _logger;

  @override
  Future<void> init() async{
    _logger = Logger();
  }

  @override
  void write(String content) {
    _logger?.d(content);
  }
}