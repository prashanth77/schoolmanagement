import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/commanwidgets/comman_textform_field.dart';


class StudentFormScreen extends StatefulWidget {
  const StudentFormScreen({super.key});

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  // Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _houseController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _guardianNameController = TextEditingController();
  final _guardianEmailController = TextEditingController();
  final _guardianPhoneController = TextEditingController();
  final _relationTypeController = TextEditingController();

  String? _gender;
  String? _grade;
  String? _section;
  String? _studentStatus;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 75);
    if (pickedFile != null) {
      setState(() => _profileImage = File(pickedFile.path));
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('👦 Student Details'),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          CustomTextField(controller: _firstNameController, label: 'First Name'),
                          CustomTextField(controller: _lastNameController, label: 'Last Name'),
                          _buildDropdown('Gender', ['Male', 'Female', 'Other'], _gender,
                                  (val) => setState(() => _gender = val)),
                          CustomTextField(controller: _dobController, label: 'Date of Birth (YYYY-MM-DD)'),
                          CustomTextField(controller: _emailController, label: 'Email ID'),
                          CustomTextField(controller: _phoneController, label: 'Phone Number'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage:
                                _profileImage != null ? FileImage(_profileImage!) : null,
                                child: _profileImage == null
                                    ? const Icon(Icons.person, size: 60, color: Colors.white70)
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 4,
                                child: InkWell(
                                  onTap: _showImagePickerOptions,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.camera_alt,
                                        color: Colors.white, size: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text('Profile Image',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                _buildSectionTitle('🎓 Academic Info'),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _buildDropdown('Grade',
                        ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'], _grade,
                            (val) => setState(() => _grade = val)),
                    _buildDropdown('Section', ['A', 'B', 'C', 'D'], _section,
                            (val) => setState(() => _section = val)),
                    _buildDropdown('Status', ['Active', 'Inactive'], _studentStatus,
                            (val) => setState(() => _studentStatus = val)),
                  ],
                ),

                const SizedBox(height: 24),
                _buildSectionTitle('🏠 Address'),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    CustomTextField(controller: _houseController, label: 'House Number'),
                    CustomTextField(controller: _areaController, label: 'Area'),
                    CustomTextField(controller: _cityController, label: 'City'),
                    CustomTextField(controller: _stateController, label: 'State'),
                    CustomTextField(controller: _countryController, label: 'Country'),
                    CustomTextField(controller: _zipController, label: 'Zip Code'),
                    CustomTextField(controller: _landmarkController, label: 'Landmark'),
                  ],
                ),

                const SizedBox(height: 24),
                _buildSectionTitle('👨‍👩‍👧 Guardian Details'),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    CustomTextField(controller: _guardianNameController, label: 'Name'),
                    CustomTextField(controller: _guardianEmailController, label: 'Email ID'),
                    CustomTextField(controller: _guardianPhoneController, label: 'Phone Number'),
                    CustomTextField(controller: _relationTypeController, label: 'Relation Type'),
                  ],
                ),

                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Student details saved successfully!')),
                        );
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Details'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value, Function(String?) onChanged) {
    return SizedBox(
      width: 280,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        value: value,
        onChanged: onChanged,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        validator: (value) => value == null ? 'Required' : null,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
