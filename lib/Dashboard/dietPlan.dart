import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' show Html;
import 'package:myfitnessapp/app_assets.dart';

class DietPlan extends StatefulWidget {
  String goal;
  String mealType;
  DietPlan({super.key, this.goal = "muscle Gain", this.mealType = "veg"});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  // String dietPlan = widget.goal=="weightGain"&&widget.mealType=="veg"?;
  @override
  Widget build(BuildContext context) {
    widget.goal= widget.goal ==
                                                'Weight Loss'
                                            ? "weightLoss"
                                            :  widget.goal == 'Weight Gain'
                                                ? "weightGain"
                                                :  widget.goal == 'Muscle Gain'
                                                    ? "muscleGain"
                                                    : "weightLoss";
    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Plan"),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop(true);
        }, 
        icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Html(
            data:
            widget.goal == "weightGain" && widget.mealType == "Vegetarian"
                ? AppAssets.weightGainVeg
                : widget.goal == "weightLoss" && widget.mealType == "Vegetarian"
                    ? AppAssets.weightLossVeg
                    : widget.goal == "muscleGain" &&
                            widget.mealType == "Vegetarian"
                        ? AppAssets.muscleGainVeg
                        : widget.goal == "weightGain" &&
                                widget.mealType == "Non-Vegetarian"
                            ? AppAssets.weightGainNonVeg
                            : widget.goal == "weightLoss" &&
                                    widget.mealType == "Non-Vegetarian"
                                ? AppAssets.weightLossNonVeg
                                : widget.goal == "muscleGain" &&
                                        widget.mealType == "Non-Vegetarian"
                                    ? AppAssets.muscleGainNonVeg
                                    : widget.goal == "weightGain" &&
                                            widget.mealType == "Vegan"
                                        ? AppAssets.weightGainVegan
                                        : widget.goal == "weightLoss" &&
                                                widget.mealType == "Vegan"
                                            ? AppAssets.weightLossVegan
                                            : widget.goal == "muscleGain" &&
                                                    widget.mealType == "Vegan"
                                                ? AppAssets.muscleGainVegan
                                                : AppAssets.weightGainVeg,
            // style: TextStyle(
            //   fontSize: 15,
            // ),
          ),
        ),
      ),
    );
  }
}
