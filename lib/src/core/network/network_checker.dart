import 'package:brana/src/core/errors/failures.dart';
import 'package:either_dart/either.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

typedef EitherNetwork<T> = Future<Either<Failure, T>> Function();

class NetworkInfo {
  final InternetConnection _connectionChecker;
  NetworkInfo(this._connectionChecker);

  bool _isConnected = true;

  Future<Either<Failure, T>> check<T>({
    required EitherNetwork<T> connected,
    required EitherNetwork<T> notConnected,
  }) async {
    final isConnected = await checkIsConnected;
    if (isConnected) {
      return connected.call();
    } else {
      return notConnected.call();
    }
  }

  set setIsConnected(bool val) => _isConnected = val;
  bool get getIsConnected => _isConnected;

  Future<bool> get checkIsConnected async {
    return await _connectionChecker.hasInternetAccess;
  }
}
