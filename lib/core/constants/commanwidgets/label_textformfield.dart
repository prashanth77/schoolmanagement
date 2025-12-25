import 'package:flutter/material.dart';

class LabelledTextFieldRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double labelWidth;
  final double fieldWidth;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const LabelledTextFieldRow({
    super.key,
    required this.label,
    required this.controller,
    this.labelWidth = 150,
    this.fieldWidth = 300,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: labelWidth,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: fieldWidth,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: label,
                border: const OutlineInputBorder(),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
