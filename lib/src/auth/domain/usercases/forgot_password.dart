import 'package:equatable/equatable.dart';
import 'package:fun_chat/core/common/emums/auth/auth_using.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/core/usecases/usecases.dart';
import 'package:fun_chat/src/auth/domain/repositories/authentication_repository.dart';

class ForgotPassword extends UseCaseWithParams<void, ForgotPasswordParams> {
  ForgotPassword({required AuthRepo repo}) : _repo = repo;
  final AuthRepo _repo;

  @override
  ResultFuture<void> call(ForgotPasswordParams params) async =>
      _repo.forgotPassword(using: params.using, data: params.data);
}

class ForgotPasswordParams extends Equatable {
  const ForgotPasswordParams({required this.using, required this.data});
  final AuthUsing using;
  final String data;
  @override
  List<Object> get props => [using, data];
}
