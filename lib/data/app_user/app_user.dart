import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

part 'app_user.g.dart';

@Freezed(addImplicitFinal: true, toJson: true, fromJson: true, copyWith: false, equal: true)
class AppUser with _$AppUser {
  const factory AppUser({
    required String username,
    required String uuid,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}
