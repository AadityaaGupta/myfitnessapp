// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';



// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 400,
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                     top: -40,
//                     height: 400,
//                     width: width,
//                     child: FadeInUp(duration: Duration(seconds: 1), child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/images8.jpg'),
//                           fit: BoxFit.fill
//                         )
//                       ),
//                     )),
//                   ),
//                   Positioned(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: FadeInUp(duration: Duration(milliseconds: 1000), child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/images8.jpg'),
//                           fit: BoxFit.fill
//                         )
//                       ),
//                     )),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Login", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),)),
//                   SizedBox(height: 30,),
//                   FadeInUp(duration: Duration(milliseconds: 1700), child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white.withOpacity(1),
//                       border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(196, 135, 198, .3),
//                           blurRadius: 20,
//                           offset: Offset(0, 10),
//                         )
//                       ]
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             border: Border(bottom: BorderSide(
//                               color: Color.fromRGBO(196, 135, 198, .3)
//                             ))
//                           ),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Username",
//                               hintStyle: TextStyle(color: Colors.grey.shade700)
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           child: TextField(
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Password",
//                               hintStyle: TextStyle(color: Colors.grey.shade700)
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//                   SizedBox(height: 20,),
//                   FadeInUp(duration: Duration(milliseconds: 1700), child: Center(child: TextButton(onPressed: () {}, child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),)))),
//                   SizedBox(height: 30,),
//                   FadeInUp(duration: Duration(milliseconds: 1900), child: MaterialButton(
//                     onPressed: () {},
//                     color: Color.fromRGBO(49, 39, 79, 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     height: 50,
//                     child: Center(
//                       child: Text("Login", style: TextStyle(color: Colors.white),),
//                     ),
//                   )),
//                   SizedBox(height: 30,),
//                   FadeInUp(duration: Duration(milliseconds: 2000), child: Center(child: TextButton(onPressed: () {}, child: Text("Create Account", style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),)))),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:myfitnessapp/Utils/theme.dart';
import 'package:myfitnessapp/Widgets/custom_scaffold.dart';
import 'package:myfitnessapp/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          hintText: 'Enter Full Name',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // email
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.facebook_f),
                          Logo(Logos.twitter),
                          Logo(Logos.google),
                          Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
































