import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String subtitle;
  final Color indicatorColor;

  const ReportCard({
    Key? key,
    this.width = 353,
    this.height = 72,
    this.title = 'تأخير في استلام المفاتيح',
    this.subtitle = 'زهرة الوادي للشقق المفروشه • 12/01/2025',
    this.indicatorColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Colored indicator bar
            Positioned(
              right: isRTL ? 1 : null,
              left: isRTL ? null : 1,
              top: 0,
              bottom: 0,
              child: Container(
                width: 10,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: isRTL
                      ? const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  )
                      : const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                ),
              ),
            ),
            // Content container
            Positioned(
              right: isRTL ? 5 : null,
              left: isRTL ? null : 5,
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isRTL
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}