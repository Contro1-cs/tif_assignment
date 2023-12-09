import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/widgets/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
