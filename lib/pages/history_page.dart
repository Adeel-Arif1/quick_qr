import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Track selected tab (0 for "Scan", 1 for "Create")
  int selectedTabIndex = 0;

  // Dummy data for the list
  final List<Map<String, String>> historyItems = [
    {
      "url": "https://itunes.com",
      "date": "16 Dec 2024, 9:30 pm",
    },
    {
      "url": "https://example.com",
      "date": "15 Dec 2024, 7:15 pm",
    },
    {
      "url": "https://flutter.dev",
      "date": "14 Dec 2024, 5:00 pm",
    },
    {
      "url": "https://google.com",
      "date": "13 Dec 2024, 8:45 pm",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2A2A), // Dark background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // History title with an icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Text(
                      "History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Tab row with two buttons: Scan and Create
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 0
                              ? Colors.yellow
                              : Colors.black87,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Scan",
                          style: TextStyle(
                            color: selectedTabIndex == 0
                                ? Colors.black
                                : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 1
                              ? Colors.yellow
                              : Colors.black87,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Create",
                          style: TextStyle(
                            color: selectedTabIndex == 1
                                ? Colors.black
                                : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // List of history items
              ListView.builder(
                shrinkWrap:
                    true, // Ensures the ListView only takes up the necessary height
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling within ListView
                itemCount: historyItems.length,
                itemBuilder: (context, index) {
                  final item = historyItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: HistoryItemWidget(
                      iconPath: "assets/splash_qrr.png", // Replace with QR icon
                      title: item["url"]!,
                      subtitle: "Date",
                      date: item["date"]!,
                      onDelete: () {
                        setState(() {
                          historyItems.removeAt(index);
                        });
                        print("Deleted: ${item["url"]}");
                      },
                    ),
                  );
                },
              ),
              //Spacer(),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: BottomNavBar(
              //     onGeneratePressed: () {
              //       print("Generate Pressed");
              //     },
              //     //onScanPressed: _scanManually,
              //     onHistoryPressed: () {
              //       print("History Pressed");
              //     },
              //   ),

              // ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class HistoryItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final String date;
  final VoidCallback onDelete;

  const HistoryItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          bottom: BorderSide(color: Colors.yellow, width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // QR Icon
          Image.asset(
            iconPath,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 16),
          // URL and Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text overflow
                  maxLines: 1, // Limit to a single line
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey, // Subtitle in grey
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey, // Date in grey
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Delete Icon
          GestureDetector(
            onTap: onDelete,
            child: const Icon(
              Icons.delete,
              color: Colors.yellow,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
