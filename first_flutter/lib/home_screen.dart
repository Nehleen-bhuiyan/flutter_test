import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class InterestCard {
  String name;
  String picture;
  String desc;
  InterestCard(this.name, this.picture, this.desc);
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<InterestCard> cards = [
    InterestCard(
      "Travel",
      "assets/travel.jpg",
      "Exploring new places around the world",
    ),
    InterestCard(
      "Photography",
      "assets/photography.jpg",
      "Capturing moments through lenses",
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 4, right: 4, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              height: 455,
              width: double.infinity,
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(100, 113, 110, 103),
                    backgroundImage: const AssetImage(
                      'assets/flutter_example.jpg',
                    ),
                    radius: 80,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Kanamori Sayaka",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Flutter Developer"),
                  SizedBox(height: 15),
                  Text(
                    "Passionate about creating user-friendly and engaging digital expreiences.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.mail, color: Colors.blueGrey),
                      SizedBox(width: 5),
                      Text("sayaka_kanamori@gmail.com"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blueGrey),
                      SizedBox(width: 5),
                      Text("+123-456-789"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 125,
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },

                          style: FilledButton.styleFrom(
                            backgroundColor: selectedIndex == 0
                                ? Colors.blue
                                : Colors.white,
                            foregroundColor: selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: const Text(
                            "Follow",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 50,
                        width: 125,
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },

                          style: FilledButton.styleFrom(
                            backgroundColor: selectedIndex == 1
                                ? Colors.blue
                                : Colors.white,
                            foregroundColor: selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: const Text("Message"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 122,
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.grey],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Interests",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  width: 122,
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.transparent],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InterestCardWidget(card: cards[0]),

                const SizedBox(width: 15),

                InterestCardWidget(card: cards[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InterestCardWidget extends StatelessWidget {
  const InterestCardWidget({super.key, required this.card});

  final InterestCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              card.picture,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            card.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(
            card.desc,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                // static button for now
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "View More",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
