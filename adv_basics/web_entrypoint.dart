import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:adv_basics/main.dart' as entrypoint;

void main() {
  setUrlStrategy(PathUrlStrategy());
  entrypoint.main();
}
