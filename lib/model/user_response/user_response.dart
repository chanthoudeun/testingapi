import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'gen/user_response.freezed.dart';

part 'gen/user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  @HiveType(typeId: 0)
  factory UserResponse({
    @HiveField(0) String? token,
    @HiveField(1) String? message,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
