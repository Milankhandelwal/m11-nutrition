import 'package:nutri_genie_app/src/domain/entities/meal_plan.dart';

abstract class MealRepository {
  Future<MealPlan> createMealPlan(MealPlan mealPlan);
  Future<MealPlan> getMealPlan(String id);
  Future<List<MealPlan>> getWeeklyMealPlans(String userId);
  Future<MealPlan> updateMealPlan(MealPlan mealPlan);
  Future<void> deleteMealPlan(String id);
  Future<List<Meal>> searchMeals(String query);
}