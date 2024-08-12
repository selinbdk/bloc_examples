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
      return Future.delayed(const Duration(seconds: 1), box.getAll);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeTodo(int id) {
    try {
      return Future.delayed(const Duration(seconds: 1), () => box.remove(id));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveTodo(TodoModel model) async {
    try {
      return Future.delayed(const Duration(seconds: 1), () => box.put(model));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleIsDone(int id) {
    throw UnimplementedError();
  }

  final Box<TodoModel> box;
}
