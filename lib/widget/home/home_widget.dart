import 'package:flutter/material.dart';
import 'package:mobile/core/colors/app_color.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColor.border,
            height: 1,
          ),
        ),
        title: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("MANGA",
                  style: TextStyle(
                    color: AppColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("KYY",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){},
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    Text(
                      "History",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
            )
          ],
        ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Halo"))
            ],
          )
      ),
    );
  }
}
