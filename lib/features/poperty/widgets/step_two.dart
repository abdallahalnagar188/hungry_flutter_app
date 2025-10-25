import 'package:flutter/material.dart';
import '../../../common/widgets/rounded_container.dart';
import '../data/models/property_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';


class Step2Details extends StatelessWidget {
  final PropertyData data;
  final GlobalKey<FormState> formKey;

  const Step2Details({
    super.key,
    required this.data,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle(
                    'تفاصيل مكان الإقامة',
                    'assets/icons/info_icon.svg',
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                      top: 14.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CounterFormField(
                          label: 'عدد الوحدات (الشقق/الفلل)',
                          isRequired: true,
                          initialValue: 2,
                          onSaved: (value) {
                             data.unitCount = value;
                          },
                        ),
                        Gap(12.h),
                        CounterFormField(
                          label: 'عدد الضيوف',
                          isRequired: true,
                          initialValue: 2,
                          onSaved: (value) {
                             data.guestCount = value;
                          },
                        ),
                        Gap(12.h),
                        CounterFormField(
                          label: 'عدد الحمامات',
                          isRequired: true,
                          initialValue: 2,
                          onSaved: (value) {
                             data.bathCount = value;
                          },
                        ),
                        Gap(12.h),
                        CounterFormField(
                          label: 'الحد الأدنى للحجز (أيام)',
                          isRequired: true,
                          initialValue: 2,
                          onSaved: (value) {
                             data.minStayDays = value;
                          },
                        ),
                        Gap(12.h),
                        CounterFormField(
                          label: 'حد أقصى مسبق الحجز',
                          isRequired: true,
                          initialValue: 2,
                          onSaved: (value) {
                             data.maxBookingDays = value;
                          },
                        ),
                        Gap(12.h),
                        CustomTextFormField(
                          label: 'مساحة العقار (اختياري)',
                          suffixText: 'م²',
                          hint: 'ابدأ الطباعة...',
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                             data.propertyArea = value;
                          },
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- Section 2: Rooms and Beds ---
            TRoundedContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionTitle(
                        'الغرف والأسرة',
                        'assets/icons/info_icon.svg', // <-- TODO: Update icon path
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 12.w,
                          end: 12.w,
                          bottom: 4.h,
                          top: 12.h,
                        ),

                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label:  Text('إضافة', style: TextStyle(fontSize: 14.sp)),
                          onPressed: () {
                            // Handle Add Room
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14.h,
                      top: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'لا يوجد غرف حتى الآن',
                          style: TextStyle(
                              color: Color(0xff121217), fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- Section 3: Facilities and Services ---
            TRoundedContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionTitle(
                        'المرافق والخدمات',
                        'assets/icons/info_icon.svg', // <-- TODO: Update icon path
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 12.w,
                          end: 12.w,
                          top: 12.h,
                        ),

                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label:  Text('إضافة', style: TextStyle(fontSize: 14.sp)),
                          onPressed: () {
                            // Handle Add Room
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14.h,
                      top: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'لا يوجد غرف حتى الآن',
                          style: TextStyle(
                              color: Color(0xff121217), fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- Section 4: Arrival and Departure ---
            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle(
                    'وقت الوصول والمغادرة',
                    'assets/icons/info_icon.svg', // <-- TODO: Update icon path
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                    ),
                    child: Column(
                      children: [
                        TimeRangePicker(
                          sectionLabel: 'وقت الوصول',
                          onFromSaved: (time) {
                             data.checkInFrom = time;
                          },
                          onToSaved: (time) {
                             data.checkInTo = time;
                          },
                        ),
                        Gap(16.h),
                        TimeRangePicker(
                          sectionLabel: 'وقت المغادرة',
                          onFromSaved: (time) {
                             data.checkOutFrom = time;
                          },
                          onToSaved: (time) {
                             data.checkOutTo = time;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- Section 5: Property Rules ---
            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle(
                    'قواعد مكان الإقامة',
                    'assets/icons/info_icon.svg', // <-- TODO: Update icon path
                  ),
                  const Divider(),
                  SizedBox(height: 12.h),

                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                    ),
                    child: Column(
                      children: [
                        ToggleFormField(
                          label: 'التدخين مسموح',
                          onSaved: (value) {
                             data.allowSmoking = value;
                          },
                        ),
                        ToggleFormField(
                          label: 'يسمح بدخول الحيوانات الأليفة',
                          onSaved: (value) {
                             data.allowPets = value;
                          },
                        ),
                        ToggleFormField(
                          label: 'يسمح بالحفلات والمناسبات',
                          onSaved: (value) {
                             data.allowParties = value;
                          },
                        ),
                        ToggleFormField(
                          label: 'يسمح باصطحاب الأطفال',
                          onSaved: (value) {
                             data.allowChildren = value;
                          },
                        ),
                        ToggleFormField(
                          label: 'للعوائل فقط',
                          onSaved: (value) {
                             data.familiesOnly = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- Section 6: Cancellation Policy ---
            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle(
                    'سياسة الإلغاء',
                    'assets/icons/info_icon.svg',
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                    ),
                    child: Column(
                      children: [
                        CounterCancelFormField(
                          label:
                          'المدة المسموح بها لإلغاء الحجز قبل تاريخ وصول المستأجر (بالأيام)',
                          initialValue: 1,
                          onSaved: (value) {
                             data.cancellationDays = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }


  Widget _sectionTitle(String title,String iconPath) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: SizedBox(
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.segment, color: Colors.blue),
      ],
    );
  }
}


class CounterFormField extends FormField<int> {
  CounterFormField({
    super.key,
    required String label,
    bool isRequired = false,
    int super.initialValue = 0,
    super.onSaved,
  }) : super(
    builder: (FormFieldState<int> state) {
      void increment() {
        state.didChange(state.value! + 1);
      }

      void decrement() {
        if (state.value! > 0) {
          state.didChange(state.value! - 1);
        }
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),

            Spacer(),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: increment,
                      color: Colors.black54,
                    ),
                  ),
                  Gap(18),
                  Text(
                    '${state.value}',
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff384250),
                    ),
                  ),
                  Gap(18),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrement,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class CounterCancelFormField extends FormField<int> {
  CounterCancelFormField({
    super.key,
    required String label,
    bool isRequired = false,
    int super.initialValue = 0,
    super.onSaved,
  }) : super(
    builder: (FormFieldState<int> state) {
      void increment() {
        state.didChange(state.value! + 1);
      }

      void decrement() {
        if (state.value! > 0) {
          state.didChange(state.value! - 1);
        }
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            SizedBox(height: 8.h),

            Container(
              height: 40.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: increment,
                      color: Color(0xff161616),
                    ),
                  ),
                  Gap(18),
                  Text(
                    '${state.value}',
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff384250),
                    ),
                  ),
                  Gap(18),
                  Container(
                    width: 70.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrement,
                      color: Color(0xff161616),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? suffixText;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.suffixText,
    this.onSaved,
    this.keyboardType, this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp)),

          SizedBox(height: 8.h),

          TextFormField(
            onSaved: onSaved,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint ,
              suffixText: suffixText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}


class AddItemSection extends StatelessWidget {
  final String title;
  final String placeholder;
  final VoidCallback onAddPressed;

  const AddItemSection({
    super.key,
    required this.title,
    required this.placeholder,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('إضافة'),
            onPressed: onAddPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          placeholder,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
      ],
    );
  }
}


class ToggleFormField extends FormField<bool> {
  ToggleFormField({
    super.key,
    required String label,
    bool initialValue = false,
    FormFieldSetter<bool>? onSaved,
  }) : super(
    initialValue: initialValue,
    onSaved: onSaved,
    builder: (FormFieldState<bool> state) {
      return Container(
        height: 44.h,
        margin: const EdgeInsets.only(bottom: 10),
        padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffEDF1F9)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 33.w,
              height: 22.h,
              child: Switch(
                padding: EdgeInsets.zero,
                value: state.value!,
                onChanged: (newValue) {
                  state.didChange(newValue);
                },
                activeColor: Colors.white,
                activeTrackColor: Color(0xff3C69E3),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class TimeRangePicker extends StatelessWidget {
  final String sectionLabel;
  final FormFieldSetter<TimeOfDay>? onFromSaved;
  final FormFieldSetter<TimeOfDay>? onToSaved;

  const TimeRangePicker({
    super.key,
    required this.sectionLabel,
    this.onFromSaved,
    this.onToSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionLabel,
          style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
         SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _TimeInputFormField(label: 'من', onSaved: onFromSaved)),
             SizedBox(width: 16.w),
            Expanded(child: _TimeInputFormField(label: 'الى', onSaved: onToSaved)),
          ],
        ),
      ],
    );
  }
}

// Helper widget for the individual time input field
class _TimeInputFormField extends FormField<TimeOfDay> {
  _TimeInputFormField({
    required String label,
    FormFieldSetter<TimeOfDay>? onSaved,
  }) : super(
    onSaved: onSaved,
    builder: (FormFieldState<TimeOfDay> state) {
      final displayTime =
          state.value?.format(state.context) ?? '00:00';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(state.context)
                  .style
                  .copyWith(fontSize: 15),
              children: [
                TextSpan(text: label),
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: state.context,
                initialTime: state.value ?? TimeOfDay.now(),
              );
              if (picked != null) {
                state.didChange(picked);
              }
            },
            child: Container(
              height: 40.h,
              width: 153.w,
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    displayTime,
                    style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xff6C6C89)),
                  ),
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}