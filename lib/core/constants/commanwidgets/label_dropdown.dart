import 'package:flutter/material.dart';

class LabelledDropdownRow extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final double labelWidth;
  final double fieldWidth;

  const LabelledDropdownRow({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.labelWidth = 150,
    this.fieldWidth = 300,
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
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Select $label',
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 10),
              ),
              value: value,
              onChanged: onChanged,
              validator: (value) => value == null ? 'Required' : null,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
