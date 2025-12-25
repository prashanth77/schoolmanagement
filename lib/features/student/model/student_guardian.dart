class StudentGuardian {
  final int guardianId;
  final String name;
  final String qualification;
  final String occupation;
  final int age;
  final String emailId;
  final String phoneNumber;
  final String relationType;

  StudentGuardian({
    required this.guardianId,
    required this.name,
    required this.qualification,
    required this.occupation,
    required this.age,
    required this.emailId,
    required this.phoneNumber,
    required this.relationType,
  });

  factory StudentGuardian.fromJson(Map<String, dynamic> json) => StudentGuardian(
    guardianId: json['guardianId'],
    name: json['name'],
    qualification: json['qualification'],
    occupation: json['occupation'],
    age: json['age'],
    emailId: json['emailId'],
    phoneNumber: json['phoneNumber'],
    relationType: json['relationType'],
  );
}