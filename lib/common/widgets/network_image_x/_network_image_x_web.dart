import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'network_image_x.dart';

/// The dart:io implementation of [image_provider.NetworkImage].

/// The dart:html implementation of [image_provider.NetworkImage].
///
/// NetworkImage on the web does not support decoding to a specified size.
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
        chunkEvents: chunkEvents.stream,
        codec: _loadAsync(key as NetworkImageCode, decode, chunkEvents)!
            .then((value) => value),
        scale: key.scale,
        debugLabel: key.url,
        informationCollector: _imageStreamInformationCollector(key));
  }

  InformationCollector? _imageStreamInformationCollector(NetworkImageX key) {
    InformationCollector? collector;
    assert(() {
      collector = () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<NetworkImageX>('Image key', key),
        ];
      };
      return true;
    }());
    return collector;
  }

  // TODO(garyq): We should eventually support custom decoding of network images on Web as
  // well, see https://github.com/flutter/flutter/issues/42789.
  //
  // Web does not support decoding network images to a specified size. The decode parameter
  // here is ignored and the web-only `ui.webOnlyInstantiateImageCodecFromUrl` will be used
  // directly in place of the typical `instantiateImageCodec` method.
  Future<ui.Codec>? _loadAsync(NetworkImageCode key, DecoderCallback decode,
      StreamController<ImageChunkEvent> chunkEvents) {
    assert(key == this);

    final Uri resolved = Uri.base.resolve(key.url);
    // This API only exists in the web engine implementation and is not
    // contained in the analyzer summary for Flutter.
    return ui.webOnlyInstantiateImageCodecFromUrl(// ignore: undefined_function, avoid_dynamic_calls
        resolved, chunkCallback: (int bytes, int total) {
      chunkEvents.add(ImageChunkEvent(
          cumulativeBytesLoaded: bytes, expectedTotalBytes: total));
    }) as Future<ui.Codec>?; // ignore: undefined_function
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is NetworkImageCode &&
        other.url == url &&
        other.scale == scale;
  }

  @override
  int get hashCode => ui.hashValues(url, scale);

  @override
  String toString() =>
      '${objectRuntimeType(this, 'NetworkImageX')}("$url", scale: $scale)';
}
