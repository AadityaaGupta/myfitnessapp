import 'package:flutter/material.dart';
import 'package:myfitnessapp/Workout_Plan/ExerciseView.dart';
import '../../../globels.dart' as globals;
import '../Widgets/bottom_view_data.dart';
import '../app_assets.dart';

class WorkoutForFriday extends StatefulWidget {
  const WorkoutForFriday({super.key});

  @override
  State<WorkoutForFriday> createState() => _WorkoutForFridayState();
}

class _WorkoutForFridayState extends State<WorkoutForFriday> {
  String day = "Friday";
  List<String> img = [
    AppAssets.dumbbellLateralRaise,
    AppAssets.militaryOverheadPress,
    AppAssets.seatedArnoldPressThumb,
    AppAssets.bentOverRearDeltRaise,
    AppAssets.cableFacePull,
    AppAssets.cableLateralRaise
  ];

  List<String> exerciseName = [
    "Dumbbell Lateral Raise",
    "Military Overhead Press",
    "Seated Arnold Press Thumb",
    "Bentover Rear Delt Raise",
    "Cable Face Pull",
    "Cable Lateral Raise"
  ];

  List<String> exerciseName2 = [
    "Hamstring",
    "Quads",
    "Calves",
    "Abs",
  ];

  List<String> img2 = [
    AppAssets.hamstringHelperWorkout,
    AppAssets.weightedSquats,
    AppAssets.seatedCalf,
    AppAssets.abCrunch
  ];

  List<List<String>> subImg = [
    [
      AppAssets.romanDeadlift,
      AppAssets.nordicCurls,
      AppAssets.stiffLegDeadlift,
    ],
    [AppAssets.frontSquats, AppAssets.stepUps],
    [
      AppAssets.standingCalfRaises,
      AppAssets.donkeyCalfRaises,
    ],
    [
      AppAssets.hangingLegRaise,
      AppAssets.cableWoodchoppers,
    ],
  ];

  List<List<String>> subExercise = [
    ["Romanian Deadlifts", "Nordic Curls", "Stiff-Leg Deadlifts"],
    ["Front Squats", "Step Ups"],
    ["Standing Calf Raises", "Donkey Calf Raises"],
    ["Hanging Leg Raises", "Cable Woodchoppers"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: globals.gender == "male"
            ? Container(
                height: MediaQuery.of(context).size.height,
                // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("clicked --------->>>");

                          bottomSheetView(context, "Shoulder Workout", day,
                              "Shoulder", "5 set 12 reps", 6);
                        },
                        child: textOnImageWidget(
                            height: 180,
                            width: 450,
                            text: "Single Muscle",
                            image: "https://i0.wp.com/www.muscleandfitness.com/wp-content/uploads/2015/08/main_frontsquat.jpg?w=1188&h=630&crop=1&quality=86&strip=all"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exerciseview(
                                    imgList: img2,
                                    exerciseList: exerciseName2,
                                    items: 4,
                                    workoutType: "Lower Workout",
                                    subExercise: subExercise,
                                    set: "5 set 12 reps",
                                    subImg: subImg,
                                  )));
                        },
                        child: textOnImageWidget(
                            height: 180,
                            width: 450,
                            text: "Extreme Workout",
                            image: "https://i0.wp.com/www.muscleandfitness.com/wp-content/uploads/2015/08/main_frontsquat.jpg?w=1188&h=630&crop=1&quality=86&strip=all"),
                      ),
                     
                    ],
                  ),
                ))
            : Container());
  }

  Widget textOnImageWidget(
      {String text = "Text On Image",
      double height = 250,
      double width = 400,
      String image = AppAssets.img2}) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, //width: 1
              ),
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: image.contains("https")?NetworkImage(image):AssetImage(image), fit: BoxFit.cover)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  void bottomSheetView(BuildContext context, String workoutType, String day,
      String muscle, String set, int items) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomViewData(
          day: day,
          muscle: muscle,
          workoutType: workoutType,
          imgList: img,
          exerciseList: exerciseName,
          set: set,
          items: items,
        );
      },
    );
  }
}
