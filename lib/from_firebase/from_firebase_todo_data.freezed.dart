// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'from_firebase_todo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FromFirebaseTodo _$FromFirebaseTodoFromJson(Map<String, dynamic> json) {
  return _FromFirebaseTodo.fromJson(json);
}

/// @nodoc
mixin _$FromFirebaseTodo {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromFirebaseTodoCopyWith<FromFirebaseTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromFirebaseTodoCopyWith<$Res> {
  factory $FromFirebaseTodoCopyWith(
          FromFirebaseTodo value, $Res Function(FromFirebaseTodo) then) =
      _$FromFirebaseTodoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String description,
      @DateTimeTimestampConverter() DateTime createdAt,
      bool isCompleted});
}

/// @nodoc
class _$FromFirebaseTodoCopyWithImpl<$Res>
    implements $FromFirebaseTodoCopyWith<$Res> {
  _$FromFirebaseTodoCopyWithImpl(this._value, this._then);

  final FromFirebaseTodo _value;
  // ignore: unused_field
  final $Res Function(FromFirebaseTodo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FromFirebaseTodoCopyWith<$Res>
    implements $FromFirebaseTodoCopyWith<$Res> {
  factory _$$_FromFirebaseTodoCopyWith(
          _$_FromFirebaseTodo value, $Res Function(_$_FromFirebaseTodo) then) =
      __$$_FromFirebaseTodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String description,
      @DateTimeTimestampConverter() DateTime createdAt,
      bool isCompleted});
}

/// @nodoc
class __$$_FromFirebaseTodoCopyWithImpl<$Res>
    extends _$FromFirebaseTodoCopyWithImpl<$Res>
    implements _$$_FromFirebaseTodoCopyWith<$Res> {
  __$$_FromFirebaseTodoCopyWithImpl(
      _$_FromFirebaseTodo _value, $Res Function(_$_FromFirebaseTodo) _then)
      : super(_value, (v) => _then(v as _$_FromFirebaseTodo));

  @override
  _$_FromFirebaseTodo get _value => super._value as _$_FromFirebaseTodo;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$_FromFirebaseTodo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FromFirebaseTodo
    with DiagnosticableTreeMixin
    implements _FromFirebaseTodo {
  _$_FromFirebaseTodo(
      {required this.id,
      required this.description,
      @DateTimeTimestampConverter() required this.createdAt,
      this.isCompleted = false});

  factory _$_FromFirebaseTodo.fromJson(Map<String, dynamic> json) =>
      _$$_FromFirebaseTodoFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FromFirebaseTodo(id: $id, description: $description, createdAt: $createdAt, isCompleted: $isCompleted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FromFirebaseTodo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('isCompleted', isCompleted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FromFirebaseTodo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$$_FromFirebaseTodoCopyWith<_$_FromFirebaseTodo> get copyWith =>
      __$$_FromFirebaseTodoCopyWithImpl<_$_FromFirebaseTodo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromFirebaseTodoToJson(this);
  }
}

abstract class _FromFirebaseTodo implements FromFirebaseTodo {
  factory _FromFirebaseTodo(
      {required final String id,
      required final String description,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      final bool isCompleted}) = _$_FromFirebaseTodo;

  factory _FromFirebaseTodo.fromJson(Map<String, dynamic> json) =
      _$_FromFirebaseTodo.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  bool get isCompleted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FromFirebaseTodoCopyWith<_$_FromFirebaseTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
