import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/widgets/list_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //map
  Map<String, dynamic> responseData = {};

  //fetch data from API
  void fetchData() async {
    var url = Uri.parse(
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event");
    var httpClient = HttpClient();

    try {
      var request = await httpClient.getUrl(url);
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        setState(() {
          responseData = json.decode(responseBody);
        });
      } else {
        // Handles errors
        debugPrint(
            "Error: ${response.statusCode}###################################");
      }
    } catch (e) {
      //Handles exceptions
      debugPrint("Exception: $e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
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
    List? eventData = responseData['content']['data'];
    formatDateTime(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDate = DateFormat('E, MMM d • h:mm a').format(dateTime);
      return formattedDate;
    }

    return Scaffold(
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
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: eventData!.length,
          itemBuilder: (context, index) {
            String imageUrl = eventData[index]['organiser_icon'];
            String eventTitle = eventData[index]['title'];
            int id = eventData[index]['id'];

            String location =
                '${eventData[index]['venue_name']} • ${eventData[index]['venue_city']}, ${eventData[index]['venue_country']}';
            String dateTimeInfo = formatDateTime(eventData[index]['date_time']);
            bool isSvg = imageUrl.toLowerCase().endsWith('.svg');

            return EventTile(
              imageUrl: imageUrl,
              dateTimeInfo: dateTimeInfo,
              eventTitle: eventTitle,
              location: location,
              isSvg: isSvg,
              id: id,
            );
          },
        ),
      ),
    );
  }
}
