import 'package:realm/realm.dart';


part 'schemas.realm.dart';


@RealmModel()
class _Task {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String description;
  late String status;
  late DateTime reminderTime;
}