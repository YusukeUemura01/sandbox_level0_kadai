// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from_firebase_todo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FromFirebaseTodo _$$_FromFirebaseTodoFromJson(Map<String, dynamic> json) =>
    _$_FromFirebaseTodo(
      id: json['id'] as String,
      description: json['description'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FromFirebaseTodoToJson(_$_FromFirebaseTodo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'isCompleted': instance.isCompleted,
    };
