import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/student_bloc.dart';
import '../data/student_repository.dart';


class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedGender = 'All Genders';
  String selectedAge = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StudentBloc(studentRepository: StudentRepository())..add(FetchStudents()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Students'),
          backgroundColor: Colors.transparent,
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onPressed: () {
                // Navigate to Add Student screen
                context.go('/addstudents');

              },
              icon: const Icon(Icons.person_add, color: Colors.blueAccent),
              label: const Text('Add Student', style: TextStyle(color: Colors.blueAccent)),
            ),
            const SizedBox(width: 10),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onPressed: () {
                context.go('/addstudentscreen');

              },
              icon: const Icon(Icons.people, color: Colors.white),
              label: const Text('View Students', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 🔍 Search Filters Row
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search by Name',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      items: ['All Genders', 'Male', 'Female']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedGender = value!);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                      onChanged: (val) => setState(() => selectedAge = val),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Implement search logic
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    child: const Text('Search'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        selectedGender = 'All Genders';
                        selectedAge = '';
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 📊 Students DataTable
              Expanded(
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is StudentLoaded) {
                      final students = state.students;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.blueAccent.shade100),
                          dataRowHeight: 55,
                          columns: const [
                            DataColumn(label: Text('#')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Gender')),
                            DataColumn(label: Text('Age')),
                            DataColumn(label: Text('Class')),
                            DataColumn(label: Text('Section')),
                            DataColumn(label: Text('Roll No')),
                            DataColumn(label: Text('Action')),
                          ],
                          rows: List.generate(students.length, (index) {
                            final student = students[index];
                            return DataRow(cells: [
                              DataCell(Text('${index + 1}')),
                              DataCell(Text(student.firstName)),
                              DataCell(Text(student.gender)),
                              DataCell(Text(student.age.toString())),
                              DataCell(Text(student.gender ?? '-')),
                              DataCell(Text(student.gender ?? '-')),
                              DataCell(Text(student.gender?.toString() ?? '-')),
                              DataCell(Row(
                                children: [
                                  IconButton(onPressed: (){

                                    final studentId = student.studentId; // 👈 Assuming your StudentModel has this field

                                    context.push('/studentdetails/$studentId');

                                  }, icon: Icon(Icons.edit)),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      final studentId = student.studentId;
                                      context.push('/studentdetails/$studentId');
                                    },
                                  )

/*
                                  IconButton(onPressed: (){}, icon: Icon(Icons.delete))
*/

                         /*         ElevatedButton(
                                    onPressed: () {
                                      // Edit logic
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                    ),
                                    child: const Text('Edit'),
                                  ),
                                  const SizedBox(width: 6),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Delete logic
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                    ),
                                    child: const Text('Delete'),
                                  ),*/
                                ],
                              )),
                            ]);
                          }),
                        ),
                      );
                    } else if (state is StudentError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text('No students available'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
