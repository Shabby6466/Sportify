import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(onLoginSubmitted);
  }
}

Future<void> onLoginSubmitted(
    LoginSubmitted event, Emitter<LoginState> emit) async {
  emit(LoginLoading());

  try {
    await Future.delayed(const Duration(seconds: 3));
    // final prefs = GetIt.instance<SharedPreferences>();

    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (storedEmail == event.email && storedPassword == event.password) {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure("Invalid email or password"));
    }
  } catch (e) {
    emit(LoginFailure("Failed to Login ${e.toString()}"));
  }
}
