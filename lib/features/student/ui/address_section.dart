import 'package:flutter/material.dart';

import '../../../core/constants/commanwidgets/comman_textform_field.dart';

class AddressSection extends StatelessWidget {
  final TextEditingController house;
  final TextEditingController area;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController country;
  final TextEditingController zip;
  final TextEditingController landmark;

  const AddressSection({
    super.key,
    required this.house,
    required this.area,
    required this.city,
    required this.state,
    required this.country,
    required this.zip,
    required this.landmark,
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
            const Text('🏠 Address Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CustomTextField(controller: house, label: 'House Number'),
                CustomTextField(controller: area, label: 'Area'),
                CustomTextField(controller: city, label: 'City'),
                CustomTextField(controller: state, label: 'State'),
                CustomTextField(controller: country, label: 'Country'),
                CustomTextField(controller: zip, label: 'Zip Code'),
                CustomTextField(controller: landmark, label: 'Landmark'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
