import '../../../objectbox.g.dart';
import '../models/todo_model.dart';

abstract class TodoRepository {
  Future<void> saveTodo(TodoModel model);

  Future<void> removeTodo(int id);

  Future<List<TodoModel>> getAllTodos();

  Future<void> toggleIsDone(int id);
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this.box);
  @override
  Future<List<TodoModel>> getAllTodos() async {
    try {
      return Future.delayed(Duration.zero, box.getAll);
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<void> removeTodo(int id) {
    try {
      return Future.delayed(Duration.zero, () => box.remove(id));
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<void> saveTodo(TodoModel model) async {
    try {
      return Future.delayed(Duration.zero, () => box.put(model));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleIsDone(int id) async {
    try {
      final itemModel = box.get(id);
      if (itemModel == null) throw Exception('There is no any Todo match with id: $id');

      final updatedModel = TodoModel(
        id: itemModel.id,
        content: itemModel.content,
        isDone: !(itemModel.isDone ?? false),
        createdAt: DateTime.now().toString(),
      );
      box.put(updatedModel, mode: PutMode.update);
    } catch (e) {
      rethrow;
    }
  }

  final Box<TodoModel> box;
}
