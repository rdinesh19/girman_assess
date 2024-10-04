import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_assessment/view/showDialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' as rootBundle; // Import for loading assets

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _selectedMenuItem = "search";
  // List that holds the filtered users
  List<dynamic> _foundUsers = [];
  List<dynamic> _allUsers = [];
  List<dynamic> results = [];
  bool search=false;

  @override
  void initState() {
    super.initState();
    // Load users from JSON on init
    loadJsonData();
  }
  // Load JSON data from the assets
  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.rootBundle.loadString('assets/user_list.json');
    final jsonData = json.decode(jsonString) as List;

    setState(() {
      _allUsers = jsonData;
      _foundUsers = _allUsers;
    });
  }

  // This function is triggered when the search field changes
  void _runFilter(String enteredKeyword) {

    if (enteredKeyword.isEmpty) {
      // If the search field is empty, display all users
      results = _allUsers;
      _foundUsers=[];
      search=false;
    } else {
      search=true;
      results = _allUsers
          .where((user) => user["first_name"]
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }
  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }
  // Method to launch the default email app with a prefilled email
  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Contact Inquiry'
      },
    );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $emailUri';
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
    bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1.41), // Adjust height as needed
    child: Container(
      height: 1.41, // Height of the bottom line
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000), // Equivalent to #00000040
            offset: Offset(0, 1.41), // Bottom shadow with vertical offset
            blurRadius: 8.43, // Blur radius matching the CSS
          ),
        ],
      ),),),
        title: Image.asset(
          "assets/images/Logo.webp",
          width: 102.7.w,
          height:28.84.h,
          fit: BoxFit.fill,
        ),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Set border radius here
              side: BorderSide(color: Color(0xFFE3E3E3), width: 1), // Optional border color and width
            ),
            icon: Icon(Icons.menu, color: Colors.black),
            onSelected: (value) {
              setState(() {
                _selectedMenuItem = value; // Update the selected menu item
              });
              switch (value) {
                case 'search':
                // Handle Search action
                  break;
                case 'website':
                  _launchUrl('https://girmantech.com'); // Launch the website
                  break;
                case 'linkedin':
                  _launchUrl('https://www.linkedin.com/company/girman-technologies'); // Launch LinkedIn
                  break;
                case 'contact':
                  _launchEmail('contact@girmantech.com'); // Open email client
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "search",
                  child: Text(
                    "SEARCH",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:_selectedMenuItem == "search"?Colors.blue:Colors.black,
                      decoration: _selectedMenuItem == "search" ? TextDecoration.underline : TextDecoration.none,
                      decorationColor: _selectedMenuItem == "search" ? Colors.blue : Colors.black,

                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "website",
                  child: Text("WEBSITE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _selectedMenuItem == "website" ? Colors.blue : Colors.black,
                      decoration: _selectedMenuItem == "website" ? TextDecoration.underline : TextDecoration.none,
                      decorationColor: _selectedMenuItem == "website" ? Colors.blue : Colors.black,

                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "linkedin",
                  child: Text("LINKEDIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _selectedMenuItem == "linkedin" ? Colors.blue : Colors.black,
                      decoration: _selectedMenuItem == "linkedin" ? TextDecoration.underline : TextDecoration.none,
                      decorationColor: _selectedMenuItem == "linkedin" ? Colors.blue : Colors.black,

                    ),),
                ),
                PopupMenuItem(
                  value: "contact",
                  child: Text("CONTACT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _selectedMenuItem == "contact" ? Colors.blue : Colors.black,
                      decoration: _selectedMenuItem == "contact" ? TextDecoration.underline : TextDecoration.none,
decorationColor: _selectedMenuItem == "contact" ? Colors.blue : Colors.black,

                    ),),
                ),
              ];
            },
          ),

SizedBox(width: 30.65.w,)
        ],
      ),
      body: SafeArea(
          child: Container(
            width: width,
height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF), // #FFFFFF
                  Color(0xFFB1CBFF), // #B1CBFF
                ],
                stops: [0.31, 1.0], // Corresponding to 31% and 100%
              ),
            ),
child:  Stack(
  children: [
    Image.asset(
      "assets/images/bg_image.webp",
      width: width,
      height: height,
      //fit: BoxFit.contain,
    ),
    Padding(
      padding:EdgeInsets.only(
        left: 28.w,right:27.w,
      ),
      child: Column(
        children: [
          search? SizedBox():Column(
            children: [
              SizedBox(height: 109.h,),
              Image.asset(
                "assets/images/logo_title.webp",
                width: width,
                height:65.h,
                //fit: BoxFit.contain,
              ),

              // Search Bar
            ],
          ),
          SizedBox(height: 28.h,),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFD7D7EA))
            ),

            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color:Color(0xFF71717A),size: 18,),
                hintText: "Search",
                hintStyle:const TextStyle(
                  color: Color(0xFF71717A)
                                   ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white
              ),
            ),
          ),
      const SizedBox(height: 20),
      Expanded(
        child: _foundUsers.isNotEmpty
            ? ListView.builder(
          itemCount: _foundUsers.length,
          itemBuilder: (context, index) => Card(
            key: ValueKey(_foundUsers[index]["name"]),
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child:Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.84)
              ),
              padding: EdgeInsets.all(20.75),
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      _foundUsers[index]["image"],
                      width: 53.6.w, // Set width and height for the circular effect
                      height: 53.6.h,
                      fit: BoxFit.cover, // Ensures the image covers the entire circle
                    ),
                  ),
                  Row(
                    children: [
                      Text(_foundUsers[index]['first_name'],style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: Color(0xFF09090B),
                        fontSize: 27.67,
                        fontWeight: FontWeight.w600,
                      ),textAlign: TextAlign.start,),
                      SizedBox(width: 5.w,),
                      Text(_foundUsers[index]['last_name'],style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: Color(0xFF09090B),
                        fontSize: 27.67,
                        fontWeight: FontWeight.w600,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/location.webp",
                        width:8.65.w, // Set width and height for the circular effect
                        height: 11.24.h,
                        fit: BoxFit.cover, // Ensures the image covers the entire circle
                      ),

                      SizedBox(width: 5.w,),
                      Text(_foundUsers[index]['city'],style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
color: Color(0xFF425763),
                        fontWeight: FontWeight.w500,
                        fontSize: 8.65,
                      ),textAlign: TextAlign.start,

                      ),
                    ],
                  ),
                  SizedBox(height: 27.67.h,),
                  const Divider(
                    color: Color(0xFFF3F3F3),
                    thickness: 1,
                  ),
                  SizedBox(height: 6.92.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/icons/mobile.webp",
                                width:11.24.w, // Set width and height for the circular effect
                                height: 11.24.h,
                                fit: BoxFit.cover, // Ensures the image covers the entire circle
                              ),

                              SizedBox(width: 5.w,),
                              Text(_foundUsers[index]['contact_number'], style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                fontSize: 10.38,
                                fontWeight: FontWeight.w600,
                              ),textAlign: TextAlign.start,),
                            ],
                          ),
                          SizedBox(height:4.32.h,),
                          Text("Available on phone", style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            color: Color(0xFFAFAFAF),
                            fontSize: 8.65,
                            fontWeight: FontWeight.w500,
                          ),textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          showEmployeeDetailsDialog(
                            context,
                            {
                              'first_name': _foundUsers[index]['first_name'],
                              'last_name': _foundUsers[index]['last_name'],


                              'city': _foundUsers[index]['city'],
                              'phone': _foundUsers[index]['contact_number'],
                              'image': _foundUsers[index]['image'], // Image from assets
                            },
                          );
  },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 13.w,right: 13.w,top: 9.79.h,bottom: 9.79.h
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF18181B),
                              borderRadius: BorderRadius.circular(6.92)
                          ),

                          child: Text('Fetch Details', style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            color: Colors.white,
                            fontSize: 12.11,
                            fontWeight: FontWeight.w500,
                          ),textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            )


          ),
        )
            : Image.asset(
          "assets/images/empty_list.webp",
          width: width,
          height:248.36.h,
          //fit: BoxFit.contain,
        ),)
        ],
      ),
    )
  ],


),
    )),
    );
  }
}
