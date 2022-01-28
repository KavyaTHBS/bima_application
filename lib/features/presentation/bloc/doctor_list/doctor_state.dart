part of 'doctor_bloc.dart';

abstract class DoctorBlocState extends Equatable{
  const DoctorBlocState();
  @override
  List<Object> get props => [];

}
class DoctorBlocInitial extends DoctorBlocState{}
