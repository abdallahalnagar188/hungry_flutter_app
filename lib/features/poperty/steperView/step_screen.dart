import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constance/app_colors.dart';
import '../data/models/property_model.dart';
import '../widgets/step_bottom_bar.dart';
import '../widgets/step_five.dart';
import '../widgets/step_four.dart';
import '../widgets/step_one.dart';
import '../widgets/step_three.dart';
import '../widgets/step_two.dart';
import '../widgets/steper_app_bar.dart';

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  int _currentStep = 0;
  final PropertyData _data = PropertyData();

  final List<GlobalKey<FormState>> _formKeys = List.generate(
    4,
    (_) => GlobalKey<FormState>(),
  );

  final List<String> _stepTitles = [
    'المعلومات الأساسية',
    'Step 2: Details',
    'Step 3: Features',
    'Step 4: Amenities',
    'Step 5: Preview',
  ];

  // --- LOGIC ---

  void _nextStep() {
    if (_currentStep < 4) {
      if (_formKeys[_currentStep].currentState!.validate()) {
        _formKeys[_currentStep].currentState!.save();
        setState(() => _currentStep++);
      }
    } else {
      _submitData();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _submitData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success!'),
        content: const Text('All data submitted successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // --- UI ---

  @override
  Widget build(BuildContext context) {
    final double progress = (_currentStep + 1) / 5.0;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: SteperAppBar(
        progress: progress,
        currentStep: _currentStep,
        stepTitles: _stepTitles,
        previousStep: _previousStep,
      ),
      body: IndexedStack(
        index: _currentStep,
        children: [
          Step1BasicInfo(data: _data, formKey: _formKeys[0]),
          Step2Details(data: _data, formKey: _formKeys[1]),
          Step3Features(data: _data, formKey: _formKeys[2]),
          Step4Amenities(data: _data, formKey: _formKeys[3]),
          Step5Preview(data: _data),
        ],
      ),
      bottomNavigationBar: StepBottomBar(
        isLastStep: _currentStep == 4,
        onNext: _nextStep,
      ),
    );
  }
}

class SteperTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isOptional;
  final int maxLines;
  final FormFieldSetter<String> onSaved;

  const SteperTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isOptional = false,
    this.maxLines = 1,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (!isOptional)
                const Text(
                  ' *',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              if (isOptional)
                const Text(
                  ' (اختياري)', // (Optional)
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:  TextStyle(
                color: Color(0xff6C6C89),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            onSaved: onSaved,
            validator: (value) {
              if (!isOptional && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final FormFieldSetter<String> onSaved;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              const Text(
                ' *',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
           SizedBox(height: 8.h),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: Color(0xff6C6C89),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffD1D1DB), width: 1),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))))
                .toList(),
            onChanged: (value) {},
            onSaved: onSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
