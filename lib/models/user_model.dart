class UserModel {
  final String name;
  final String email;
  final String role;
  final String membership;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.membership,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      role: json['role'],
      membership: json['membership'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
        'membership': membership,
      };
}

class UserStats {
  final String membershipType;
  final String expiryDate;
  final String status;

  UserStats({
    required this.membershipType,
    required this.expiryDate,
    required this.status,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) => UserStats(
        membershipType: json['membershipType'],
        expiryDate: json['expiryDate'],
        status: json['status'],
      );
}

class GymClass {
  final String id;
  final String title;
  final String coach;
  final String time;
  final String? image;

  GymClass({
    required this.id,
    required this.title,
    required this.coach,
    required this.time,
    this.image,
  });

  factory GymClass.fromJson(Map<String, dynamic> json) => GymClass(
        id: json['id'],
        title: json['title'],
        coach: json['coach'],
        time: json['time'],
        image: json['image'],
      );
}

class WorkoutProgram {
  final String id;
  final String title;
  final String category;
  final String duration;
  final String intensity;
  final String coach;
  final String image;

  WorkoutProgram({
    required this.id,
    required this.title,
    required this.category,
    required this.duration,
    required this.intensity,
    required this.coach,
    required this.image,
  });

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) => WorkoutProgram(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        duration: json['duration'],
        intensity: json['intensity'],
        coach: json['coach'],
        image: json['image'],
      );
}

class Trainer {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final String image;

  Trainer({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.image,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json['id'],
        name: json['name'],
        specialty: json['specialty'],
        rating: json['rating'],
        image: json['image'],
      );
}

class Branch {
  final String id;
  final String name;
  final String address;
  final double rating;
  final String distance;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.distance,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        rating: json['rating'],
        distance: json['distance'],
      );
}
