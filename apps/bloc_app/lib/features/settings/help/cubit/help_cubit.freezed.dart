// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HelpState {
  List<UIMessage> get messages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HelpStateCopyWith<HelpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpStateCopyWith<$Res> {
  factory $HelpStateCopyWith(HelpState value, $Res Function(HelpState) then) =
      _$HelpStateCopyWithImpl<$Res, HelpState>;
  @useResult
  $Res call({List<UIMessage> messages, bool isLoading, Exception? error});
}

/// @nodoc
class _$HelpStateCopyWithImpl<$Res, $Val extends HelpState>
    implements $HelpStateCopyWith<$Res> {
  _$HelpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<UIMessage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HelpStateCopyWith<$Res> implements $HelpStateCopyWith<$Res> {
  factory _$$_HelpStateCopyWith(
          _$_HelpState value, $Res Function(_$_HelpState) then) =
      __$$_HelpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UIMessage> messages, bool isLoading, Exception? error});
}

/// @nodoc
class __$$_HelpStateCopyWithImpl<$Res>
    extends _$HelpStateCopyWithImpl<$Res, _$_HelpState>
    implements _$$_HelpStateCopyWith<$Res> {
  __$$_HelpStateCopyWithImpl(
      _$_HelpState _value, $Res Function(_$_HelpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_HelpState(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<UIMessage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_HelpState implements _HelpState {
  const _$_HelpState(
      {final List<UIMessage> messages = const [],
      this.isLoading = true,
      this.error})
      : _messages = messages;

  final List<UIMessage> _messages;
  @override
  @JsonKey()
  List<UIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'HelpState(messages: $messages, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HelpState &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messages), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HelpStateCopyWith<_$_HelpState> get copyWith =>
      __$$_HelpStateCopyWithImpl<_$_HelpState>(this, _$identity);
}

abstract class _HelpState implements HelpState {
  const factory _HelpState(
      {final List<UIMessage> messages,
      final bool isLoading,
      final Exception? error}) = _$_HelpState;

  @override
  List<UIMessage> get messages;
  @override
  bool get isLoading;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HelpStateCopyWith<_$_HelpState> get copyWith =>
      throw _privateConstructorUsedError;
}
