import 'package:hive/hive.dart';

part 'steaky_notes.g.dart';

@HiveType(typeId: 2)
class SteakyNote extends HiveObject {
  @HiveField(0)
  late String? content;

  @HiveField(1)
  late DateTime? creationDate;

  @HiveField(2)
  late DateTime? editedDate;

  @HiveField(3)
  late int? booKey;

  SteakyNote({
    this.content,
    this.creationDate,
    this.editedDate,
    this.booKey,
  });
}
