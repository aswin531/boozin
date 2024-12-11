class BoozinDataModel {
  final double steps;
  final double bodyFatPercentage;
  final int caloriesBurned;
  final int heartRate;
  final int userId;

  BoozinDataModel(
      {required this.steps,
      required this.bodyFatPercentage,
      required this.caloriesBurned,
      required this.heartRate,
      required this.userId});

  factory BoozinDataModel.fromjson(Map<String, dynamic> json) {
    return BoozinDataModel(
        steps: json['steps'],
        bodyFatPercentage: json['body_fat_percentage'],
        caloriesBurned: json['calories_burned'],
        heartRate: json['heart_rate'],
        userId: json['userid']);
  }
}
