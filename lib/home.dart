import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/search.dart';
import 'package:tif_assignment/widgets/colors.dart';
import 'package:tif_assignment/widgets/list_tiles.dart';
import 'package:tif_assignment/widgets/transitions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //fetch data from API
  Future<Map<String, dynamic>> fetchData() async {
    var url = Uri.parse(
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event");
    var httpClient = HttpClient();

    try {
      var request = await httpClient.getUrl(url);
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        // Handles errors
        debugPrint("Error: ${response.statusCode}");
        return {};
      }
    } catch (e) {
      // Handles exceptions
      debugPrint("Exception: $e");
      return {};
    } finally {
      httpClient.close();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //Formats date from "2023-06-01T09:00:00+02:00" to "Wed, May 10 • 4:00 PM" format
    formatDateTime(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDate = DateFormat('E, MMM d • h:mm a').format(dateTime);
      return formattedDate;
    }

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Want to exit the app?',
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: primaryBlue)),
                    alignment: Alignment.center,
                    child: Text(
                      "No",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Yes",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Events",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //Custom transition animation
                  slideRightTransition(context, const SearchPage());
                },
                icon: SvgPicture.asset("lib/assets/search1.svg")),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        //Future builder to keep the data updated. Can also be achieved without it
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
              List? eventData = data['content']['data'];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  itemCount: eventData!.length,
                  itemBuilder: (context, index) {
                    //All the variables. We can also just pass id as parameter but when the user navigates
                    //to the next page he will require to send another request to the API to fetch data.
                    //Hence to avoid multiple request I am passing all the required variables here itself
                    String imageUrl = eventData[index]['organiser_icon'];
                    String eventTitle = eventData[index]['title'];
                    int id = eventData[index]['id'];
                    String location =
                        '${eventData[index]['venue_name']} • ${eventData[index]['venue_city']}, ${eventData[index]['venue_country']}';
                    String dateTimeInfo =
                        formatDateTime(eventData[index]['date_time']);

                    return EventTile(
                      imageUrl: imageUrl,
                      dateTimeInfo: dateTimeInfo,
                      eventTitle: eventTitle,
                      location: location,
                      id: id,
                    );
                  },
                ),
              );
            }

            //Default return widget
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
