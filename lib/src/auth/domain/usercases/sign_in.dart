import 'package:equatable/equatable.dart';
import 'package:fun_chat/core/common/emums/auth/auth_using.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/core/usecases/usecases.dart';
import 'package:fun_chat/src/auth/domain/repositories/authentication_repository.dart';

class SignIn extends UseCaseWithParams<void, SignInParams> {
  const SignIn({required AuthRepo repo}) : _repo = repo;

  final AuthRepo _repo;
  @override
  ResultFuture<void> call(SignInParams params) async =>
      _repo.signIn(using: params.using, password: params.passowrd);
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.using,
    required this.passowrd,
  });

  final AuthUsing using;
  final String passowrd;

  @override
  List<Object?> get props => [using, passowrd];
}
