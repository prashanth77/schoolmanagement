class StudentModel {
  final int studentId;
  final String userName;
  final int registrationId;
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final String dateOfBirth;
  final String profileImage;
  final int phoneNumber;
  final String emailId;
  final String identityMarks;
  final List<dynamic> studentAddresses;
  final List<dynamic> studentParentGuardians;
  final dynamic studentGrade;
  final dynamic studentDemographic;
  final List<dynamic> studentAttendances;
  final List<dynamic> studentPreviousAcademicDetails;
  final List<dynamic> studentDocuments;
  final List<dynamic> studentFeeDetails;

  StudentModel({
    required this.studentId,
    required this.userName,
    required this.registrationId,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.dateOfBirth,
    required this.profileImage,
    required this.phoneNumber,
    required this.emailId,
    required this.identityMarks,
    required this.studentAddresses,
    required this.studentParentGuardians,
    this.studentGrade,
    this.studentDemographic,
    required this.studentAttendances,
    required this.studentPreviousAcademicDetails,
    required this.studentDocuments,
    required this.studentFeeDetails,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['studentId'] ?? 0,
      userName: json['userName'] ?? '',
      registrationId: json['registrationId'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      dateOfBirth: json['dateOfBirth'] ?? '',
      profileImage: json['profileImage'] ?? '',
      phoneNumber: json['phoneNumber'] ?? 0,
      emailId: json['emailId'] ?? '',
      identityMarks: json['identityMarks'] ?? '',
      studentAddresses: List<dynamic>.from(json['studentAddresses'] ?? []),
      studentParentGuardians:
      List<dynamic>.from(json['studentParentGuardians'] ?? []),
      studentGrade: json['studentGrade'],
      studentDemographic: json['studentDemographic'],
      studentAttendances: List<dynamic>.from(json['studentAttendances'] ?? []),
      studentPreviousAcademicDetails:
      List<dynamic>.from(json['studentPreviousAcademicDetails'] ?? []),
      studentDocuments: List<dynamic>.from(json['studentDocuments'] ?? []),
      studentFeeDetails: List<dynamic>.from(json['studentFeeDetails'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'userName': userName,
      'registrationId': registrationId,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'age': age,
      'dateOfBirth': dateOfBirth,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'emailId': emailId,
      'identityMarks': identityMarks,
      'studentAddresses': studentAddresses,
      'studentParentGuardians': studentParentGuardians,
      'studentGrade': studentGrade,
      'studentDemographic': studentDemographic,
      'studentAttendances': studentAttendances,
      'studentPreviousAcademicDetails': studentPreviousAcademicDetails,
      'studentDocuments': studentDocuments,
      'studentFeeDetails': studentFeeDetails,
    };
  }

  static List<StudentModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((e) => StudentModel.fromJson(e)).toList();
  }
}
