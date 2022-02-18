import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/presentation/bloc/doctor_bloc.dart';

class DoctorListLoaded extends DoctorBlocState{
  final List<Doctor> doctorList;
  const DoctorListLoaded({required this.doctorList});

  @override
  List<Object> get props => [doctorList];

}
 class DoctorListFailed extends DoctorBlocState{
  final String errorMessage;

  const DoctorListFailed({ required this.errorMessage});
 }

