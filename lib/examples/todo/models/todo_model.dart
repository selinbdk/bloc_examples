import 'package:objectbox/objectbox.dart';

@Entity()
class TodoModel {
  TodoModel({
    this.id,
    this.createdAt,
    this.isDone,
    this.content,
  });
  @Id()
  int? id;
  final String? createdAt;
  final bool? isDone;
  final String? content;
}
