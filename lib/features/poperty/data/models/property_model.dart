
class PropertyData {
  // Step 1
  String? propertyType;
  String? nameArabic;
  String? descArabic;
  String? nameEnglish;
  String? descEnglish;
  String? country;
  String? city;
  String? region;
  String? locationOnMap; // This would be a LatLng in a real app
  String? propertyArea;

  // Step 2 (8 fields)
  String? field2_1;
  String? field2_2;
  String? field2_3;
  String? field2_4;
  String? field2_5;
  String? field2_6;
  String? field2_7;
  String? field2_8;

  // Step 3 (8 fields)
  String? field3_1;
  String? field3_2;
  String? field3_3;
  String? field3_4;
  String? field3_5;
  String? field3_6;
  String? field3_7;
  String? field3_8;

  // Step 4 (8 fields)
  String? field4_1;
  String? field4_2;
  String? field4_3;
  String? field4_4;
  String? field4_5;
  String? field4_6;
  String? field4_7;
  String? field4_8;

  // Helper to display data on the preview screen
  Map<String, dynamic> toMap() {
    return {
      'Property Type': propertyType,
      'Name (Arabic)': nameArabic,
      'Description (Arabic)': descArabic,
      'Name (English)': nameEnglish,
      'Description (English)': descEnglish,
      'Country': country,
      'City': city,
      'Region': region,
      'Location': locationOnMap ?? 'Not Set',
      'Property Area': propertyArea,
      'Step 2 - Field 1': field2_1,
      'Step 2 - Field 2': field2_2,
      'Step 4 - Field 8': field4_8,
    };
  }
}