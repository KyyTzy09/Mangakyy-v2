import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';

class ComicBottomSheet extends StatefulWidget {
  const ComicBottomSheet({super.key});

  @override
  State<ComicBottomSheet> createState() => _ComicBottomSheetState();
}

class _ComicBottomSheetState extends State<ComicBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BottomSheet(
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      onClosing: () {},
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          height:
              screenHeight * 0.7, // Set the height to 50% of the screen height
          decoration: BoxDecoration(
            color: AppColor.background.withAlpha(100),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chapter",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Todo: Implement close functionality
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search chapters...',
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: AppColor.border,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 20, // Replace with your actual chapter count
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'Chapter ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
