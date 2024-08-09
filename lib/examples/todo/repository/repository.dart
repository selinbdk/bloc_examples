import '../../../objectbox.g.dart';
import '../models/todo_model.dart';


abstract class TodoRepository {
  Future<void> saveTodo(TodoModel model);

  Future<void> removeTodo(int id);

  Future<List<TodoModel>> getAllTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this.box);

  @override
  Future<List<TodoModel>> getAllTodos() async {
    try {
      return Future.delayed(const Duration(seconds: 2), box.getAll);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeTodo(int id) {
    try {
      return Future.delayed(const Duration(seconds: 2), () => box.remove(id));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveTodo(TodoModel model) async {
    try {
      return Future.delayed(const Duration(seconds: 2), () => box.put(model));
    } catch (e) {
      rethrow;
    }
  }

  final Box<TodoModel> box;
}
