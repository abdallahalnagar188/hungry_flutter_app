import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_flutter_app/common/widgets/rounded_container.dart';

import '../data/models/property_model.dart';
import '../steperView/step_screen.dart';

class Step1BasicInfo extends StatelessWidget {
  final PropertyData data;
  final GlobalKey<FormState> formKey;

  const Step1BasicInfo({super.key, required this.data, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle('المعلومات الأساسية','assets/icons/info_icon.svg'),
                  Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownField(
                          label: 'نوع العقار',
                          hint: 'اختر نوع العقار',
                          items: const ['فندق', 'شقة', 'فيلا'],
                          onSaved: (value) => data.propertyType = value,
                        ),
                        Gap(12),
                        SteperTextField(
                          label: 'اسم العقار باللغة العربية',
                          hint: 'اسم العقار باللغة العربية',
                          onSaved: (value) => data.nameArabic = value,
                        ),
                        Gap(12),
                        SteperTextField(
                          label: 'الوصف باللغة العربية',
                          hint: 'الوصف باللغة العربية',
                          maxLines: 4,
                          onSaved: (value) => data.descArabic = value,
                        ),
                        Gap(12),
                        SteperTextField(
                          label: 'اسم العقار باللغة الانجليزية',
                          hint: 'اسم العقار باللغة الانجليزية',
                          isOptional: true,
                          onSaved: (value) => data.nameEnglish = value,
                        ),
                        Gap(12),
                        SteperTextField(
                          label: 'الوصف باللغة الانجليزية',
                          hint: 'الوصف باللغة الانجليزية',
                          isOptional: true,
                          maxLines: 4,
                          onSaved: (value) => data.descEnglish = value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            TRoundedContainer(
              child: Column(
                children: [
                  _sectionTitle('الموقع الجغرافي','assets/icons/location.svg'),
                  Divider(),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 14.w,
                      end: 14.w,
                      bottom: 14,
                    ),
                    child: Column(
                      children: [
                        CustomDropdownField(
                          label: 'الدولة',
                          hint: 'اختر الدولة',
                          items: const ['عمان', 'السعودية', 'الإمارات'],
                          onSaved: (value) => data.country = value,
                        ),
                        Gap(12),
                        CustomDropdownField(
                          label: 'المدينة',
                          hint: 'اختر المدينة',
                          items: const ['صلالة', 'مسقط', 'صحار'],
                          onSaved: (value) => data.city = value,
                        ),
                        SizedBox(height: 12.h),
                        CustomDropdownField(
                          label: 'المنطقة',
                          hint: 'اختر المنطقة',
                          items: const ['منطقة 1', 'منطقة 2'],
                          onSaved: (value) => data.region = value,
                        ),
                        SizedBox(height: 12.h),
                        SteperTextField(
                          label: 'الموقع على الخريطة',
                          hint: 'اضغط لتحديد الموقع',
                          onSaved: (value) => data.locationOnMap = value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title,String iconPath) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
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
    );
  }
}
