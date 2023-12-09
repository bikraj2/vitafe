import 'package:fun_chat/core/common/emums/auth/auth_using.dart';
import 'package:fun_chat/core/common/emums/auth/update_user_actions.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();
  // SignUp
  //Forgot Password
  // Sign In
  // Update User
  // Auth using Google, Apple, Facebook?
  ResultFuture<void> signUp({
    required String email,
    required String passowrd,
    required String firstName,
    required String lastName,
    required String username,
    required DateTime birthDate,
    String middleName = '',
  });
// Update User : Can be any of the type defined in the enums
  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
  // Forgot Password : Either using Email or Password
  ResultFuture<void> forgotPassword({
    required AuthUsing using,
    required String data,
  });

  // SignIn
  ResultFuture<LocalUser> signIn({
    required AuthUsing using,
    required String password,
  });
}
