//

import 'package:hive/hive.dart';

part 'cartmodel.g.dart';

@HiveType(typeId: 1)
class Cartmodel {
  Cartmodel(
      {required this.title,
      required this.description,
      required this.image,
      required this.price});

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  dynamic price;

  @HiveField(3)
  String image;
}
