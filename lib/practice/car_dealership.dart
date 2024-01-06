import 'package:flutter/material.dart';

class CarDealership extends StatefulWidget {
  const CarDealership({super.key});

  @override
  State<CarDealership> createState() => _CarDealershipState();
}

class _CarDealershipState extends State<CarDealership> {
  String descripton =
      'The Porsche 911 GT3 RS is a high-performance sports car known for its track-oriented capabilities. Featuring a lightweight design, rear-wheel drive, and a powerful naturally aspirated flat-six engine, it delivers exhilarating performance. Aerodynamic enhancements, a distinctive rear wing, and precision engineering contribute to its impressive speed, agility, and iconic status.The Porsche 911 GT3 RS is a high-performance sports car known for its track-oriented capabilities. Featuring a lightweight design, rear-wheel drive, and a powerful naturally aspirated flat-six engine, it delivers exhilarating performance. Aerodynamic enhancements, a distinctive rear wing, and precision engineering contribute to its impressive speed, agility, and iconic status.';
  bool maxLine = false;
  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.7),
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              maxChildSize: 0.9,
              initialChildSize: 0.9,
              minChildSize: 0.1,
              builder: (context, scrollController) => ListView(
                controller: scrollController,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      height: 8,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 98),
                                Image.asset('lib/assets/porche.png'),
                                const SizedBox(height: 50),
                                const Text(
                                  'Porche 911 GT3 RS 2023',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Specs',
                                  style: TextStyle(
                                    color: Color(0xff9C9C9C),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      specsTab('Passengers', '2 Seats'),
                                      const SizedBox(width: 8),
                                      specsTab('Range', '500 km'),
                                      const SizedBox(width: 8),
                                      specsTab('0-100km/h', '3.0 sec'),
                                      const SizedBox(width: 8),
                                      specsTab('Mileage', '10.6 km/L'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Specs',
                                  style: TextStyle(
                                    color: Color(0xff9C9C9C),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    maxLine = !maxLine;
                                  }),
                                  child: Text(
                                    descripton,
                                    maxLines: maxLine ? 100 : 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: Color(0xff212025),
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          Image.asset('lib/assets/memoji.png'),
                                    ),
                                    const SizedBox(width: 24),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hosted By',
                                          style: TextStyle(
                                            color: Color(0xff9C9C9C),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'Jon Doe',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 36),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rating',
                                          style: TextStyle(
                                            color: Color(0xff9C9C9C),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 100),
                                
                              ],
                            ),
                            Positioned(
                              bottom: 16,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$699",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Reserve for 1 Day",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Expanded(child: SizedBox(width: 24)),
                                    SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            _openBottomSheet(context);
          },
          child: const Text(
            'Open pannel',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

specsTab(String title, String info) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: const Color(0xff9C9C9C),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff9C9C9C),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
