import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/widgets/colors.dart';
import 'package:tif_assignment/widgets/list_tiles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Controller
  TextEditingController searchController = TextEditingController();

  //List
  List<dynamic> allEvents = [];
  List<dynamic> searchResults = [];

  //initially all events are displayed
  void fetchAllEvents() async {
    try {
      var url = Uri.parse(
          "https://sde-007.api.assignment.theinternetfolks.works/v1/event");
      var httpClient = HttpClient();
      var request = await httpClient.getUrl(url);
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        setState(() {
          allEvents = json.decode(responseBody)['content']['data'];
          searchResults =
              List.from(allEvents); // Initialize search results with all events
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  //API request for searched term
  void performSearch(String searchTerm) async {
    try {
      var url = Uri.parse(
          "https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$searchTerm");
      var httpClient = HttpClient();
      var request = await httpClient.getUrl(url);
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        setState(() {
          searchResults = json.decode(responseBody)['content']['data'];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  //Converts Date from "2023-06-01T09:00:00+02:00" to "1st  May- Sat -2:00 PM" format
  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String daySuffix = _getDaySuffix(dateTime.day);
    String formattedDate = DateFormat('d').format(dateTime);
    String formattedmonth = DateFormat('MMM - E').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    String result = '$formattedDate$daySuffix $formattedmonth - $formattedTime';

    return result;
  }

  //Sets suffix based on the date
  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  void initState() {
    fetchAllEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: GoogleFonts.inter(
            fontSize: 24,
            color: typographyTitle,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: searchController,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: SvgPicture.asset(
                    "lib/assets/search2.svg",
                    height: 25,
                    width: 25,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: 'Type Event Name',
                  hintStyle: GoogleFonts.inter(
                    color: typographySubColor,
                    fontSize: 20,
                  ),
                ),
                style: GoogleFonts.inter(color: typographyTitle, fontSize: 20),
                onChanged: (value) {
                  performSearch(value);
                },
              ),
            ),

            //Events list
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text(
                        "No events on - '${searchController.text}'",
                        style: GoogleFonts.inter(
                            color: typographySubColor, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        String imageUrl =
                            searchResults[index]["organiser_icon"];
                        String dateTimeInfo =
                            formatDateTime(searchResults[index]["date_time"]);
                        String eventTitle = searchResults[index]["title"];
                        int id = searchResults[index]["id"];
                        return SearchEventTile(
                          imageUrl: imageUrl,
                          dateTimeInfo: dateTimeInfo,
                          eventTitle: eventTitle,
                          id: id,
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
