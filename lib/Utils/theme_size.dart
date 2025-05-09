import 'package:flutter/material.dart';
import 'package:myfitnessapp/Utils/utils.dart';
import 'package:myfitnessapp/dashboard_font_size.dart';
// import 'package:shopify_code/theme/dashboard_font_size.dart';
// import 'package:shopify_code/util/utils.dart';

class ThemeSize {
  static const double paddingLeft = 10;
  static const double paddingRight = 10;
  static const double paddingTop = 10;
  static const double paddingBottom = 10;
  // static const paddingTop = 10;
  // static const paddingBottom = 10;

  static const double marginLeft = 10;
  static const double marginRight = 10;

  // static const marginTop = 10;
  // static const marginBottom = 10;

  // static const double headingFontSize = 20;
  // static const double subHeadingFontSize = 17;
  // static const double descFontSize = 14;

  static double themeBorderRadius = DashboardFontSize.customBorderRadius;
  static const double themeButtonSize = 45;
  static const double themeTextFieldSize = 45;
  static const double themeTextFieldMessageSize = 90;
  static const double themeHeadingFontSize = 16;
  static const double themeFontSize = 12;

  static const double themeElevation = 2;

 static double productGridAspectRatio({required String type,required BuildContext context}) {
    double imageheight = DashboardFontSize.imagetype == "Adapt To Image"
        ? 250
        : DashboardFontSize.imagetype == "Portrait"
            ? 200
            : DashboardFontSize.imagetype == "Square"
                ? 160
                : 0;

    if (type == "Image") return Utils.isTablet(context) ? (imageheight + 150) : (imageheight);

    var currentHeight ;//= imageheight +
    //     (Utils.checkAllRatingReviewPluginEnabled()
    //         ? 115
    //         : 90); //1.58;

            return Utils.isTablet(context) ? (currentHeight + 150) : (currentHeight);
 
  }
}
