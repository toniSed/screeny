import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screeny/utils/alerts_ui.dart';

class Sample1Login extends StatefulWidget {
  const Sample1Login({super.key});

  @override
  State<Sample1Login> createState() => _Sample1LoginState();
}

class _Sample1LoginState extends State<Sample1Login> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool rememberUserCredentials =false;
  bool passwordIsVisible=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff26283F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
       child: Column(
         children: [
           Expanded(
             child: Align(
               alignment: Alignment.topCenter,
               child: ListView(
                 //reverse: true,
                // physics: const BouncingScrollPhysics(),

                 children: [
                   //const SizedBox(height: 100,),
                   const Text("Log In",style: TextStyle(
                       color: Colors.white,
                     fontSize: 28,
                     fontWeight: FontWeight.w800
                   ),),

                   const SizedBox(height: 38,),

                   TextFormField(
                     controller: _controllerUsername,
                     style: TextStyle(
                       color: Colors.grey.shade300
                     ),
                     cursorColor: Colors.grey.shade400,
                     decoration:  InputDecoration(
                         prefixIcon:  const Icon(Icons.person),
                      prefixIconColor: Colors.grey.shade500,
                      label: const Text("Username"),

                       labelStyle:  TextStyle(
                         color: Colors.grey.shade500,
                         fontWeight: FontWeight.w400,
                         fontSize: 15
                       ),
                       errorBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide:  const BorderSide(
                           color: Colors.red
                         ),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide:  BorderSide(
                           color: Colors.redAccent.withValues(alpha: 0.5),
                         ),
                       ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide: const BorderSide(
                             color: Colors.redAccent,
                           ),
                         ),
                         contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8)
                     ),
                     textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.text,
                     keyboardAppearance: Brightness.dark,
                   ),

                   const SizedBox(height: 16,),

                   TextFormField(
                     style: TextStyle(
                         color: Colors.grey.shade300
                     ),
                     controller: _controllerPassword,
                     cursorColor: Colors.grey.shade400,
                     obscureText: !passwordIsVisible,
                     decoration:  InputDecoration(

                         label: const Text("Password"),
                         labelStyle:  TextStyle(
                             color: Colors.grey.shade500,
                             fontWeight: FontWeight.w400,
                             fontSize: 16
                         ),
                         prefixIcon:  const Icon(Icons.lock),
                         prefixIconColor: Colors.grey.shade500,
                         suffix: GestureDetector(
                               onTap: (){
                                 setState(() {
                                   passwordIsVisible=!passwordIsVisible;
                                 });
                               },
                               child: Text(passwordIsVisible?"Hide":"Show",
                               style: TextStyle(
                                   color: Colors.grey.shade500,
                                 fontSize: 13
                               ),),
                             ),

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:  BorderSide(
                             color: Colors.redAccent.withValues(alpha: 0.5),
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide: const BorderSide(
                             color: Colors.redAccent,
                           ),
                         ),
                       errorBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide:  const BorderSide(
                             color: Colors.red
                         ),
                       ),
                       contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8)
                     ),
                     textInputAction: TextInputAction.done,
                     keyboardType: TextInputType.visiblePassword,
                     keyboardAppearance: Brightness.dark,

                   ),

                   const SizedBox(height: 24,),

                   Row(
                     children: [
                       Expanded(child: Row(
                         children: [
                           Checkbox(
                               value: rememberUserCredentials,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(6),
                                 side: BorderSide(
                                   color: Colors.grey.shade400
                                 )
                               ),
                               checkColor: Colors.redAccent,
                               onChanged: (bool? status){
                                 if(status!=null){
                                   setState(() {
                                     rememberUserCredentials=!rememberUserCredentials;
                                   });
                                 }
                               }),
                           Text("Remember me",
                             style: TextStyle(
                                 color: Colors.grey.shade400,
                                 fontSize: 15
                             ),)
                         ],
                       )),
                       TextButton(onPressed: (){
                         showNormalSnackBar(context, "Open forgot password page");
                       }, child: Text("Forgot Password",
                       style: TextStyle(
                         color: Colors.redAccent
                       ),))


                     ],
                   ),

                   const SizedBox(height: 24,),

                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.redAccent
                       ),
                       onPressed: (){
                     showNormalSnackBar(context, "Login Button tapped");
                   }, child:  const Text("Log in",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.w600
                   ),))

                 ],
               ),
             ),
           ),

           const SizedBox(height: 34,),

           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text("Or Sign in with",
               style: TextStyle(
                 color: Colors.grey.shade200
               ),),

               const SizedBox(height: 16,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 

                   socialLoginButton(iconPath:  "assets/icons/google_ic.svg"),
                   socialLoginButton(iconPath: "assets/icons/apple_ic.svg"),
                   socialLoginButton(iconPath:  "assets/icons/linkedin_ic.svg"),
                   socialLoginButton(iconPath: "assets/icons/twitter_ic.svg"),

                 ],
               ),

               const SizedBox(height: 16,),

               RichText(text: TextSpan(
                 text: "Don't have an account?",
                 style: TextStyle(
                     fontSize: 16,
                   color: Colors.grey.shade400
                 ),
                 children:[
                   TextSpan(
                     text: " Sign up",
                     style: const TextStyle(
                       color: Colors.redAccent,
                       fontSize: 16
                     ),
                     recognizer: TapGestureRecognizer()..onTap=(){
                       showNormalSnackBar(context, "Open Sign up page");
                     },
                   )
                 ]
               ),
               ),
               const SizedBox(height: 16,)
             ],
           )
         ],
       ),
      ),
    );
  }

  Widget socialLoginButton({required String iconPath}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white
      ),
      child: SvgPicture.asset(iconPath,
        width: 25,height: 25,),
    );
  }
}
