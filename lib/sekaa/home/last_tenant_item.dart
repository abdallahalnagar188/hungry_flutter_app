import 'package:flutter/material.dart';

class LastTenantItem extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String? imageAsset; // Path to your local image asset

  const LastTenantItem({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    this.imageAsset, // e.g., 'assets/avatars/fatima.png'
  });

  @override
  Widget build(BuildContext context) {
    // 1. Enforce the exact size requested
    return SizedBox(
      width: 302,
      height: 95,
      // 2. Use Directionality for Right-to-Left (RTL) layout
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // 3. Add padding and margin
          // Use small padding because the space is tight
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

          // 4. Decoration (color, border radius, shadow)
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              // This replicates the green glow effect from the images
              BoxShadow(
                color: Colors.green.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 3,
              ),
              // A standard shadow for depth
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          // 5. Main layout: Row
          child: Row(
            children: [
              // --- Left Side: Avatar ---
              // (This comes first in the Row for RTL)
              CircleAvatar(
                radius: 30, // 60px diameter fits well in 92px height
                backgroundColor: Colors.pink.shade100,
                // Use backgroundImage to load your asset
                backgroundImage: imageAsset != null ? AssetImage(imageAsset!) : null,
                // Fallback icon if no image is provided
                child: (imageAsset == null)
                    ? const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )
                    : null,
              ),

              const SizedBox(width: 12), // Spacer

              // --- Right Side: Text Info ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the right in RTL
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  children: [
                    // Name
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14, // Slightly smaller to fit
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Email
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 13, // Smaller to fit
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6), // Small spacer

                    // Phone and Location Row
                    Row(
                      children: [
                        // Phone
                        const Icon(Icons.phone_outlined, color: Color(0xFF4285F4), size: 15),
                        const SizedBox(width: 3),
                        // Use Flexible to prevent overflow
                        Flexible(
                          child: Text(
                            phone,
                            style: TextStyle(
                              fontSize: 10, // Smallest text
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(width: 8), // Spacer

                        // Location
                        const Icon(Icons.location_on_outlined, color: Color(0xFF4285F4), size: 15),
                        const SizedBox(width: 3),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 10, // Smallest text
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}