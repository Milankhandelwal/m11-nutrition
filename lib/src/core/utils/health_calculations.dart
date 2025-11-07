class HealthCalculations {
  /// Calculate Body Mass Index (BMI)
  static double calculateBMI(double weightKg, double heightCm) {
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  /// Get BMI category based on BMI value
  static String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  /// Calculate Basal Metabolic Rate (BMR) using Mifflin-St Jeor Equation
  static double calculateBMR(double weightKg, double heightCm, int age, String gender) {
    // Mifflin-St Jeor Equation:
    // For men: BMR = 10*weight + 6.25*height - 5*age + 5
    // For women: BMR = 10*weight + 6.25*height - 5*age - 161
    if (gender.toLowerCase() == 'male') {
      return (10 * weightKg) + (6.25 * heightCm) - (5 * age) + 5;
    } else {
      return (10 * weightKg) + (6.25 * heightCm) - (5 * age) - 161;
    }
  }

  /// Calculate Total Daily Energy Expenditure (TDEE)
  static double calculateTDEE(double bmr, String activityLevel) {
    final activityMultiplier = _getActivityMultiplier(activityLevel);
    return bmr * activityMultiplier;
  }

  /// Get activity multiplier based on activity level
  static double _getActivityMultiplier(String activityLevel) {
    switch (activityLevel.toLowerCase()) {
      case 'sedentary':
        return 1.2; // Little or no exercise
      case 'light':
        return 1.375; // Light exercise/sports 1-3 days/week
      case 'moderate':
        return 1.55; // Moderate exercise/sports 3-5 days/week
      case 'active':
        return 1.725; // Hard exercise/sports 6-7 days/week
      case 'veryactive':
        return 1.9; // Very hard exercise/physical job
      default:
        return 1.2; // Default to sedentary
    }
  }

  /// Calculate macronutrient distribution based on fitness goal
  static Map<String, int> calculateMacros(
    double tdee,
    String fitnessGoal,
    double weightKg,
  ) {
    switch (fitnessGoal.toLowerCase()) {
      case 'muscle gain':
        // Higher protein, moderate carbs, moderate fat
        final protein = (weightKg * 2.2).round(); // 2.2g per kg of body weight
        final fat = (tdee * 0.25 / 9).round(); // 25% of calories from fat
        final carbs = ((tdee - (protein * 4) - (fat * 9)) / 4).round();
        return {
          'protein': protein,
          'carbs': carbs > 0 ? carbs : 0,
          'fat': fat,
        };
      case 'fat loss':
        // Higher protein, lower carbs, moderate fat
        final protein = (weightKg * 2.5).round(); // 2.5g per kg of body weight
        final fat = (tdee * 0.30 / 9).round(); // 30% of calories from fat
        final carbs = ((tdee - (protein * 4) - (fat * 9)) / 4).round();
        return {
          'protein': protein,
          'carbs': carbs > 0 ? carbs : 0,
          'fat': fat,
        };
      case 'maintenance':
      default:
        // Balanced macros
        final protein = (weightKg * 2.0).round(); // 2.0g per kg of body weight
        final fat = (tdee * 0.30 / 9).round(); // 30% of calories from fat
        final carbs = ((tdee - (protein * 4) - (fat * 9)) / 4).round();
        return {
          'protein': protein,
          'carbs': carbs > 0 ? carbs : 0,
          'fat': fat,
        };
    }
  }
}