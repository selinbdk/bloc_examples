// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'examples/todo/models/todo_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 1814207885715351283),
      name: 'TodoModel',
      lastPropertyId: const obx_int.IdUid(4, 3267423173929643917),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 753015460965705926),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7802290643554913521),
            name: 'createdAt',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1611414387197883044),
            name: 'isDone',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3267423173929643917),
            name: 'content',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 1814207885715351283),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    TodoModel: obx_int.EntityDefinition<TodoModel>(
        model: _entities[0],
        toOneRelations: (TodoModel object) => [],
        toManyRelations: (TodoModel object) => {},
        getId: (TodoModel object) => object.id,
        setId: (TodoModel object, int id) {
          object.id = id;
        },
        objectToFB: (TodoModel object, fb.Builder fbb) {
          final createdAtOffset = object.createdAt == null
              ? null
              : fbb.writeString(object.createdAt!);
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, createdAtOffset);
          fbb.addBool(2, object.isDone);
          fbb.addOffset(3, contentOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final createdAtParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final isDoneParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 8);
          final contentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final object = TodoModel(
              id: idParam,
              createdAt: createdAtParam,
              isDone: isDoneParam,
              content: contentParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [TodoModel] entity fields to define ObjectBox queries.
class TodoModel_ {
  /// See [TodoModel.id].
  static final id =
      obx.QueryIntegerProperty<TodoModel>(_entities[0].properties[0]);

  /// See [TodoModel.createdAt].
  static final createdAt =
      obx.QueryStringProperty<TodoModel>(_entities[0].properties[1]);

  /// See [TodoModel.isDone].
  static final isDone =
      obx.QueryBooleanProperty<TodoModel>(_entities[0].properties[2]);

  /// See [TodoModel.content].
  static final content =
      obx.QueryStringProperty<TodoModel>(_entities[0].properties[3]);
}