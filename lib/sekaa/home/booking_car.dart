import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BookingsCard extends StatelessWidget {
  const BookingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      "فعال": 4,
      "مكتمل": 7,
      "ملغي": 3,
    };

    final List<Color> colorList = [
      const Color(0xFF4A85F6),
      const Color(0xFF34A853),
      const Color(0xFFEA4335),
    ];

    const double totalBookings = 14;
    return Container(
      margin: const EdgeInsets.all(16.0), // Outer margin
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0), // Inner padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.green.withOpacity(0.1),
        //     blurRadius: 10,
        //     spreadRadius: 5,
        //   ),
        //   // A standard shadow for depth
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     blurRadius: 8,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 'start' is RIGHT in RTL
        mainAxisSize: MainAxisSize.min, // Fit the content
        children: [
          // Title
          const Text(
            "اجمالي الحجوزات",
            style: TextStyle(
              fontSize: 18, // Adjusted font size
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
              // fontFamily: 'Cairo', // Uncomment if you have a custom font
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.grey.shade200, thickness: 1),
          const SizedBox(height: 16),

          // Main content: Chart (Left) + Legend (Right)
          Row(
            children: [
              Expanded(
                flex: 5, // Give chart more space
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: 110, // Adjust size
                  initialAngleInDegree: -90, // Start from the top
                  chartType: ChartType.ring,
                  ringStrokeWidth: 22, // Thickness of the ring
                  centerWidget: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "14",
                        style: TextStyle(
                          fontSize: 32, // Large number
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        "حجز",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  legendOptions: const LegendOptions(
                    showLegends: false, // Hide default legend
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false, // Hide values on slices
                  ),
                ),
              ),
              const SizedBox(width: 16), // Spacer between chart and legend

              // Right Side: Legend
              Expanded(
                flex: 4, // Give legend space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LegendItem(
                      count: 5,
                      title: "فعال",
                      color: colorList[0], // Blue
                    ),
                    const SizedBox(height: 16),
                    _LegendItem(
                      count: 8,
                      title: "مكتمل",
                      color: colorList[1], // Green
                    ),
                    const SizedBox(height: 16),
                    _LegendItem(
                      count: 1,
                      title: "ملغي",
                      color: colorList[2], // Red
                    ),
                  ],
                ),
              ),


              // Left Side: Chart

            ],
          ),
        ],
      ),
    );
  }
}

// Helper widget for the legend items
class _LegendItem extends StatelessWidget {
  final int count;
  final String title;
  final Color color;

  const _LegendItem({
    Key? key,
    required this.count,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This Row is inside a Directionality(RTL)
    // Children will be laid out from Right to Left
    return Row(
      children: [
        // 1. The color dot (will be on the far right)
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),

        // 2. The title
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            // fontFamily: 'Cairo', // Uncomment if you have a custom font
          ),
        ),

        const Spacer(), // Pushes title/dot and number apart

        // 3. The number (will be on the far left)
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}