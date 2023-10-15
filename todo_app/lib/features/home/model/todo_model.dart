class TodoModel {
  final String id;
  final String? title;
  final String? desc;

  TodoModel({required this.id, this.title, this.desc});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
      );
}
