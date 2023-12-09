import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/widgets/colors.dart';

class EventsDetails extends StatefulWidget {
  const EventsDetails({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  bool _bookmark = false;
  //fetch data from API

  Future<Map<String, dynamic>> fetchEventData() async {
    var url = Uri.parse(
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event/${widget.id}");
    var httpClient = HttpClient();

    try {
      var request = await httpClient.getUrl(url);
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        Map<String, dynamic> jsonMap = json.decode(responseBody);

        // Check if the 'content' and 'data' keys exist in the JSON response
        if (jsonMap.containsKey('content') &&
            jsonMap['content'].containsKey('data')) {
          Map<String, dynamic> dataList = jsonMap['content']['data'];
          return dataList;
        } else {
          // Handle missing keys
          print("Error: Missing 'content' or 'data' keys in the JSON response");
        }
      } else {
        // Handles errors
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handles exceptions
      print("Exception: $e");
    } finally {
      httpClient.close();
    }
    return {};
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchEventData(),
      builder: (context, snapshot) {
        Map<String, dynamic> eventData = snapshot.data as Map<String, dynamic>;

        //Data
        String coverPhoto = eventData["banner_image"];
        String title = eventData["title"];
        String description = eventData["description"];
        String organiserIcon = eventData["organiser_icon"];
        String venueName = eventData["venue_name"];
        String address =
            "${eventData["venue_city"]}, ${eventData["venue_country"]}";
        String orgName = eventData["organiser_name"];

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Stack(
            children: [
              //Body
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Cover
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: coverPhoto,
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: SafeArea(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                                const SizedBox(width: 10),
                                Text(
                                  "Event Details",
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                IconButton(
                                  onPressed: () {
                                    setState(() => _bookmark = !_bookmark);
                                  },
                                  icon: _bookmark
                                      ? SvgPicture.asset(
                                          "lib/assets/bookmark_filled.svg",
                                          height: 40,
                                          width: 40,
                                        )
                                      : SvgPicture.asset(
                                          "lib/assets/bookmark_outlined.svg",
                                          height: 40,
                                          width: 40,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 19),
                          organizerTile(organiserIcon, orgName),
                          const SizedBox(height: 19),
                          dateTimeTile(),
                          const SizedBox(height: 19),
                          locationTile(venueName, address),
                          const SizedBox(height: 32),
                          Text(
                            "About Event",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: typographyTitle,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: typographyTitle,
                            ),
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Book now button
              Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.white, Colors.white10],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        // : const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.fromLTRB(52, 0, 52, 10),
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 25),
                              Text(
                                "BOOK NOW",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SvgPicture.asset("lib/assets/arrow_forward.svg"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}

organizerTile(String organiserIcon, String orgName) {
  return Row(
    children: [
      //Icon
      Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: organiserIcon.endsWith(".svg")
              ? SvgPicture.network(
                  organiserIcon,
                  placeholderBuilder: (context) => const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 0.5,
                    ),
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: organiserIcon,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
      const SizedBox(width: 10),

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orgName,
            style:
                GoogleFonts.inter(fontSize: 15, color: const Color(0xff0D0C26)),
          ),
          Text(
            "Organizer",
            style:
                GoogleFonts.inter(fontSize: 12, color: const Color(0xff706E8F)),
          ),
        ],
      )
    ],
  );
}

dateTimeTile() {
  return Row(
    children: [
      SvgPicture.asset("lib/assets/calendar.svg"),
      const SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "14 December, 2021",
            style: GoogleFonts.inter(
              color: typographyTitle,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Tuesday, 4:00PM - 9:00PM",
            style: GoogleFonts.inter(
              color: typographySubColor,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  );
}

locationTile(String venue, String address) {
  return Row(
    children: [
      SvgPicture.asset("lib/assets/location_icon.svg"),
      const SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            venue,
            style: GoogleFonts.inter(
              color: typographyTitle,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            address,
            style: GoogleFonts.inter(
              color: typographySubColor,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  );
}
