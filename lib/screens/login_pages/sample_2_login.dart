import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/alerts_ui.dart';


class Sample2Login extends StatefulWidget {
  const Sample2Login({super.key});

  @override
  State<Sample2Login> createState() => _Sample2LoginState();
}

class _Sample2LoginState extends State<Sample2Login> {
  final Color _primaryColor = Colors.deepPurple;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,horizontal: 24
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24,),
              Text("Sign In",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,),
              const SizedBox(height: 16,),
              Text("Hi! welcome back, you've been missed",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.center),
          
              const SizedBox(height: 36,),
          
              Text("Email ",
              style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 4,),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
          
                ),
                placeholder: "example.gmail.com",
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16,),
          
              Text("Password ",
                style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 4,),
              CupertinoTextField(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(12)
                ),
                placeholder: "*******",
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
              ),
          
          
              const SizedBox(height: 24,),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},
                      child:  Text("Forgot Password?",
                      style: TextStyle(
                        color: _primaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColor
                      ),))),
          
              const SizedBox(height: 16,),
          
              ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor:_primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
                  child: const Text("Sign In",
          
                  style: TextStyle(
                    color: Colors.white
                  ),),
          
              ),
              const SizedBox(height: 16,),
          
              const Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 16,),
                  Text("Or Sign in with"),
                  SizedBox(width: 16,),
                  Expanded(child: Divider()),
          
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialLoginButton(iconPath: "assets/icons/apple_ic.svg"),
                  socialLoginButton(iconPath: "assets/icons/google_ic.svg"),
                  socialLoginButton(iconPath: "assets/icons/facebook_ic.svg")
                ],
              ),
              const SizedBox(height: 16,),
          
              Align(
                alignment: Alignment.center,
                child: RichText(text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800
                    ),
                    children:[
                      TextSpan(
                        text: " Sign up",
                        style:  TextStyle(
                            color: _primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decorationColor: _primaryColor,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap=(){
                          showNormalSnackBar(context, "Open Sign up page");
                        },
                      )
                    ]
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialLoginButton({required String iconPath}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
         border: Border.all(
           color: Colors.grey.shade300
         )
      ),
      child: SvgPicture.asset(iconPath,
        width: 25,height: 25,),
    );
  }
}
