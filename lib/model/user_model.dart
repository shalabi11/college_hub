import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String email;

  @HiveField(1)
  late final String name;

  @HiveField(2)
  final String universityId;

  @HiveField(3)
  final String role;

  UserModel({
    required this.email,
    required this.name,
    required this.universityId,
    required this.role,
  });
}
