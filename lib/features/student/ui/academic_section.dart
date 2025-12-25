import 'package:flutter/material.dart';

import '../../../core/constants/commanwidgets/comman_textform_field.dart';

class AcademicSection extends StatelessWidget {
  final TextEditingController grade;
  final TextEditingController section;
  final TextEditingController rollNumber;
  final TextEditingController medium;
  final TextEditingController schoolName;
  final TextEditingController board;
  final TextEditingController academicYear;
  final TextEditingController studentStatus;

  const AcademicSection({
    super.key,
    required this.grade,
    required this.section,
    required this.rollNumber,
    required this.medium,
    required this.schoolName,
    required this.board,
    required this.academicYear,
    required this.studentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🎓 Academic Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16  ,
              children: [
                CustomTextField(controller: grade, label: 'Grade'),
                CustomTextField(controller: section, label: 'Section'),
                CustomTextField(controller: rollNumber, label: 'Roll Number'),
                CustomTextField(controller: medium, label: 'Medium'),
                CustomTextField(controller: schoolName, label: 'School Name'),
                CustomTextField(controller: board, label: 'Board'),
                CustomTextField(controller: academicYear, label: 'Academic Year'),
                CustomTextField(controller: studentStatus, label: 'Student Status'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
