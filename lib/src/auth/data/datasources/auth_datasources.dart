import 'package:fun_chat/core/common/emums/auth/auth_using.dart';
import 'package:fun_chat/core/common/emums/auth/update_user_actions.dart';

abstract class AuthDataSource {
  const AuthDataSource();
  Future<void> forgotPassword(
    AuthUsing using,
  );
  Future<void> signIn({
    required AuthUsing using,
    required String password,
  });
  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String username,
    String? middleName = '',
  });

  Future<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<void> forgotPassword(AuthUsing using) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required AuthUsing using, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String password,
      required String username,
      String? middleName = ''}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(
      {required UpdateUserAction action, required userData}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
