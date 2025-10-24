import 'package:flutter/material.dart';

import '../data/models/property_model.dart';
import '../steperView/step_screen.dart';

class Step3Features extends StatelessWidget {
  final PropertyData data;
  final GlobalKey<FormState> formKey;

  const Step3Features({
    super.key,
    required this.data,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Step 3: Features'),
            ...List.generate(
              1,
                  (index) => SteperTextField(
                label: 'Feature ${index + 1}',
                hint: 'Enter feature ${index + 1}',
                onSaved: (value) {
                  switch (index) {
                    case 0:
                      data.field3_1 = value;
                      break;

                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 4,
            color: Colors.blue,
            margin: const EdgeInsets.only(right: 8),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
