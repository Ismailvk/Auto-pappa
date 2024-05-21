import 'dart:async';

import 'package:auto_pappa/repositories/signup_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonEvent>(signup);
  }

  FutureOr<void> signup(SignupButtonEvent event, Emitter<SignupState> emit) {
    emit(SignupLoadingState());
    final data = SignupRepo().userSignup(event.signupData);
    data.fold((error) {
      emit(SignupFailedState(message: error.message.toString()));
    }, (response) {
      print(response);
      emit(SignupSuccessState());
    });
  }
}
