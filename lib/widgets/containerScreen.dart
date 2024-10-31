// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Containerscreen extends StatelessWidget {
  const Containerscreen();

  @override
  Widget build(BuildContext context) {
    List image = [
      "assets/image/Frame 958.png",
      "assets/image/Frame 959.png",
      "assets/image/Frame 960.png",
      "assets/image/Frame 961.png",
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 150.h,
            left: 40.w,
            right: 40.w,
            child: SizedBox(
              height: 500.h,
              width: 330.w,
              child: Image.asset(
                "assets/image/Rectangle.png",
                height: 500.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 235.h,
            right: 50.w,
            left: 50.w,
            child: Stack(
              children: [
                SizedBox(
                  height: 390.h,
                  width: 290.w,
                  child: Image.asset(
                    "assets/image/Rectangle 2355 (1) 1.png",
                    height: 600.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: SizedBox(
                    height: 350.h,
                    child: GridView.builder(
                      itemCount: image.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 3.h,
                        childAspectRatio: 1/1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.r),
                              child: Image.asset(
                                image[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 250.h,
                  right: 15.w,
                  child: const Text(
                    "CUSTOM",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'chyler'),
                  ),
                ),
                Positioned(
                  top: 280.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      height: 55.h,
                      width: 270.w,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10.r),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.5)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, right: 10.w),
                            child: Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/image/4.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           Positioned(
            top: 110.h,
            left: 170.w,
            right: 150.w,
            child: Stack(
              children: [
                SizedBox(
                  height: 85.h,
                  width: 85.w,
                  child: Image.asset("assets/image/Ellipse 441.png"),
                ),
                Positioned(
                  top: 25.h,
                  left: 8.w,
                  child: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset(
                        "assets/image/pngtree-game-coin-with-crown-picture-image_8288238 2.png"),
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 25.w,
                  child: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset(
                        "assets/image/pngtree-game-coin-with-crown-picture-image_8288238 2.png"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 140.h,
            right: 25.h,
            child: SizedBox(
              height: 40,
              width: 40,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("assets/image/Vector.png")),
            ),
          ),
          Positioned(
            top: 165.h,
            left: 50.h,
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset("assets/image/streamline-emojis_game-dice.png"),
            ),
          ),
          Positioned(
            top: 185,
            left: 75,
            child: SizedBox(
              height: 60,
              width: 60,
              child:
                  Image.asset("assets/image/streamline-emojis_game-dice-1.png"),
            ),
          ),
          Positioned(
            top: 165,
            left: 165,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/image/recharge.png",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
