class TodoModel {
  final int id;
  final String title;
  final bool? isCompleted;
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
}
