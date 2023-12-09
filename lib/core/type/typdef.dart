import 'package:dartz/dartz.dart';
import 'package:fun_chat/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
