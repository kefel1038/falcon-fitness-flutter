import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'type': 'reminder',
        'title': 'Class Reminder',
        'message': 'Yoga class starts in 1 hour',
        'time': '10:00 AM',
        'color': const Color(0xFFFFE600),
      },
      {
        'type': 'offer',
        'title': 'Special Offer',
        'message': '50% off on Personal Training this week!',
        'time': 'Yesterday',
        'color': Colors.green,
      },
      {
        'type': 'update',
        'title': 'New Branch',
        'message': 'Falcon Al Wakrah is now open!',
        'time': '2 days ago',
        'color': Colors.blue,
      },
    ];

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Notifications',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final n = notifications[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: (n['color'] as Color).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          n['type'] == 'reminder'
                              ? LucideIcons.bell
                              : n['type'] == 'offer'
                                  ? LucideIcons.gift
                                  : LucideIcons.info,
                          color: n['color'] as Color,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              n['title'] as String,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              n['message'] as String,
                              style: GoogleFonts.outfit(color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              n['time'] as String,
                              style: GoogleFonts.outfit(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
