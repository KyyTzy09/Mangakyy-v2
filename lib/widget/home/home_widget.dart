import 'dart:ui';

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
  // always marked "final".];

  @override
  Widget build(BuildContext context) {
    final mangaList = [
      {
        "title": "ITSUKA KOTORI",
        "image": "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg"
      },
      {
        "title": "KOTORI ITSUKA",
        "image": "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg"
      },
      {
        "title": "ITSUKA KOTORI",
        "image": "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg"
      },
      {
        "title": "KOTORI",
        "image": "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg"
      },
    ];

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
              Container(
                width: double.infinity,
                height: 180,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Image.network(
                            "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg",
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Row(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://i.pinimg.com/1200x/8b/d1/5e/8bd15ec170b7fd09d58fd8236a9feb97.jpg",
                              width: 100,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Text(
                                    "ITSUKA KOTORI",
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Ini adalah my wife woi, tolong jangan di klaim!!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: AppColor.border,
                                          ),
                                        ),
                                        child: Text(
                                          "Action",
                                          style: TextStyle(
                                            color: AppColor.text,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ]
                                  )
                                ],
                              )
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: mangaList.length,
                  itemBuilder: (context, index) {
                    final manga = mangaList[index];

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColor.card,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.border,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network( manga["image"].toString(),
                                  height: 250,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                            ),
                          )),
                          SizedBox(height: 5),
                          Text(
                            manga["title"].toString(),
                            style: TextStyle(
                              color: AppColor.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          )
      ),
    );
  }
}
