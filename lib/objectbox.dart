import 'package:path_provider/path_provider.dart';

import 'examples/todo/models/todo_model.dart';
import 'objectbox.g.dart';

class ObjectBox {
  ObjectBox._create(this.store);

  late final Store store;
  

  static Future<ObjectBox> createObjectBox() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: docsDir.path);
    return ObjectBox._create(store);
  }
}
