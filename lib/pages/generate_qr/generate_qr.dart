import 'package:flutter/material.dart';
import 'package:quick_qr/pages/history_page.dart';

import 'package:quick_qr/widgets/bottom_navigation_bar.dart';
import 'package:quick_qr/widgets/custom_row.dart';
 
class GenerateQr extends StatelessWidget {
  const GenerateQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 43, 42, 42), // Use primary color from constants
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Generate QR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: CustomRowWidget(items: [
              ItemData(
                imagePath: 'assets/icons/resize.gif',
                text: 'Text',
                onPressed: () {
                    Navigator.pushNamed(context, '/text');
                  print('Option 1 clicked');
                },
              ),
              ItemData(
                imagePath: 'assets/icons/website_icon.gif',
                text: 'Website',
                onPressed: () {
                   Navigator.pushNamed(context, '/website');
                  print('Webs 2 clicked');
                },
              ),
              ItemData(
                imagePath: 'assets/icons/wifi.gif',
                text: 'Wifi',
                onPressed: () {
                   Navigator.pushNamed(context, '/wifi');
                  print('Option 3 clicked');
                },
              ),
            ]),
          ),
          SizedBox(
            height: 35,
          ),
          CustomRowWidget(items: [
            ItemData(
              imagePath: 'assets/icons/calendar.gif',
              text: 'Event',
              onPressed: () {
                 Navigator.pushNamed(context, '/event');
                print('Option 1 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/contacts.gif',
              text: 'Contact',
              onPressed: () {
                      Navigator.pushNamed(context, '/contact');
                print('Webs 2 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/business.gif',
              text: 'Business',
              onPressed: () {
                      Navigator.pushNamed(context, '/business');
                print('Option 3 clicked');
              },
            ),
          ]),
          SizedBox(height: 35),
          CustomRowWidget(items: [
            ItemData(
              imagePath: 'assets/icons/location.gif',
              text: 'Location',
              onPressed: () {
                      Navigator.pushNamed(context, '/location');
                print('Option 1 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/whatsapp.gif',
              text: 'WhatsApp',
              onPressed: () {
                      Navigator.pushNamed(context, '/whatsapp');
                print('Webs 2 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/dove.gif',
              text: 'E-mail',
              onPressed: () {
                      Navigator.pushNamed(context, '/email');
                print('Option 3 clicked');
              },
            ),
          ]),
          SizedBox(height: 35),
          CustomRowWidget(items: [
            ItemData(
              imagePath: 'assets/icons/twitter.gif',
              text: 'Twitter',
              onPressed: () {
                      Navigator.pushNamed(context, '/twitter');
                print('Option 1 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/instagram.gif',
              text: 'Instagram',
              onPressed: () {
                      Navigator.pushNamed(context, '/instagram');
                print('Webs 2 clicked');
              },
            ),
            ItemData(
              imagePath: 'assets/icons/phone.gif',
              text: 'Telephone',
              onPressed: () {
                      Navigator.pushNamed(context, '/telephone');
                print('Option 3 clicked');
              },
            ),
          ]),

//SizedBox(height: 20,),

          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
             
            ),
          ),
        ],
      ),
    );
  }
}
