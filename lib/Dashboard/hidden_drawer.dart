import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myfitnessapp/Dashboard/HomeScreen.dart';
import 'package:myfitnessapp/Workout_Plan/Workout_for_saturday.dart';
import 'package:myfitnessapp/Workout_Plan/womensWorkout.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_friday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_thursday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_tuesday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_monday.dart';
import 'package:myfitnessapp/Workout_Plan/workout_for_wednesday.dart';
import 'package:myfitnessapp/welcom_screen.dart';
import '../../../globels.dart' as globals;
import '../Workout_Plan/workout_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
    List<String> wMonday = [
    "Chest",
    "Shoulders",
    "Triceps",
    "Abs",
  ];
   List<String> wTuesday = ["Back", "Rear Delts", "Traps", "Biceps", "Abs"];
  List<String> wWednesday = [
    "Quads",
    "Hamstrings",
    "Calves",
    "Abs",
  ];
   List<String> wThursday = [
    "Back",
    "Chest",
    "Shoulders",
    "Byceps",
    "Triceps",
  ];
   List<String> wFriday = [
    "Hamstring",
    "Quads",
    "Calves",
    "Abs",
  ];
   List<String> wSaturday = [
    "Forward Lunge",
    "Bodyweight Squat",
    "Mountain Climber",
    "Running",
    "Burpees",
    "High Kick",
    "Hand Chest Press and Row",
    "Sit-Ups",
    "Bicycle"
  ];
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Workout Plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          WorkoutScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Monday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
        globals.gender=="male"?  WorkoutForMonday():Womensworkout(appBarTitle: "Push Workout",exerciseName:wMonday ,)),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Tuesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
           globals.gender=="male"?  WorkoutForTuesday():Womensworkout(appBarTitle: "Pull Workout",exerciseName:wTuesday ,)),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Wednesday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
           globals.gender=="male"?  WorkoutForWednesday():Womensworkout(appBarTitle: "Legs Workout",exerciseName:wWednesday ,)),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Thursday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
           globals.gender=="male"?  WorkoutForThursday():Womensworkout(appBarTitle: "Upper Body Workout",exerciseName:wThursday ,)),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Friday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
          globals.gender=="male"?  WorkoutForFriday():Womensworkout(appBarTitle: "Lower Body Workout",exerciseName: wFriday,)),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Saturday Workout plan",
              baseStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedStyle: TextStyle()),
           globals.gender=="male"?  WorkoutForSaturday():Womensworkout(appBarTitle: "Cardio",exerciseName:wSaturday ,)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages, backgroundColorMenu: Colors.blueGrey);
  }
}
