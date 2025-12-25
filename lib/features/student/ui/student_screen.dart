import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/student_repository.dart';
import '../model/student_address.dart';
import '../model/student_grade.dart';
import '../model/student_guardian.dart';

class StudentDetailScreen extends StatefulWidget {
  final int studentId;
  const StudentDetailScreen({super.key, required this.studentId});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  final StudentRepository _repo = StudentRepository();

  late Future<StudentGuardian> _guardiansFuture;
  late Future<StudentGrade> _gradeFuture;
  late Future<StudentAddress> _addressesFuture;




  @override
  void initState() {
    super.initState();

    //  print("dadasdasdas ${widget.studentId}");
    _guardiansFuture = _repo.fetchStudentGuardians(widget.studentId);
    _gradeFuture = _repo.fetchStudentGrade(widget.studentId);
    _addressesFuture = _repo.fetchStudentAddresses(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Guardian Section
            const Text('Guardians', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            FutureBuilder<StudentGuardian>(
              future: _guardiansFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData ) {
                  return const Text('No guardians available');
                }

                final guardians = snapshot.data!;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${guardians.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Relation: ${guardians.relationType}'),
                        Text('Qualification: ${guardians.qualification}'),
                        Text('Occupation: ${guardians.occupation}'),
                        Text('Age: ${guardians.age}'),
                        Text('Email: ${guardians.emailId}'),
                        Text('Phone: ${guardians.phoneNumber}'),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            // Grade Section
            const Text('Grade', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            FutureBuilder<StudentGrade>(
              future: _gradeFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('No grade info available');
                }

                final grade = snapshot.data!;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Grade: ${grade.grade}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Section: ${grade.section}'),
                        Text('Roll Number: ${grade.rollNumber}'),
                        Text('Academic Year: ${grade.academicYear}'),
                        Text('Status: ${grade.studentStatus}'),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            // Address Section
            const Text('Addresses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            FutureBuilder<StudentAddress>(
              future: _addressesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData ) {
                  return const Text('No addresses available');
                }

                final addresses = snapshot.data!;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type: ${addresses.addressType}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('House: ${addresses.houseNumber}'),
                        Text('Area: ${addresses.area}'),
                        Text('City: ${addresses.city}'),
                        Text('State: ${addresses.state}'),
                        Text('Country: ${addresses.country}'),
                        Text('Zip: ${addresses.zipCode}'),
                        Text('Landmark: ${addresses.landMark}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
