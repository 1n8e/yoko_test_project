import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:yoko_test_project/data/auth/datasource.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthDataSource datasource;
  final Box tokens;

  AuthCubit(this.datasource, this.tokens) : super(AuthInitial());

  void logIn(String email, String password) async {
    emit(CheckAuth());
    await datasource.logIn(email, password);
    final access = tokens.get('access');
    if (access != null) {
      emit(SuccessAuth());
    } else {
      emit(FailureAuth());
    }
  }
}
