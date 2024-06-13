// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl();

  @override
  String toString() {
    return 'Failure.server()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return server();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return server?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure() = _$ServerFailureImpl;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
          _$CacheFailureImpl value, $Res Function(_$CacheFailureImpl) then) =
      __$$CacheFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
      _$CacheFailureImpl _value, $Res Function(_$CacheFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheFailureImpl implements CacheFailure {
  const _$CacheFailureImpl();

  @override
  String toString() {
    return 'Failure.cache()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return cache();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return cache?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements Failure {
  const factory CacheFailure() = _$CacheFailureImpl;
}

/// @nodoc
abstract class _$$EmptyFailureImplCopyWith<$Res> {
  factory _$$EmptyFailureImplCopyWith(
          _$EmptyFailureImpl value, $Res Function(_$EmptyFailureImpl) then) =
      __$$EmptyFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$EmptyFailureImpl>
    implements _$$EmptyFailureImplCopyWith<$Res> {
  __$$EmptyFailureImplCopyWithImpl(
      _$EmptyFailureImpl _value, $Res Function(_$EmptyFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyFailureImpl implements EmptyFailure {
  const _$EmptyFailureImpl();

  @override
  String toString() {
    return 'Failure.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyFailure implements Failure {
  const factory EmptyFailure() = _$EmptyFailureImpl;
}

/// @nodoc
abstract class _$$CredentialFailureImplCopyWith<$Res> {
  factory _$$CredentialFailureImplCopyWith(_$CredentialFailureImpl value,
          $Res Function(_$CredentialFailureImpl) then) =
      __$$CredentialFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CredentialFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CredentialFailureImpl>
    implements _$$CredentialFailureImplCopyWith<$Res> {
  __$$CredentialFailureImplCopyWithImpl(_$CredentialFailureImpl _value,
      $Res Function(_$CredentialFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CredentialFailureImpl implements CredentialFailure {
  const _$CredentialFailureImpl();

  @override
  String toString() {
    return 'Failure.credential()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CredentialFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return credential();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return credential?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (credential != null) {
      return credential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return credential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return credential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (credential != null) {
      return credential(this);
    }
    return orElse();
  }
}

abstract class CredentialFailure implements Failure {
  const factory CredentialFailure() = _$CredentialFailureImpl;
}

/// @nodoc
abstract class _$$DuplicateEmailFailureImplCopyWith<$Res> {
  factory _$$DuplicateEmailFailureImplCopyWith(
          _$DuplicateEmailFailureImpl value,
          $Res Function(_$DuplicateEmailFailureImpl) then) =
      __$$DuplicateEmailFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DuplicateEmailFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DuplicateEmailFailureImpl>
    implements _$$DuplicateEmailFailureImplCopyWith<$Res> {
  __$$DuplicateEmailFailureImplCopyWithImpl(_$DuplicateEmailFailureImpl _value,
      $Res Function(_$DuplicateEmailFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DuplicateEmailFailureImpl implements DuplicateEmailFailure {
  const _$DuplicateEmailFailureImpl();

  @override
  String toString() {
    return 'Failure.duplicateEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuplicateEmailFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return duplicateEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return duplicateEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (duplicateEmail != null) {
      return duplicateEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return duplicateEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return duplicateEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (duplicateEmail != null) {
      return duplicateEmail(this);
    }
    return orElse();
  }
}

abstract class DuplicateEmailFailure implements Failure {
  const factory DuplicateEmailFailure() = _$DuplicateEmailFailureImpl;
}

/// @nodoc
abstract class _$$PasswordNotMatchFailureImplCopyWith<$Res> {
  factory _$$PasswordNotMatchFailureImplCopyWith(
          _$PasswordNotMatchFailureImpl value,
          $Res Function(_$PasswordNotMatchFailureImpl) then) =
      __$$PasswordNotMatchFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordNotMatchFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PasswordNotMatchFailureImpl>
    implements _$$PasswordNotMatchFailureImplCopyWith<$Res> {
  __$$PasswordNotMatchFailureImplCopyWithImpl(
      _$PasswordNotMatchFailureImpl _value,
      $Res Function(_$PasswordNotMatchFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PasswordNotMatchFailureImpl implements PasswordNotMatchFailure {
  const _$PasswordNotMatchFailureImpl();

  @override
  String toString() {
    return 'Failure.passwordNotMatch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordNotMatchFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return passwordNotMatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return passwordNotMatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return passwordNotMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return passwordNotMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch(this);
    }
    return orElse();
  }
}

abstract class PasswordNotMatchFailure implements Failure {
  const factory PasswordNotMatchFailure() = _$PasswordNotMatchFailureImpl;
}

/// @nodoc
abstract class _$$InvalidEmailFailureImplCopyWith<$Res> {
  factory _$$InvalidEmailFailureImplCopyWith(_$InvalidEmailFailureImpl value,
          $Res Function(_$InvalidEmailFailureImpl) then) =
      __$$InvalidEmailFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidEmailFailureImpl>
    implements _$$InvalidEmailFailureImplCopyWith<$Res> {
  __$$InvalidEmailFailureImplCopyWithImpl(_$InvalidEmailFailureImpl _value,
      $Res Function(_$InvalidEmailFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmailFailureImpl implements InvalidEmailFailure {
  const _$InvalidEmailFailureImpl();

  @override
  String toString() {
    return 'Failure.invalidEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailFailure implements Failure {
  const factory InvalidEmailFailure() = _$InvalidEmailFailureImpl;
}

/// @nodoc
abstract class _$$InvalidPasswordFailureImplCopyWith<$Res> {
  factory _$$InvalidPasswordFailureImplCopyWith(
          _$InvalidPasswordFailureImpl value,
          $Res Function(_$InvalidPasswordFailureImpl) then) =
      __$$InvalidPasswordFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidPasswordFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidPasswordFailureImpl>
    implements _$$InvalidPasswordFailureImplCopyWith<$Res> {
  __$$InvalidPasswordFailureImplCopyWithImpl(
      _$InvalidPasswordFailureImpl _value,
      $Res Function(_$InvalidPasswordFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidPasswordFailureImpl implements InvalidPasswordFailure {
  const _$InvalidPasswordFailureImpl();

  @override
  String toString() {
    return 'Failure.invalidPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPasswordFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() empty,
    required TResult Function() credential,
    required TResult Function() duplicateEmail,
    required TResult Function() passwordNotMatch,
    required TResult Function() invalidEmail,
    required TResult Function() invalidPassword,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? empty,
    TResult? Function()? credential,
    TResult? Function()? duplicateEmail,
    TResult? Function()? passwordNotMatch,
    TResult? Function()? invalidEmail,
    TResult? Function()? invalidPassword,
  }) {
    return invalidPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? empty,
    TResult Function()? credential,
    TResult Function()? duplicateEmail,
    TResult Function()? passwordNotMatch,
    TResult Function()? invalidEmail,
    TResult Function()? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(EmptyFailure value) empty,
    required TResult Function(CredentialFailure value) credential,
    required TResult Function(DuplicateEmailFailure value) duplicateEmail,
    required TResult Function(PasswordNotMatchFailure value) passwordNotMatch,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
    required TResult Function(InvalidPasswordFailure value) invalidPassword,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(EmptyFailure value)? empty,
    TResult? Function(CredentialFailure value)? credential,
    TResult? Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult? Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
    TResult? Function(InvalidPasswordFailure value)? invalidPassword,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(CacheFailure value)? cache,
    TResult Function(EmptyFailure value)? empty,
    TResult Function(CredentialFailure value)? credential,
    TResult Function(DuplicateEmailFailure value)? duplicateEmail,
    TResult Function(PasswordNotMatchFailure value)? passwordNotMatch,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    TResult Function(InvalidPasswordFailure value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPasswordFailure implements Failure {
  const factory InvalidPasswordFailure() = _$InvalidPasswordFailureImpl;
}
