import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server() = ServerFailure;
  const factory Failure.cache() = CacheFailure;
  const factory Failure.empty() = EmptyFailure;
  const factory Failure.credential() = CredentialFailure;
  const factory Failure.duplicateEmail() = DuplicateEmailFailure;
  const factory Failure.passwordNotMatch() = PasswordNotMatchFailure;
  const factory Failure.invalidEmail() = InvalidEmailFailure;
  const factory Failure.invalidPassword() = InvalidPasswordFailure;
}
