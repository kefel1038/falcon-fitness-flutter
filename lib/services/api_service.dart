import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';

class ApiService {
  static const String _userKey = 'falcon_user';

  static Future<Map<String, dynamic>?> getStoredUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString(_userKey);
    if (userStr != null) {
      return jsonDecode(userStr);
    }
    return null;
  }

  static Future<void> storeUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user));
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  static Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final mockUsers = [
      {
        'name': 'Admin User',
        'email': 'admin@falcon.com',
        'password': 'admin123',
        'role': 'admin',
        'membership': 'Admin',
      },
      {
        'name': 'Gold Member',
        'email': 'gold@falcon.com',
        'password': 'gold123',
        'role': 'user',
        'membership': 'Gold',
      },
      {
        'name': 'Silver Member',
        'email': 'silver@falcon.com',
        'password': 'silver123',
        'role': 'user',
        'membership': 'Silver',
      },
    ];

    final user = mockUsers.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      await storeUser(user);
      return user;
    }
    return null;
  }

  static Map<String, dynamic> getDashboardData(String membership) {
    return {
      'stats': {
        'membershipType': membership,
        'expiryDate': '2026-12-31',
        'status': 'Active',
      },
      'classes': [
        {'id': '1', 'title': 'Morning Yoga', 'coach': 'Sarah Johnson', 'time': '08:00 AM'},
        {'id': '2', 'title': 'HIIT Blast', 'coach': 'Mike Torres', 'time': '10:00 AM'},
        {'id': '3', 'title': 'Strength Training', 'coach': 'Emma Davis', 'time': '02:00 PM'},
      ],
    };
  }

  static List<Map<String, dynamic>> getBranches() {
    return [
      {'id': '1', 'name': 'Falcon Matar Qadeem', 'address': 'Matar Qadeem, Qatar', 'rating': 4.9, 'distance': '2.5 km'},
      {'id': '2', 'name': 'Falcon Abu Hamour', 'address': 'Abu Hamour, Qatar', 'rating': 4.8, 'distance': '5.1 km'},
      {'id': '3', 'name': 'Falcon Al Wakrah', 'address': 'Al Wakrah, Qatar', 'rating': 4.7, 'distance': '8.3 km'},
    ];
  }

  static List<Map<String, dynamic>> getPrograms() {
    return [
      {'id': '1', 'title': 'Strength Builder', 'category': 'Strength', 'duration': '45 min', 'intensity': 'High', 'coach': 'Mike Torres', 'image': ''},
      {'id': '2', 'title': 'Yoga Flow', 'category': 'Yoga', 'duration': '60 min', 'intensity': 'Low', 'coach': 'Sarah Johnson', 'image': ''},
      {'id': '3', 'title': 'Cardio Blast', 'category': 'Cardio', 'duration': '30 min', 'intensity': 'Medium', 'coach': 'Emma Davis', 'image': ''},
      {'id': '4', 'title': 'HIIT Challenge', 'category': 'HIIT', 'duration': '40 min', 'intensity': 'High', 'coach': 'Mike Torres', 'image': ''},
    ];
  }

  static List<Map<String, dynamic>> getTrainers() {
    return [
      {'id': '1', 'name': 'Mike Torres', 'specialty': 'Strength & Conditioning', 'rating': 4.9, 'image': ''},
      {'id': '2', 'name': 'Sarah Johnson', 'specialty': 'Yoga & Flexibility', 'rating': 4.8, 'image': ''},
      {'id': '3', 'name': 'Emma Davis', 'specialty': 'Cardio & Weight Loss', 'rating': 4.7, 'image': ''},
    ];
  }
}
