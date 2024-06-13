// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslateStateImpl _$$TranslateStateImplFromJson(Map<String, dynamic> json) =>
    _$TranslateStateImpl(
      languageCode: json['languageCode'] as String,
      countryCode: json['countryCode'] as String,
      previousCountryCode: json['previousCountryCode'] as String,
    );

Map<String, dynamic> _$$TranslateStateImplToJson(
        _$TranslateStateImpl instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
      'previousCountryCode': instance.previousCountryCode,
    };
