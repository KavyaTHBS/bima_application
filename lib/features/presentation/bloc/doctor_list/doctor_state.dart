part of 'doctor_bloc.dart';

abstract class DoctorBlocState extends Equatable{
  const DoctorBlocState();
  @override
  List<Object> get props => [];

}
class DoctorBlocInitial extends DoctorBlocState{}

class DoctorLoadedState extends DoctorBlocState {
  final List<Doctor> listOfDoctors;

  const DoctorLoadedState({required this.listOfDoctors});
  @override
  List<Object> get props => [listOfDoctors];
}
