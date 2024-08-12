import 'package:objectbox/objectbox.dart';

@Entity()
class TodoModel {
  TodoModel({
    this.createdAt,
    this.isDone,
    this.content,
  }) : id = 0;
  @Id()
  int? id;
  final String? createdAt;
  final bool? isDone;
  final String? content;
}
