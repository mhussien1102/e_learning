import 'package:e_learning/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChanged extends AuthEvent {
  final UserModel? user;

  const AuthStateChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class RegisterRequest extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final UserRole role;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
  });

  @override
  List<Object> get props => [email, password, fullName, role];
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutRequested extends AuthEvent {
  final String email;

  const LogoutRequested({required this.email});

  @override
  List<Object?> get props => [email];
}

class UpdateProfileRequest extends AuthEvent {
  final String? fullName;
  final String? photoUrl;

  const UpdateProfileRequest({this.fullName, this.photoUrl});

  @override
  List<Object?> get props => [fullName, photoUrl];
}
