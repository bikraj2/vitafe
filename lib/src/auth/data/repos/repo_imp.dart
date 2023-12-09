import 'package:fun_chat/core/common/emums/auth/auth_using.dart';
import 'package:fun_chat/core/common/emums/auth/update_user_actions.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/src/auth/domain/entities/user.dart';
import 'package:fun_chat/src/auth/domain/repositories/authentication_repository.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  ResultFuture<void> forgotPassword(
      {required AuthUsing using, required String data}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<LocalUser> signIn(
      {required AuthUsing using, required String password}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> signUp(
      {required String email,
      required String passowrd,
      required String firstName,
      required String lastName,
      required String username,
      required DateTime birthDate,
      String middleName = ''}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  }) {
    throw UnimplementedError();
  }
}
