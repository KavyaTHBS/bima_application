import 'package:bima_application/features/domain/entities/doctor.dart';
import 'package:bima_application/features/presentation/bloc/doctor_list/doctor_bloc.dart';

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

