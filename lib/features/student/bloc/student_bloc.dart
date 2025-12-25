import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/student_repository.dart';
import '../model/student_model.dart';


part 'student_event.dart';
part 'student_state.dart';


class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;

  StudentBloc({required this.studentRepository}) : super(StudentInitial()) {
    on<FetchStudents>((event, emit) async {
      emit(StudentLoading());
      try {
        final students = await studentRepository.fetchStudentsDetails();
        emit(StudentLoaded(students));
      } catch (e) {
        emit(StudentError(e.toString()));
      }
    });
  }
}
