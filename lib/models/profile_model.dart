import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String fullName;
  final String email;
  final String? photoUrl;
  final String? phoneNumber;
  final String? bio;
  final ProfileStats stats;

  const ProfileModel({
    required this.fullName,
    required this.email,
    this.photoUrl,
    this.phoneNumber,
    this.bio,
    required this.stats,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? bio,
    ProfileStats? stats,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      stats: stats ?? this.stats,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    bio,
    email,
    photoUrl,
    stats,
    phoneNumber,
  ];
}

class ProfileStats extends Equatable {
  final int courseCount;
  final int hoursSpent;
  final double successRate;

  const ProfileStats({
    required this.courseCount,
    required this.hoursSpent,
    required this.successRate,
  });

  @override
  List<Object?> get props => [courseCount, hoursSpent, successRate];
}
