import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/alerts_ui.dart';

class DoomurLogin extends StatefulWidget {
  const DoomurLogin({super.key});

  @override
  State<DoomurLogin> createState() => _DoomurLoginState();
}

class _DoomurLoginState extends State<DoomurLogin> {
  late double screenWidth;
  late double screenHeight;
  Color primaryYellow=const Color(0xffFFC300);
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  // Phone Number Validator
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Password Validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  submitLogin(){
    if (_formKey.currentState!.validate()) {
      // Form is valid, process data
      showNormalSnackBar(context, "Login Successful, open home page");
    }
  }



  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom:0,
            child: Column(
              children: [
                Container(
                  height: screenHeight*0.5,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: primaryYellow,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150)
                    )
                  ),
                ),
              ],
            ),
          ),

          Positioned(
              top: 0,
              left: 16,
              bottom: 0,
              right: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Spacer(),

              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
              ),

              const Text("Welcome back",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35
              ),),

              const Text("Hey! Good to see you again!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ),),

              const Spacer(),

             Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(controller: controllerEmail,
                     cursorColor: Colors.white,
                     validator: _validateEmail,
                     decoration: InputDecoration(
                         icon: CircleAvatar(
                           backgroundColor: Colors.black,
                           child: Icon(
                             CupertinoIcons.person_alt_circle,
                             color: primaryYellow,
                           ),
                         ),

                         label: const Text("Email Address",),
                         labelStyle: const TextStyle(
                             color: Colors.white70
                         ),
                         enabledBorder: const UnderlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.white70
                             )
                         ),
                         focusedBorder: const UnderlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.white
                             )
                         )
                     ),
                     textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.emailAddress,
                     style: TextStyle(
                         color: Colors.white
                     ),
                   ),


                   TextFormField(
                     controller: controllerPassword,
                     cursorColor: Colors.white,
                     validator: _validatePassword,
                     textInputAction: TextInputAction.done,
                     keyboardType: TextInputType.visiblePassword,

                     decoration: InputDecoration(
                         icon: CircleAvatar(
                           backgroundColor: Colors.black,
                           child: Icon(Icons.lock_outline,color: primaryYellow,),
                         ),
                         label: const Text("Password",
                             style: TextStyle(
                                 color: Colors.white70
                             )),
                         enabledBorder: const UnderlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.white70
                             )
                         ),
                         focusedBorder: const UnderlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.white
                             )
                         )

                     ),
                     style: const TextStyle(
                         color: Colors.white
                     ),
                   ),
                 ],
               ),
             ),

              const SizedBox(height: 16,),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child: const Text("Forgot Password?",
                style: TextStyle(
                  color: Colors.white70
                ),)),
              ),

              const SizedBox(height: 16,),

              CupertinoButton(onPressed: (){
                submitLogin();
              },
                borderRadius: BorderRadius.circular(24),
              color: primaryYellow,
                child: const Text("Log In",
              style: TextStyle(
                color: Colors.black
              ),),),

              const Spacer(),
            ],
          ))
        ],
      ),
    );
  }

}
