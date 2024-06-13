// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeStateImpl _$$ThemeStateImplFromJson(Map<String, dynamic> json) =>
    _$ThemeStateImpl(
      status: $enumDecodeNullable(_$ThemeStatusEnumMap, json['status']) ??
          ThemeStatus.light,
    );

Map<String, dynamic> _$$ThemeStateImplToJson(_$ThemeStateImpl instance) =>
    <String, dynamic>{
      'status': _$ThemeStatusEnumMap[instance.status]!,
    };

const _$ThemeStatusEnumMap = {
  ThemeStatus.light: 'light',
  ThemeStatus.dark: 'dark',
};
