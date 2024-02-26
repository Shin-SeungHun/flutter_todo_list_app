class TodoModel{
  int? id;
  String title;
  DateTime dateTime;
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
    return 'Todo{ id: $id, content: $title, dateTime: $dateTime, isDone: $isDone,}';
  }

  TodoModel copyWith({
    int? id,
    String? content,
    DateTime? dateTime,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: content ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': title,
      'dateTime': dateTime,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['content'] as String,
      dateTime: json['dateTime'] as DateTime,
      isDone: json['isDone'] as bool,
    );
  }

//</editor-fold>
}