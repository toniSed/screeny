import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Screeny"),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
            horizontal: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            listItemView(label: "Doomur App ", route: "/doomur"),
            listItemView(label: "FuelCash  App ", route: "/fuelcash"),
            listItemView(label: "Sample 1", route: "/sample1"),
            listItemView(label: "Sample 2 ", route: "/sample2")
          ],
        ),
      ),
    );
  }

  Widget listItemView({required String label, required String route}){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade200
          )
        ),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            Icon(Icons.chevron_right,
            color: Colors.grey.shade500,)
          ],
        ),
      ),
    );
  }
}
