import 'package:flutter/material.dart';

import '../../../core/constants/commanwidgets/comman_textform_field.dart';

class GuardianSection extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController qualification;
  final TextEditingController occupation;
  final TextEditingController age;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController relationType;

  const GuardianSection({
    super.key,
    required this.name,
    required this.qualification,
    required this.occupation,
    required this.age,
    required this.email,
    required this.phone,
    required this.relationType,
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
            const Text('👨‍👩‍👧 Guardian Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CustomTextField(controller: name, label: 'Name'),
                CustomTextField(controller: qualification, label: 'Qualification'),
                CustomTextField(controller: occupation, label: 'Occupation'),
                CustomTextField(controller: age, label: 'Age'),
                CustomTextField(controller: email, label: 'Email'),
                CustomTextField(controller: phone, label: 'Phone Number'),
                CustomTextField(controller: relationType, label: 'Relation Type'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
