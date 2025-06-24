// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppSettingsState()';
}


}

/// @nodoc
class $AppSettingsStateCopyWith<$Res>  {
$AppSettingsStateCopyWith(AppSettingsState _, $Res Function(AppSettingsState) __);
}


/// @nodoc


class _Initial implements AppSettingsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppSettingsState.initial()';
}


}




/// @nodoc


class ChangeThemeState implements AppSettingsState {
  const ChangeThemeState({required this.isDarkMode});
  

 final  bool isDarkMode;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeThemeStateCopyWith<ChangeThemeState> get copyWith => _$ChangeThemeStateCopyWithImpl<ChangeThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeThemeState&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,isDarkMode);

@override
String toString() {
  return 'AppSettingsState.changeTheme(isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class $ChangeThemeStateCopyWith<$Res> implements $AppSettingsStateCopyWith<$Res> {
  factory $ChangeThemeStateCopyWith(ChangeThemeState value, $Res Function(ChangeThemeState) _then) = _$ChangeThemeStateCopyWithImpl;
@useResult
$Res call({
 bool isDarkMode
});




}
/// @nodoc
class _$ChangeThemeStateCopyWithImpl<$Res>
    implements $ChangeThemeStateCopyWith<$Res> {
  _$ChangeThemeStateCopyWithImpl(this._self, this._then);

  final ChangeThemeState _self;
  final $Res Function(ChangeThemeState) _then;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isDarkMode = null,}) {
  return _then(ChangeThemeState(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChangeLanguageState implements AppSettingsState {
  const ChangeLanguageState({required this.isArabic});
  

 final  bool isArabic;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeLanguageStateCopyWith<ChangeLanguageState> get copyWith => _$ChangeLanguageStateCopyWithImpl<ChangeLanguageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeLanguageState&&(identical(other.isArabic, isArabic) || other.isArabic == isArabic));
}


@override
int get hashCode => Object.hash(runtimeType,isArabic);

@override
String toString() {
  return 'AppSettingsState.changeLanguage(isArabic: $isArabic)';
}


}

/// @nodoc
abstract mixin class $ChangeLanguageStateCopyWith<$Res> implements $AppSettingsStateCopyWith<$Res> {
  factory $ChangeLanguageStateCopyWith(ChangeLanguageState value, $Res Function(ChangeLanguageState) _then) = _$ChangeLanguageStateCopyWithImpl;
@useResult
$Res call({
 bool isArabic
});




}
/// @nodoc
class _$ChangeLanguageStateCopyWithImpl<$Res>
    implements $ChangeLanguageStateCopyWith<$Res> {
  _$ChangeLanguageStateCopyWithImpl(this._self, this._then);

  final ChangeLanguageState _self;
  final $Res Function(ChangeLanguageState) _then;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isArabic = null,}) {
  return _then(ChangeLanguageState(
isArabic: null == isArabic ? _self.isArabic : isArabic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
