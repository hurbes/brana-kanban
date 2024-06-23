import 'package:brana/app/app.logger.dart';
import 'package:logger/logger.dart';

mixin AppLogger {
  Logger get log => getLogger('$runtimeType');
}
