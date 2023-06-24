import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required final String id,
    required final String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

//convert firebase user to user
extension FirebaseUserX on User {
  User toDomain() {
    return User(
      id: id,
      email: email,
    );
  }
}
