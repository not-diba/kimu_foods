import 'package:flutter_svg/flutter_svg.dart';

Future<void> preloadSVGs(List<String> assetPath) async {
  for (final path in assetPath) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}
