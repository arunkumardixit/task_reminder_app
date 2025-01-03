import 'package:realm/realm.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';
import 'ILocalRealmStorage.dart';

class RealmStorage implements ILocalRealmStorage {
  static late final Realm _realm;

  static final RealmStorage _singleton = RealmStorage._internal();
  factory RealmStorage() {
    _realm = Realm(
      Configuration.local(
        [Task.schema],
      ),
    );
    return _singleton;
  }

  RealmStorage._internal();

  @override
  Iterable<M> getAll<M extends RealmObject>() {
    return _realm.all<M>();
  }

  @override
  Future<M> add<M extends RealmObject>(M item) {
    return _realm.writeAsync(() => _realm.add(item));
  }

  @override
  Future<void> addList<M extends RealmObject>(Iterable<M> items) async {
    await _realm.writeAsync(() => _realm.addAll<M>(items));
  }

  @override
  Future<M> update<M extends RealmObject>(M item) {
    return _realm.writeAsync(() => _realm.add(item, update: true));
  }

  @override
  Future<void> delete<M extends RealmObject>(M item) async {
    await _realm.writeAsync(() => _realm.delete(item));
  }

  @override
  M? find<M extends RealmObject>(Object primaryKey) {
    return _realm.find<M>(primaryKey);
  }

  @override
  void dispose() {
    _realm.close();
  }
}