import 'package:equatable/equatable.dart';
import 'package:fun_chat/core/common/emums/auth/update_user_actions.dart';
import 'package:fun_chat/core/type/typdef.dart';
import 'package:fun_chat/core/usecases/usecases.dart';
import 'package:fun_chat/src/auth/domain/repositories/authentication_repository.dart';

class UpdateUser extends UseCaseWithParams<void, UpdateUserParams> {
  const UpdateUser(this._repo);
  final AuthRepo _repo;
  @override
  ResultFuture<void> call(UpdateUserParams params) =>
      _repo.updateUser(action: params.action, userData: params.userData);
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.userData, required this.action});
  const UpdateUserParams.empty()
      : this(action: UpdateUserAction.username, userData: 'userData');
  final dynamic userData;
  final UpdateUserAction action;
  @override
  List<Object?> get props => [userData, action];
}
