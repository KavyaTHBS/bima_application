import 'package:bima_application/core/exceptions/app_error.dart';
import 'package:bima_application/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(NoParams noParams);

  }
  class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  }
  abstract class UseCases<Type, Params>{
  Future<Either<AppError, Type>> call(Params Params);

  }
  class params extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  }
  abstract class UseCasesForAuth<Type, Params>{
  Future<Either<AppError, Type>> call(Params Params,params,pragma);

  }

