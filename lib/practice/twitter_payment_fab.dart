import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentFab extends StatefulWidget {
  const PaymentFab({super.key});

  @override
  State<PaymentFab> createState() => _PaymentFabState();
}

class _PaymentFabState extends State<PaymentFab> {
  String name = 'Chase';
  String formattedamount = NumberFormat('#,###').format(7021);
  String discount = '12.99';
  bool isBoxVisible = false;
  int animationDuration = 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double contH = isBoxVisible ? 300 : 0;
    double contW = isBoxVisible ? 200 : 0;

    return Scaffold(
      body: Stack(
        children: [
          // Other widgets in the background
          Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffFED9FF), Color(0xffFFC47E)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),

                //Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "lib/assets/sunrise.svg",
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'San Francisco',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Good Morning,\n$name',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1,
                    height: 1,
                    color: const Color(0xff303030),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Checking',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\$$formattedamount',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.black.withOpacity(0.1),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Card Details',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 70),

                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset("lib/assets/uber.svg"),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Uber',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Text(
                            '\$$discount',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: animationDuration),
            height: h,
            width: w,
            color: isBoxVisible
                ? Colors.black.withOpacity(0.5)
                : Colors.black.withOpacity(0),
          ),
          // Pop Out Box
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: animationDuration),
            bottom: isBoxVisible ? 30 : 60,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: animationDuration),
              margin: isBoxVisible
                  ? const EdgeInsets.symmetric(horizontal: 30)
                  : const EdgeInsets.symmetric(horizontal: 250),
              decoration: BoxDecoration(
                color:
                    isBoxVisible ? Colors.white : Colors.white.withOpacity(0),
                borderRadius: BorderRadius.circular(22),
              ),
              height: contH,
              width: contW,
              child: Column(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: animationDuration),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: isBoxVisible
                          ? GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              children: [
                                AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: animationDuration,
                                  ),
                                  height: isBoxVisible ? double.infinity : 0,
                                  width: isBoxVisible ? double.infinity : 0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                  ),
                  // AnimatedContainer(
                  //   duration: Duration(milliseconds: animationDuration),
                  //   height: 50,
                  //   margin: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                  //   child: isBoxVisible
                  //       ? Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //               height: 30,
                  //               width: 30,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(1000),
                  //                 color: Colors.grey.withOpacity(0.2),
                  //               ),
                  //               padding: const EdgeInsets.all(8),
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(1000),
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               height: 30,
                  //               width: 30,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(1000),
                  //                 color: Colors.grey.withOpacity(0.2),
                  //               ),
                  //               padding: const EdgeInsets.all(8),
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(1000),
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       : const SizedBox(),
                  // ),
                ],
              ),
            ),
          ),

          // Icon Button
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: animationDuration),
            bottom: isBoxVisible ? 40 : 80,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: animationDuration),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isBoxVisible ? Colors.black : const Color(0xffC39B73),
                ),
                child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      isBoxVisible = !isBoxVisible;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ).animate(target: isBoxVisible ? 0.5 : 0).rotate(
                        duration:
                            Duration(milliseconds: animationDuration + 200),
                        end: 0.25,
                        begin: 0,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
