part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();
  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentState {}
class StudentLoading extends StudentState {}

// List of students
class StudentLoaded extends StudentState {
  final List<StudentModel> students;
  const StudentLoaded(this.students);

  @override
  List<Object?> get props => [students];
}



// Single student detail
class StudentDetailLoaded extends StudentState {
  final StudentModel student;
  const StudentDetailLoaded(this.student);

  @override
  List<Object?> get props => [student];
}

class StudentError extends StudentState {
  final String message;
  const StudentError(this.message);

  @override
  List<Object?> get props => [message];
}
