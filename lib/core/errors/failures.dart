import 'package:equatable/equatable.dart';
import 'package:fun_chat/core/errors/exception.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});
  final String message;
  final dynamic statusCode;
  @override
  List<Object?> get props => [message, statusCode];
  String get errorMessage => '$statusCode:$message';
  @override
  String toString() {
    return '$statusCode:$message';
  }
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, required super.statusCode});
}
