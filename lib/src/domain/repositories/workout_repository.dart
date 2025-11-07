import 'package:nutri_genie_app/src/domain/entities/workout_plan.dart';

abstract class WorkoutRepository {
  Future<WorkoutPlan> createWorkoutPlan(WorkoutPlan workoutPlan);
  Future<WorkoutPlan> getWorkoutPlan(String id);
  Future<List<WorkoutPlan>> getWeeklyWorkoutPlans(String userId);
  Future<WorkoutPlan> updateWorkoutPlan(WorkoutPlan workoutPlan);
  Future<void> deleteWorkoutPlan(String id);
  Future<List<Workout>> searchWorkouts(String query);
}