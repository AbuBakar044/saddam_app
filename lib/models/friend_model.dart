import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'friend_model.g.dart';

@HiveType(typeId: 0)
class FriendModel {
  @HiveField(0)
  final Uint8List? friendImage;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? mobile;

  @HiveField(3)
  final String? desc;

  const FriendModel(
    this.friendImage,
    this.name,
    this.mobile,
    this.desc,
  );
}
