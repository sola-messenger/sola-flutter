import 'dart:typed_data';
import 'package:flutter/material.dart';
import '_network_image_x_io.dart'
    if (dart.library.html) '_network_image_x_web.dart' as network_image;

abstract class NetworkImageX extends ImageProvider<NetworkImageX> {
  /// Creates an object that fetches the image at the given URL.
  ///
  /// The arguments [url] and [scale] must not be null.
  const factory NetworkImageX(
    String url, {
    required double scale,
    Map<String, String>? headers,
    FormatImage? formatImage,
  }) = network_image.NetworkImageCode;

  /// The URL from which the image will be fetched.
  String get url;

  /// The scale to place in the [ImageInfo] object of the image.
  double get scale;

  /// The HTTP headers that will be used with [HttpClient.get] to fetch image from network.
  ///
  /// When running flutter on the web, headers are not used.
  Map<String, String>? get headers;

  FormatImage? get formatImage;

  @override
  ImageStreamCompleter load(NetworkImageX key, DecoderCallback decode);
}

typedef FormatImage = Uint8List Function(Uint8List data);
