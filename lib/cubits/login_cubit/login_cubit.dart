import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoaded());

    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(
          errorMsg: 'No user found for that email.'
        ));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
          errorMsg: 'Wrong password provided for that user.'
        ));
      }
    } on Exception catch (e) {
      emit(LoginFailure(
        errorMsg: 'Something Wrong Error'
      ));
    }
  }
}
