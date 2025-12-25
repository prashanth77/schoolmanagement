import 'package:flutter/material.dart';

import '../../../core/constants/commanwidgets/comman_textform_field.dart';

class PersonalInfoSection extends StatelessWidget {
  final TextEditingController userName;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController age;
  final TextEditingController dob;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController identityMarks;

  final String? gender;
  final ValueChanged<String?> onGenderChanged;

  const PersonalInfoSection({
    super.key,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.dob,
    required this.phone,
    required this.email,
    required this.identityMarks,
    required this.gender,
    required this.onGenderChanged,
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
            const Text('👦 Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CustomTextField(controller: userName, label: 'Username'),
                CustomTextField(controller: firstName, label: 'First Name'),
                CustomTextField(controller: lastName, label: 'Last Name'),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    value: gender,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                    onChanged: onGenderChanged,
                  ),
                ),
                CustomTextField(controller: age, label: 'Age'),
                CustomTextField(controller: dob, label: 'Date of Birth'),
                CustomTextField(controller: phone, label: 'Phone Number'),
                CustomTextField(controller: email, label: 'Email ID'),
                CustomTextField(controller: identityMarks, label: 'Identity Marks'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
