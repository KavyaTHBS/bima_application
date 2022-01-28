part of 'doctor_bloc.dart';

abstract class DoctorBlocEvent extends Equatable{
  const DoctorBlocEvent();

  @override
  List<Object> get props =>[];
}
class GetDoctorBlocEvent extends DoctorBlocEvent{

}