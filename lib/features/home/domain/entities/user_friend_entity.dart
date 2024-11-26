import 'package:equatable/equatable.dart';

class UserFriendEntity extends Equatable {
  final String avatarUrl;
  final String username;
  const UserFriendEntity({required this.avatarUrl, required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [avatarUrl, username];
}
