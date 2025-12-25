import 'package:flutter/material.dart';
import '../../../core/constants/commanwidgets/comman_textform_field.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example controllers (you can expand per section)
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  final guardianNameController = TextEditingController();
  final guardianPhoneController = TextEditingController();

  final gradeController = TextEditingController();
  final sectionController = TextEditingController();
  final rollNumberController = TextEditingController();
  final academicYearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _saveStudent() {
    // You can build your JSON or model object here
    final studentData = {
      "personalInfo": {
        "userName": userNameController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "gender": genderController.text,
        "age": int.tryParse(ageController.text) ?? 0,
        "dateOfBirth": dobController.text,
        "phoneNumber": phoneController.text,
        "emailId": emailController.text,
      },
      "addresses": [
        {
          "addressType": "Present",
          "city": cityController.text,
          "state": stateController.text,
          "country": countryController.text,
        }
      ],
      "parentGuardians": [
        {
          "name": guardianNameController.text,
          "phoneNumber": guardianPhoneController.text,
        }
      ],
      "grades": [
        {
          "grade": gradeController.text,
          "section": sectionController.text,
          "rollNumber": rollNumberController.text,
          "academicYear": academicYearController.text,
        }
      ],
    };

    debugPrint(studentData.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Student saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Personal"),
            Tab(text: "Address"),
            Tab(text: "Guardian"),
            Tab(text: "Academic"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPersonalTab(),
          _buildAddressTab(),
          _buildGuardianTab(),
          _buildAcademicTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveStudent,
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }

  // ---- Personal Info ----
  Widget _buildPersonalTab() {
    return _buildFormSection([
      CustomTextField(controller: userNameController, label: "Username"),
      CustomTextField(controller: firstNameController, label: "First Name"),
      CustomTextField(controller: lastNameController, label: "Last Name"),
      CustomTextField(controller: genderController, label: "Gender"),
      CustomTextField(controller: ageController, label: "Age"),
      CustomTextField(controller: dobController, label: "Date of Birth"),
      CustomTextField(controller: phoneController, label: "Phone Number"),
      CustomTextField(controller: emailController, label: "Email"),
    ]);
  }

  // ---- Address Info ----
  Widget _buildAddressTab() {
    return _buildFormSection([
      CustomTextField(controller: addressController, label: "Address Type"),
      CustomTextField(controller: cityController, label: "City"),
      CustomTextField(controller: stateController, label: "State"),
      CustomTextField(controller: countryController, label: "Country"),
    ]);
  }

  // ---- Guardian Info ----
  Widget _buildGuardianTab() {
    return _buildFormSection([
      CustomTextField(controller: guardianNameController, label: "Guardian Name"),
      CustomTextField(controller: guardianPhoneController, label: "Guardian Phone"),
    ]);
  }

  // ---- Academic Info ----
  Widget _buildAcademicTab() {
    return _buildFormSection([
      CustomTextField(controller: gradeController, label: "Grade"),
      CustomTextField(controller: sectionController, label: "Section"),
      CustomTextField(controller: rollNumberController, label: "Roll Number"),
      CustomTextField(controller: academicYearController, label: "Academic Year"),
    ]);
  }

  // ---- Helper ----
  Widget _buildFormSection(List<Widget> fields) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: fields
            .map((field) => SizedBox(
          width: MediaQuery.of(context).size.width > 600 ? 300 : double.infinity,
          child: field,
        ))
            .toList(),
      ),
    );
  }
}
