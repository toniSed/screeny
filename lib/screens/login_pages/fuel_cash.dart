import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screeny/utils/alerts_ui.dart';

class FuelCashLogin extends StatefulWidget {
  const FuelCashLogin({super.key});

  @override
  State<FuelCashLogin> createState() => _FuelCashLoginState();
}

class _FuelCashLoginState extends State<FuelCashLogin> with TickerProviderStateMixin{
  late double screenWidth;
  late double screenHeight;
  Color primaryYellow=const Color(0xffFFC300);
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late TabController _tabController;
  bool _passwordIsVisible=true;




  @override
  void initState() {
    super.initState();
    _tabController=  TabController(length: 2, vsync: this);
  }

  updatePasswordVisibility(){
    setState(() {
      _passwordIsVisible = !_passwordIsVisible;
    });
  }


  submitLogin(){
      showNormalSnackBar(context, "Login Successful, open home page");

  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: GestureDetector(
        onTap: (){
          //tap the screen to hide the keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [

            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      height: screenHeight*0.47,
                      decoration: BoxDecoration(
                        color:primaryYellow
                      ),
                    )
                  ],
                )
            ),



           Positioned(
               top: 100,
               bottom: 0,
               left: 0,
               right: 0,
               child: ListView(
                 physics: const BouncingScrollPhysics(),
                 padding: const EdgeInsets.all(16.0),
                 children: [

                   const CircleAvatar(
                     radius: 50,
                     backgroundColor: Colors.black,
                   ),

                   Text("Fuel Cash",
                   textAlign: TextAlign.center,
                   style: Theme.of(context).textTheme.headlineLarge,),

                   const SizedBox(height: 64,),

                   Text("Login to Continue",
                   textAlign: TextAlign.center,
                   style: Theme.of(context).textTheme.bodyMedium,),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 0,vertical: 16
                     ),
                     child: Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.stretch,
                           children: [

                             loginTabbedView(),
                             
                             
                             Align(
                               alignment: Alignment.centerRight,
                               child: TextButton(
                                   onPressed: (){
                                     showNormalSnackBar(context, "Run Login");
                                   },
                                   child: const Text("Forgot Password?",
                                   style: TextStyle(
                                     color: Colors.blueAccent
                                   ),)),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                    const SizedBox(height: 16,),
                   CupertinoButton(
                       color: Colors.black,
                       child: Text("Login",
                       style: TextStyle(
                         color: primaryYellow
                       ),),
                       onPressed: (){
                         submitLogin();
                       }),

                   const SizedBox(height: 12,),

                   Align(
                     alignment: Alignment.center,
                     child: RichText(
                       text: TextSpan(
                         text: "Don't have an account? ",
                         style: Theme.of(context).textTheme.bodyMedium,
                         children:  [

                           TextSpan(
                             recognizer: TapGestureRecognizer()..onTap=(){
                               //navigate to sign up page
                               showNormalSnackBar(context, "Open Sign up page");
                             },
                             text: "Create one now!",
                             style: TextStyle(
                               color: Colors.blueAccent
                             ),

                           )
                         ]
                     ),),
                   )

                 ],
               ))
          ],
        ),
      ),
    );
  }
  
  Widget loginTabbedView(){
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8)
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            automaticIndicatorColorAdjustment:false,
            dividerColor: Colors.transparent,
            labelColor: primaryYellow,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            enableFeedback: true,
            tabs: const [
          Tab(
            text: "User Login",
          ),
              Tab(
                text: "Admin Login",
              ),
        ]),

        const SizedBox(height: 16,),

        SizedBox(
          height: screenHeight*0.13,
          child: TabBarView(
              controller: _tabController,
              children: [
            loginFields(),
            loginFields(),
          ]),
        )
      ],
    );
  }

  Widget loginFields(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoTextField(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8)
            ),
            prefix: const Icon(CupertinoIcons.phone),
            placeholder: "Phone Number",
            placeholderStyle: Theme.of(context).textTheme.bodyMedium,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            maxLines: 1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            controller: _controllerPhone,
          ),

          const SizedBox(height: 12,),

          CupertinoTextField(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8)
            ),
            controller: _controllerPassword,
            prefix: const Icon(Icons.lock_open),
            placeholder: "Password",
            placeholderStyle: Theme.of(context).textTheme.bodyMedium,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            maxLines: 1,
            obscureText: _passwordIsVisible,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            suffix: GestureDetector(
              onTap: (){
                updatePasswordVisibility();
              },
              child: Icon(
                _passwordIsVisible?Icons.visibility:Icons.visibility_off
              ),
            ),

          ),

        ],
      ),
    );
  }
}
