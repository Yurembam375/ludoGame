import 'package:flutter/material.dart';
import 'package:ludo/widgets/containerScreen.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen();

  @override
  Widget build(BuildContext context) {
    List image = [
      "assets/image/Frame 958.png",
      "assets/image/Frame 959.png",
      "assets/image/Frame 960.png",
      "assets/image/Frame 961.png",
    ];
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Image.asset("assets/image/back.png"),
            Positioned(
              top: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4), // (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset("assets/image/Ellipse 344.png")),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Containerscreen() ; // Show the CustomDialog
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/image/Group 838.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/image/Vector1.png",
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 130,
              left: 150,
              child: Text(
                "RECHARGE",
                style: TextStyle(
                    color: Colors.white, fontSize: 30, fontFamily: 'chyler'),
              ),
            ),
            Positioned(
              top: 190,
              left: 0,
              right: 0, // Ensures full width for the ListView
              child: SizedBox(
                height: 150,
                // width:
                //     MediaQuery.of(context).size.width, // Full width of the screen
                child: ListView.builder(
                  itemCount: image.length, // Use the length of the image list
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ), // White border
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3), // Slight black shadow
                                blurRadius: 5, // Soft shadow spread
                                offset: const Offset(
                                    1, 2), // Light offset for depth
                              ),
                            ],
                          ),
                          child: Image.asset(
                            image[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Positioned(
              top: 370,
              left: 15,
              child: Text(
                "CUSTOM",
                style: TextStyle(
                    color: Colors.white, fontSize: 30, fontFamily: 'chyler'),
              ),
            ),
            Positioned(
              top: 410,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.7), // Background color of the container
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4), // (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        //Use Expanded to let the TextField take available space
                        child: TextField(
                          style: TextStyle(color: Colors.white), // Text color
                          decoration: InputDecoration(
                            border: InputBorder
                                .none, // No border for the text field
                            // hintText: "Enter your text here", // Placeholder text
                            // hintStyle: TextStyle(
                            //     color: Colors.white70), // Hint text style
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    20), // Padding inside the text field
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15,
                            right: 10), // Add some padding to the image
                        child: Container(
                          height:
                              40, // Set the desired height for the rectangular shape
                          width:
                              100, // Set the desired width for the rectangular shape
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Background color, change if needed
                            borderRadius: BorderRadius.circular(
                                5), // Optional: Add slight rounding to corners
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "assets/image/4.png",
                              fit: BoxFit
                                  .fill, // Ensure the image fits within the container
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 510,
              left: 20,
              child: Text(
                "Recharge History",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              top: 560,
              left: 17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date/Time",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontFamily: 'chyler'),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Text(
                    "Amount",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontFamily: 'chyler'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
