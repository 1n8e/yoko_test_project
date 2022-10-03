part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class CheckAuth extends AuthState {}

class SuccessAuth extends AuthState {}

class FailureAuth extends AuthState {}