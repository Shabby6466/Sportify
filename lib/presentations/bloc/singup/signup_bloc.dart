import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('email', event.email);
      await prefs.setString('password', event.password);
      await prefs.setString('username', event.username);
      emit(SignupSucces());
    } catch (e) {
      emit(SignupFailure("Failed to Signup ${e.toString()}"));
    }
  }
}
