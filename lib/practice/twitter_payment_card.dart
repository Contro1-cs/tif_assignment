import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AirBnbChecheckout extends StatefulWidget {
  const AirBnbChecheckout({super.key});

  @override
  State<AirBnbChecheckout> createState() => _AirBnbChecheckoutState();
}

class _AirBnbChecheckoutState extends State<AirBnbChecheckout> {
  @override
  Widget build(BuildContext context) {
    int rent = 390;
    int days = 5;
    int subtotal = 1950;
    int taxPercent = 20;
    int taxAmount = 390;
    int discount = 39;
    int total = 2301;
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //logo, Checkout and close button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("lib/assets/airbnb.svg"),
                        Text(
                          'Checkout',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    //Photo Grid
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 71,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 71,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    //Title
                    Text(
                      'Luxury Private Suit Estate',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$$rent x $days nights',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '\$${rent * days}',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    //Coupon Code
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffE7E7E7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              'Coupon Code',
                              style: GoogleFonts.inter(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              'Apply',
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Divider(
                      color: Colors.grey,
                      height: 30,
                      indent: 5,
                      endIndent: 5,
                    ),

                    //Bill details
                    Column(
                      children: [
                        rowTile('Subtotal', subtotal, false),
                        rowTile('Taxes ($taxPercent%)', taxAmount, false),
                        rowTile('Discount', discount, true),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 30,
                      indent: 5,
                      endIndent: 5,
                    ),
                    //Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$$total',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 30,
                      indent: 5,
                      endIndent: 5,
                    ),

                    //Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Pay Later',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: const Color(0xffE61E4F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Reserve Now',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

rowTile(String title, int num, bool neg) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: GoogleFonts.inter(
          color: const Color(0xffA6A6A6),
          fontSize: 13,
        ),
      ),
      Text(
        neg ? '-\$$num' : '\$$num',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    ],
  );
}
