import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  bool isDone;

//<editor-fold desc="Data Methods">
  TodoModel({
    this.id,
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          dateTime == other.dateTime &&
          isDone == other.isDone);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ dateTime.hashCode ^ isDone.hashCode;

  @override
  String toString() {
    return 'TodoModel{ id: $id, title: $title, dateTime: $dateTime, isDone: $isDone,}';
  }

  TodoModel copyWith({
    int? id,
    String? title,
    DateTime? dateTime,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      dateTime: json['dateTime'] as DateTime,
      isDone: json['isDone'] as bool,
    );
  }

//</editor-fold>
}
