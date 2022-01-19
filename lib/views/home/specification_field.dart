import 'package:flutter/material.dart';

class SpecificationField extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const SpecificationField({
    Key? key,
    required this.fieldName,
    required this.fieldValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$fieldName ',
              style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.orange
                  ),
            ),
            TextSpan(
              text: fieldValue,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
