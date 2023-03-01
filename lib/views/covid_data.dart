import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/api_helpers.dart';

class CovidTracker extends StatefulWidget {
  const CovidTracker({Key? key}) : super(key: key);

  @override
  State<CovidTracker> createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  String countryName = "india";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "by Country",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      countryName = val;
                    });
                  },
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.indigo),
                    ),
                    hintText: "Country",
                    hintStyle: GoogleFonts.poppins(),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                FutureBuilder(
                  future:
                      ApiHelper.apiHelper.getCovidData(country: countryName),
                  builder: (context, snapShot) {
                    if (snapShot.hasError) {
                      return Text("${snapShot.error}");
                    } else if (snapShot.hasData) {
                      Map? p = snapShot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Covid Data: ${p!['Country_text']}",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.indigo,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${p['Country_text']}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Country",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.indigo,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${p['Last Update']}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Last Update",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.indigo,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${p['Total Recovered_text']}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Recovered Case",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.indigo,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${p['Total Deaths_text']}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "Death Case",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: Colors.indigo,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${p['Total Cases_text']}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "Total Case",
                                  style: GoogleFonts.poppins(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
