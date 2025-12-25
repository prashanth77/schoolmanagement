import 'package:flutter/material.dart';
import 'package:schoolmanagement/features/student/ui/personal_info_section.dart';

import 'academic_section.dart';
import 'address_section.dart';
import 'guardian_section.dart';




class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  // controllers
  final _userName = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _age = TextEditingController();
  final _dob = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _identityMarks = TextEditingController();

  final _guardianName = TextEditingController();
  final _guardianQualification = TextEditingController();
  final _guardianOccupation = TextEditingController();
  final _guardianAge = TextEditingController();
  final _guardianEmail = TextEditingController();
  final _guardianPhone = TextEditingController();
  final _guardianRelation = TextEditingController();

  final _grade = TextEditingController();
  final _section = TextEditingController();
  final _rollNumber = TextEditingController();
  final _medium = TextEditingController();
  final _schoolName = TextEditingController();
  final _board = TextEditingController();
  final _academicYear = TextEditingController();
  final _studentStatus = TextEditingController();

  final _house = TextEditingController();
  final _area = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _country = TextEditingController();
  final _zip = TextEditingController();
  final _landmark = TextEditingController();

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PersonalInfoSection(
                userName: _userName,
                firstName: _firstName,
                lastName: _lastName,
                age: _age,
                dob: _dob,
                phone: _phone,
                email: _email,
                identityMarks: _identityMarks,
                gender: _gender,
                onGenderChanged: (val) => setState(() => _gender = val),
              ),
              GuardianSection(
                name: _guardianName,
                qualification: _guardianQualification,
                occupation: _guardianOccupation,
                age: _guardianAge,
                email: _guardianEmail,
                phone: _guardianPhone,
                relationType: _guardianRelation,
              ),
              AcademicSection(
                grade: _grade,
                section: _section,
                rollNumber: _rollNumber,
                medium: _medium,
                schoolName: _schoolName,
                board: _board,
                academicYear: _academicYear,
                studentStatus: _studentStatus,
              ),
              AddressSection(
                house: _house,
                area: _area,
                city: _city,
                state: _state,
                country: _country,
                zip: _zip,
                landmark: _landmark,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✅ Student Saved Successfully!')),
                    );
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Student'),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
