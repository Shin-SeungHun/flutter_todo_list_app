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
정    this.isDone = true,
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
    return 'Todo{ id: $id, title: $title, dateTime: $dateTime, isDone: $isDone,}';
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
      'dateTime': dateTime.toIso8601String(),
      'isDone': isDone ? 0 : 1,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String,
    ), isDone: (json['isDone'] as int) == 1);
  }

//</editor-fold>
}