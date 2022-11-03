import 'package:hive_flutter/adapters.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Imagemodel {
  @HiveField(0)
  final String images;

  Imagemodel({required this.images});
}
