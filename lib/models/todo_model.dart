class TodoModel {
  final int id;
  final String title;
  bool? isCompleted;
  final String userId;
  final DateTime? createdAt;

  TodoModel({
    required this.id,
    required this.title,
    this.isCompleted,
    required this.userId,
    this.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'user_id': userId,
    };
  }

  TodoModel copyWith({
    int? id,
    String? title,
    bool? isCompleted,
    String? userId,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
