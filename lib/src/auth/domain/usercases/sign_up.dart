import 'package:equatable/equatable.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/core/usecases/usecases.dart';
import 'package:fun_chat/src/auth/domain/repositories/authentication_repository.dart';

class SignUp extends UseCaseWithParams<void, SignUpParams> {
  const SignUp({required AuthRepo repo}) : _repo = repo;

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(SignUpParams params) async => _repo.signUp(
        email: params.email,
        passowrd: params.passowrd,
        firstName: params.firstName,
        lastName: params.lastName,
        username: params.username,
        birthDate: params.birthDate,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams(
      {required this.email,
      required this.passowrd,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.birthDate});

  final String email;
  final String passowrd;
  final String username;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  @override
  List<Object?> get props => [email, passowrd];
}
