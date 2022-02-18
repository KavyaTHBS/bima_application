import 'package:bima_application/core/exceptions/failure.dart';
import 'package:bima_application/core/usecases/usecase.dart';
import 'package:bima_application/core/util/loading_status.dart';
import 'package:bima_application/features/doctor/domain/entities/doctor.dart';
import 'package:bima_application/features/doctor/domain/usecases/get_doctor_list.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';
 class DoctorBloc extends Bloc<DoctorBlocEvent, DoctorBlocState>{
  final GetDoctorList getDoctorList;
  DoctorBloc(this.getDoctorList) : super(DoctorBlocInitial()){
    on<GetDoctorBlocEvent>((event, emit) async {
      final Either<Failure, List<Doctor>> response = await getDoctorList(NoParams());
      emit(response.fold(
          (failure) => const DoctorsFailed(message: "Failed to load Doctor list"),
          (doctors) => DoctorLoadedState(listOfDoctors: doctors)
      ));
    } );
  }


}