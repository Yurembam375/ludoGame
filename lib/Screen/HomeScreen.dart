import 'package:flutter/material.dart';
import 'dart:ui';
// Needed for BackdropFilter
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludo/Screen/GameScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showOverlay() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              // Background blur
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                      // Transparent background
                      ),
                ),
              ),
              // Container with new content
              Center(
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  width: 320.w,
                  height: 389.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 19.h),
                      Container(
                        width: 260.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Text(
                              'My Profile',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xFFEc0000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 100.w),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                // context,
                                // PageRouteBuilder(
                                //   opaque: false, //
                                //   pageBuilder: (BuildContext context, _, __) => Overlayview(),
                                // ),
                                //);
                              },
                              child: Image(
                                height: 40.h,
                                width: 62.w,
                                image:
                                    const AssetImage('assets/image/VIEW.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 290.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Text(
                              'Support',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xFFEc0000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 110.w),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   // PageRouteBuilder(
                                //   //   opaque: false,
                                //   //   pageBuilder: (BuildContext context, _, __) => OverlayPage(),
                                //   // ),
                                // );
                              },
                              child: Image(
                                height: 40.h,
                                width: 62.w,
                                image: const AssetImage(
                                    'assets/image/CONTACT.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 290.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Text(
                              'Vibration',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xFFEc0000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 87.w),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 290.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            Text(
                              'Sound',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xFFEc0000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Image(
                          width: 116,
                          height: 95,
                          image: AssetImage(
                            'assets/image/Group 845 (1).png',
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 35.h, // Adjust this value for the overlap
                left: 10.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 62.w),
                    Image.asset(
                      'assets/image/7.png',
                      width: 140.w,
                      height: 159.h,
                    ),
                    SizedBox(width: 49.w), // Space between the images
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/image/Vector.png',
                        width: 40.w,
                        height: 50.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/image/p7.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Container(
                  height: 55.h,
                  width: 490.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEc0000),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      ClipOval(
                        child: Image.asset(
                          'assets/image/profile.png',
                          height: 60.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 154.w),
                      GestureDetector(
                        onTap: () {
                          //  Navigator.push(
                          //    context,
                          //    PageRouteBuilder(
                          //      opaque: false, //
                          //      pageBuilder: (BuildContext context, _, __) => const Wallet(),
                          //    ),
                          //  );
                        },
                        child: Image(
                          image: const AssetImage('assets/image/top2.png'),
                          width: 70.w,
                          height: 60.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap:
                            _showOverlay, // Trigger the blur effect and new content
                        child: Image.asset(
                          'assets/image/home.png',
                          height: 40.h,
                          width: 40.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Image.asset(
                'assets/image/3.png',
                width: 100.w,
                height: 78.h,
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(18.w),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    padding: EdgeInsets.all(8.w),
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   PageRouteBuilder(
                          //     opaque: false,
                          //     pageBuilder: (BuildContext context, _, __) => Po(),
                          //   ),
                          // );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()),
                          );
                        },
                        child: Image.asset('assets/image/po.png',
                            width: 40.w, height: 50.h),
                      ),
                      Image.asset(
                        'assets/image/pf.png',
                        width: 30.w,
                        height: 50.h,
                      ),
                      Image.asset(
                        'assets/image/bot.png',
                        width: 30.w,
                        height: 50.h,
                      ),
                      Image.asset(
                        'assets/image/bot.png',
                        width: 30.w,
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
