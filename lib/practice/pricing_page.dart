import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  bool teamSelect = false;
  Color bgColor = const Color(0xffF5F5F5);
  int animationDuration = 300;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 75,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xffF69797),
                      Color(0xffDEBDF5),
                      Color(0xff92ACF8),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      bgColor.withOpacity(0),
                      bgColor,
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Pricing',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            'Choose a plan',
            style: GoogleFonts.inter(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 110,
            width: w,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xffe1e1e1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 110,
                      width: w / 2 - 13,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff6EA6F4),
                            Color(0xffAA67ED),
                            Color(0xffF6A25B),
                          ],
                        ),
                      ),
                      child: Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )),
                    )
                        .animate(target: teamSelect ? 50 : 0)
                        .moveX(begin: 0, end: w / 2 - 16),
                  ],
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    teamSelect = !teamSelect;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.person_outline),
                            Text(
                              'Individual',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Best for freelancers',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.people_outline),
                            Text(
                              'Team collab',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Best for agencies',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
