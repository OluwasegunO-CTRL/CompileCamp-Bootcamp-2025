// import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.id, 
    required this.title, 
    this.isCompleted = false
  });

  // add to Json method
  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'title': title, 
      'isCompleted': isCompleted
    };
  }

  // add from Json method
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Todo copyWith({String? id, String? title, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
