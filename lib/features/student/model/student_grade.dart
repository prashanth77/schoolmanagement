class StudentGrade {
  final int gradeId;
  final String grade;
  final String section;
  final String rollNumber;
  final String academicYear;
  final String studentStatus;

  StudentGrade({
    required this.gradeId,
    required this.grade,
    required this.section,
    required this.rollNumber,
    required this.academicYear,
    required this.studentStatus,
  });

  factory StudentGrade.fromJson(Map<String, dynamic> json) => StudentGrade(
    gradeId: json['gradeId'],
    grade: json['grade'],
    section: json['section'],
    rollNumber: json['rollNumber'],
    academicYear: json['academicYear'],
    studentStatus: json['studentStatus'],
  );
}
