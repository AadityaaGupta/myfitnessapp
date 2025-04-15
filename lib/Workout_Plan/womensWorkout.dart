import 'package:flutter/material.dart';
import 'package:myfitnessapp/Widgets/bottom_view_data.dart' show BottomViewData;
import 'package:myfitnessapp/app_assets.dart';

class Womensworkout extends StatefulWidget {
  List<String>? exerciseName;
  String? appBarTitle;
  Womensworkout({super.key, this.exerciseName,this.appBarTitle});

  @override
  State<Womensworkout> createState() => _WomensworkoutState();
}

class _WomensworkoutState extends State<Womensworkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.appBarTitle !=null? widget.appBarTitle! :"Extream Workoute"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(

                  widget.appBarTitle !=null? widget.appBarTitle! :"Extream Workoute",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              ...List.generate(widget.exerciseName!.length, (index) {
                return InkWell(
                  onTap: (){
                    
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage(AppAssets.womensWorkout),
                        fit: BoxFit
                            .cover, // makes sure the image fills the container
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.3), // adds semi-transparent overlay
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.exerciseName![index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheetView(BuildContext context, String workoutType, String day,
      String muscle, String set, int items) {
    print("Reached --------->>>");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 800, //MediaQuery.of(context).size.height * 1.5,
          child: BottomViewData(
            // day: day,
            // muscle: muscle,
            // workoutType: workoutType,
            imgList: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvr9Gq4n2H_YU6Q7txBFQxyY2aq012-SWboA&s"],
            exerciseList: [],
            // set: set,
            items: items,
          ),
        );
      },
    );
  }


}
