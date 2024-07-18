import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/event_feed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      body: SafeArea(
        child: Container(
            padding:const  EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              // row should be columns
              child: Column(children: [
                CustomAppBar(),
                const SizedBox(height: 20),
                Text(
                  'Events',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8)),
                )
              ]),
            )),
      ),
    );
  }
}
