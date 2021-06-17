import 'package:hive/hive.dart';

part 'books.g.dart';

@HiveType(typeId: 0)
class Books extends HiveObject {
  @HiveField(0)
  late String? title;

  @HiveField(1)
  late String? description;

  @HiveField(2)
  late DateTime? creationDate;

  Books({
    this.description,
    this.title,
    this.creationDate,
  });
}
