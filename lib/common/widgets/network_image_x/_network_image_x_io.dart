import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:path/path.dart' as path;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../services/api_service.dart';
import 'network_image_x.dart';

String keyToMd5(String key) => md5.convert(utf8.encode(key)).toString();
const String cacheImageFolderName = 'image_cache';

/// The dart:io implementation of [image_provider.NetworkImage].
@immutable
class NetworkImageCode extends ImageProvider<NetworkImageX>
    implements NetworkImageX {
  /// Creates an object that fetches the image at the given URL.
  ///
  /// The arguments [url] and [scale] must not be null.
  const NetworkImageCode(this.url,
      {this.scale = 1.0, this.headers, this.formatImage});

  @override
  final String url;

  @override
  final double scale;

  @override
  final Map<String, String>? headers;

  @override
  final FormatImage? formatImage;

  // @override
  // set formatImage(_formatImage) {
  //   // TODO: implement formatImage
  // }
  @override
  Future<NetworkImageCode> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<NetworkImageCode>(this);
  }

  @override
  ImageStreamCompleter load(NetworkImageX key, DecoderCallback decode) {
    // Ownership of this controller is handed off to [_loadAsync]; it is that
    // method's responsibility to close the controller's stream when the image
    // has been loaded or an error is thrown.
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key as NetworkImageCode, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<NetworkImageX>('Image key', key),
        ];
      },
    );
  }

  Future<File> getFile(
    NetworkImageCode key,
  ) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Directory cacheDirectory =
        Directory(path.join(documentDirectory.path, cacheImageFolderName));
    if (!(await cacheDirectory.exists())) {
      await cacheDirectory.create();
    }
    File imageFile =
        File(path.join(cacheDirectory.path, path.basename(keyToMd5(key.url))));
    if (!(await imageFile.exists())) {
      await imageFile.create();
    }
    return imageFile;
  }

  Future<Uint8List?> _loadCache(
    NetworkImageCode key,
    StreamController<ImageChunkEvent> chunkEvents,
  ) async {
    final Uri resolved = Uri.base.resolve(key.url);
    File imageFile = await getFile(key);
    int fileLength = await imageFile.length();
    if (fileLength > 0) {
      final bytes = await imageFile.readAsBytes();
      if (bytes.lengthInBytes == 0) {
        throw Exception('NetworkImageX is an empty file: $resolved');
      }
      chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: bytes.length,
        expectedTotalBytes: bytes.length,
      ));
      return bytes;
    }
    return null;
  }


  Future<Uint8List> _loadNetwork(
    NetworkImageCode key,
    StreamController<ImageChunkEvent> chunkEvents,
  ) async {
    final Uri resolved = Uri.base.resolve(key.url);
    try {
      Dio _dio = Get.find<ApiService>().dio;
      if (key.url.startsWith('http')) {
        // _dio = Dio()..interceptors.add(NetworkLogInterceptor());
        _dio.options.headers.addAll(_dio.options.headers);
      }
      Response<List<int>> response = await Get.find<ApiService>()
          .dio
          .get<List<int>>(key.url,
              queryParameters: null,
              options:
                  Options(responseType: ResponseType.bytes, headers: headers),
              onReceiveProgress: (int current, int max) {
        chunkEvents.add(ImageChunkEvent(
          cumulativeBytesLoaded: current,
          expectedTotalBytes: max,
        ));
      });
      if (response.statusCode != HttpStatus.ok) {
        throw NetworkImageLoadException(
            statusCode: response.statusCode!, uri: resolved);
      }
      chunkEvents.done;
      final bytes = Uint8List.fromList(response.data!);
      if (bytes.lengthInBytes == 0) {
        throw Exception('NetworkImageCode is an empty file: $resolved');
      }
      return bytes;
    } catch (e) {
      if (e is DioError) {
        throw NetworkImageLoadException(
            statusCode: e.response?.statusCode ?? 500, uri: resolved);
      }
      rethrow;
    }
  }

  Future<ui.Codec> _loadAsync(
    NetworkImageCode key,
    StreamController<ImageChunkEvent> chunkEvents,
    DecoderCallback decode,
  ) async {
    assert(this == key);
    // int startTime = DateTime.now().millisecondsSinceEpoch;

    try {
      //添加文件缓存功能.
      Uint8List? result = await _loadCache(key, chunkEvents);
      if (result == null) {
        // startTime = DateTime.now().millisecondsSinceEpoch;
        result = await _loadNetwork(key, chunkEvents);
        if (result.isNotEmpty) {
          // reportEvent(key.url, 'net',
              // DateTime.now().millisecondsSinceEpoch - startTime);
          await (await getFile(key)).writeAsBytes(result);
        }
      } else {
        //加载缓存
        // reportEvent(key.url, 'cache',
            // DateTime.now().millisecondsSinceEpoch - startTime);
      }
      if (formatImage != null) {
        result = formatImage!(result);
      }
      return decode(result);
    } catch (e) {
      // Depending on where the exception was thrown, the image cache may not
      // have had a chance to track the key in the cache at all.
      // Schedule a microtask to give the cache a chance to add the key.
      scheduleMicrotask(() {
        PaintingBinding.instance!.imageCache!.evict(key);
      });
      rethrow;
    } finally {
      chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is NetworkImageCode &&
        other.url == url &&
        other.scale == scale;
  }

  @override
  int get hashCode => ui.hashValues(url, scale);

  @override
  String toString() =>
      '${objectRuntimeType(this, 'NetworkImageCode')}("$url", scale: $scale)';
}
