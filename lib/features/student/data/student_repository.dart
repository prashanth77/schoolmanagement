import 'package:dio/dio.dart';
import '../../../core/network/apiclient.dart';
import '../model/student_address.dart';
import '../model/student_grade.dart';
import '../model/student_guardian.dart';
import '../model/student_model.dart';

class StudentRepository {
  final ApiClient _apiClient = ApiClient();

  // Fetch all students
  Future<List<StudentModel>> fetchStudentsDetails() async {
    try {
      final response = await _apiClient.dio.get('/ems/v1/personal/student/students');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => StudentModel.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        throw Exception(response.data['errorMessage'] ?? 'Unauthorized');
      } else {
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch guardians/parents of a student
  Future<StudentGuardian> fetchStudentGuardians(int studentId) async {
    try {
      final response = await _apiClient.dio.get('/ems/v1/student/parent-guardians/$studentId');

      if (response.statusCode == 200) {
//        final List<dynamic> data = response.data is List ? response.data : [response.data];
        return StudentGuardian.fromJson(response.data);
//        return StudentGrade.fromJson(response.data);

      } else {
        throw Exception('Failed to fetch guardians: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch grade of a student
  Future<StudentGrade> fetchStudentGrade(int studentId) async {
    try {
      final response = await _apiClient.dio.get('/ems/v1/student/grade/$studentId');

      if (response.statusCode == 200) {
        return StudentGrade.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch grade: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch addresses of a student
  Future<StudentAddress> fetchStudentAddresses(int studentId) async {
    try {
      // If API supports query param for studentId
      final response = await _apiClient.dio.get('/ems/v1/student/addresses', queryParameters: {
        'studentId': studentId,
      });

      if (response.statusCode == 200) {
//        final List<dynamic> data = response.data;
        return StudentAddress.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch addresses: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
