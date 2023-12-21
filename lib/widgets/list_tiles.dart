import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/widgets/colors.dart';
import 'package:tif_assignment/assignment/event_details.dart';
import 'package:tif_assignment/widgets/transitions.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.imageUrl,
    required this.dateTimeInfo,
    required this.eventTitle,
    required this.location,
    required this.id,
  });
  final String imageUrl;
  final String dateTimeInfo;
  final String eventTitle;
  final String location;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        slideRightTransition(context, EventsDetails(id: id));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff575C8A).withOpacity(0.06),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 107,
              height: 107,
              padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: imageUrl.toLowerCase().endsWith('.svg')
                      ? SvgPicture.network(
                          imageUrl,
                          placeholderBuilder: (context) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5,
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTimeInfo,
                    style: GoogleFonts.inter(
                      color: primaryBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    eventTitle,
                    softWrap: true,
                    style: GoogleFonts.inter(
                      color: typographyTitle,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset("lib/assets/map-pin.svg"),
                      Expanded(
                        child: Text(
                          " $location",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            color: typographySubColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
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

class SearchEventTile extends StatelessWidget {
  const SearchEventTile({
    super.key,
    required this.imageUrl,
    required this.dateTimeInfo,
    required this.eventTitle,
    required this.id,
  });
  final String imageUrl;
  final String dateTimeInfo;
  final String eventTitle;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        slideRightTransition(context, EventsDetails(id: id));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff575C8A).withOpacity(0.06),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 107,
              height: 107,
              padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: imageUrl.toLowerCase().endsWith('.svg')
                      ? SvgPicture.network(
                          imageUrl,
                          placeholderBuilder: (context) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5,
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTimeInfo,
                    style: GoogleFonts.inter(
                      color: primaryBlue,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    eventTitle,
                    softWrap: true,
                    style: GoogleFonts.inter(
                      color: typographyTitle,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
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
