import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  String teamSize = '5 Members';

  //Content
  int offer = 33;

  @override
  Widget build(BuildContext context) {
    int price = teamSelect ? 499 : 249;
    bool team = teamSelect;

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

          //Choose the plan
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
          const SizedBox(height: 12),
          //info
          teamSelect
              ? Container(
                  width: w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset("lib/assets/confetti.svg"),
                                  Text(
                                    '$offer% off',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xff864EEC),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$$price',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'yearly',
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: teamSelect,
                            child: Column(
                              children: [
                                Text(
                                  'What\'s your team size?',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                CustomDropDown(
                                  items: const [
                                    '5 Members',
                                    '10 Members',
                                    '15 Members',
                                    '20 Members'
                                  ],
                                  selectedItem: teamSize,
                                  onItemSelected: (value) {
                                    setState(() {
                                      teamSize = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          Expanded(
                            child: Column(
                              children: [
                                featureList('Share Projects'),
                                featureList('Isolate built\n& deployments'),
                                featureList('Additional Roles'),
                                featureList('High-Performance\nEdge Network'),
                                featureList('SMAL SSO'),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: w,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff824AF5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Get Started ->',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset("lib/assets/confetti.svg"),
                                    Text(
                                      '$offer% off',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xff864EEC),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$$price',
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  'yearly',
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 12),
                                    featureList('Share Projects'),
                                    featureList('Isolate built\n& deployments'),
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: w,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff824AF5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Get Started ->',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 25),
          Text(
            'Questions?',
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?>? onItemSelected;

  const CustomDropDown({
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectedItem,
          onChanged: widget.onItemSelected,
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}

featureList(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        SvgPicture.asset('lib/assets/check.svg'),
        const SizedBox(width: 8),
        Text(
          title,
          softWrap: true,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 10,
          ),
        )
      ],
    ),
  );
}
