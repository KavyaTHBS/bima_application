import 'package:bima_application/core/error/failures.dart';
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
