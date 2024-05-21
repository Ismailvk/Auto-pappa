part of 'signup_bloc.dart';

sealed class SignupEvent {}

final class SignupButtonEvent extends SignupEvent {
  final Map<String, dynamic> signupData;

  SignupButtonEvent({required this.signupData});
}
