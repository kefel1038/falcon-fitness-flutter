import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int _selectedDay = 0;
  final Set<String> _booked = {'1'};

  final List<Map<String, dynamic>> _classes = [
    {'id': '1', 'title': 'Morning Yoga', 'coach': 'Sarah Johnson', 'time': '08:00 AM', 'category': 'Yoga'},
    {'id': '2', 'title': 'HIIT Blast', 'coach': 'Mike Torres', 'time': '10:00 AM', 'category': 'HIIT'},
    {'id': '3', 'title': 'Strength Training', 'coach': 'Emma Davis', 'time': '02:00 PM', 'category': 'Strength'},
    {'id': '4', 'title': 'Evening Yoga', 'coach': 'Sarah Johnson', 'time': '06:00 PM', 'category': 'Yoga'},
    {'id': '5', 'title': 'Cardio Blast', 'coach': 'Emma Davis', 'time': '04:00 PM', 'category': 'Cardio'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Class Booking',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _days.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => _selectedDay = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: _selectedDay == index
                        ? const Color(0xFFFFE600)
                        : const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      _days[index],
                      style: GoogleFonts.outfit(
                        color: _selectedDay == index ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${_booked.length} Classes Booked',
                  style: GoogleFonts.outfit(color: const Color(0xFFFFE600)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _classes.length,
              itemBuilder: (context, index) {
                final c = _classes[index];
                final isBooked = _booked.contains(c['id']);
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE600).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(LucideIcons.dumbbell, color: Color(0xFFFFE600)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c['title'],
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${c['coach']} • ${c['time']}',
                              style: GoogleFonts.outfit(color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              c['category'],
                              style: GoogleFonts.outfit(
                                color: const Color(0xFFFFE600),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          if (isBooked) {
                            _booked.remove(c['id']);
                          } else {
                            _booked.add(c['id']);
                          }
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isBooked
                              ? Colors.grey
                              : const Color(0xFFFFE600),
                          foregroundColor: isBooked ? Colors.white : Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isBooked ? 'Unbook' : 'Book',
                          style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600),
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
