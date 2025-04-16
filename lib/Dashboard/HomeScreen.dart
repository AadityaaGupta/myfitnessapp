import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfitnessapp/Dashboard/collection_view.dart';
import 'package:myfitnessapp/Dashboard/dietPlan.dart';
import 'package:myfitnessapp/Dashboard/slider.dart';
import 'package:myfitnessapp/Models/simple_slider.dart';
import 'package:myfitnessapp/Widgets/customButton.dart';
import 'package:myfitnessapp/Widgets/image_view.dart';
import 'package:myfitnessapp/app_assets.dart';

class Homescreen {
  SimpleImageSliderData? data;

  List<String> slidImage = [
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt7JyQyaC5y_3jnKq4_Xc7m9fRUFwxFx-SIZo2Y27GB0zLxvZd7qdMSW_lF-poNXhQA6A&usqp=CAU",
    "https://i0.wp.com/www.muscleandfitness.com/wp-content/uploads/2018/11/Group-Fitness-Class-Performing-A-Variety-Of-Exercises-1.jpg?quality=86&strip=all",
    AppAssets.slider2,
   "https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/k/g/d/large-gym-exercise-workout-wall-poster-self-adhesive-poster-original-imah96rbwtnyvema.jpeg?q=90&crop=false"
  ];

  loadImage() {
    List<SimpleImageSlider> images = List.generate(4, (index) {
      return SimpleImageSlider(imageSrc: slidImage[index]);
    });

    data = SimpleImageSliderData(height: 350, simpleImageSlider: images);
  }

  @override
  Widget homeWidget(BuildContext context) {
    loadImage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                SliderImage(data!),
                CollectionView("Recommended Products"),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Get Your Diet Plan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {
                      showDialogueForDiedPlan(context);
                    },
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ImageView(
                          fit: BoxFit.cover,
                      
                          AppAssets.dietPlanImg,
                      
                          // height: MediaQuery.of(context).size.height * 0.35,
                          // width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 70,
                )
              ],
            )),
      ),
    );
  }

  showDialogueForDiedPlan(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedGoal = 'Weight Loss';
        String selectedMealType = 'Vegetarian';

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: 
                LayoutBuilder(
            builder: (context, constraints) {
             return   SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Get Diet Plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                  child: Icon(Icons.cancel),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Goal"),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    value: selectedGoal,
                                    items: [
                                      'Weight Loss',
                                      'Weight Gain',
                                      'Muscle Gain',
                                    ]
                                        .map((goal) => DropdownMenuItem(
                                              value: goal,
                                              child: Text(goal),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGoal = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text("Meal Type"),
                                  SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    
                                    value: selectedMealType,
                                    items: [
                                      'Vegetarian',
                                      'Vegan',
                                      'Non-Vegetarian',
                                    ]
                                        .map((meal) => DropdownMenuItem(
                                              value: meal,
                                              child: Text(meal),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMealType = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  CustomButton(
                                    () async{
                                        // Call your method using selectedGoal and selectedMealType
                                        print("Goal: $selectedGoal");
                                        print("Meal Type: $selectedMealType");

                                        bool goBack = await (Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => DietPlan(
                                                      goal: selectedGoal,
                                                      mealType:
                                                          selectedMealType,
                                                    )))) as bool;
                                        if (goBack) {
                                          print("Under the if condition");

                                           Navigator.of(context).pop();
                                        }
                                      },
                                     "Get Diet Plan"),

                                  
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                
          },),
                
                );
          
          
          },
        );
      },
    );
  }
}
