import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reckit/models/trip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Trip>> _trips;

  @override
  void initState() {
    super.initState();
    _trips = loadTrips();
  }

  Future<List<Trip>> loadTrips() async {
    final String response = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/data/trips_mock.json');
    final data = jsonDecode(response);
    return List<Trip>.from(data['trips'].map((x) => Trip.fromJson(x)));
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "logo",
            style: TextStyle(
              color: Colors.amberAccent.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        actions: isMobile
            ? [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=1',
                    ),
                  ),
                ),
              ]
            : [
                TextButton(
                  onPressed: () {},
                  child: Text("Items", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Pricing", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Info", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Tasks", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Analytics",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 15, backgroundColor: Colors.red),
                      SizedBox(width: 8),
                      Text("John Doe", style: TextStyle(color: Colors.white)),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
              ],
      ),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Items",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Spacer(),
                if (!isMobile) ...[
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/filter.png',
                      width: 24,
                      height: 24,
                    ),
                  ),

                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Add a New Item"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent.shade700,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Trip>>(
                future: _trips,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading data"));
                  }

                  final trips = snapshot.data!;
                  return GridView.builder(
                    itemCount: trips.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile
                          ? 1
                          : (MediaQuery.of(context).size.width > 1200 ? 5 : 2),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isMobile ? 1.1 : 3 / 4,
                    ),
                    itemBuilder: (context, index) =>
                        _buildItemCard(trips[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Trip trip) {
    return Card(
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                trip.coverImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trip.status,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  trip.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      "${trip.startDate} - ${trip.endDate}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 24,
                      child: Stack(
                        children:
                            List.generate(
                              trip.participantAvatars.length.clamp(0, 3),
                              (i) => Positioned(
                                left: i * 16,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                    trip.participantAvatars[i],
                                  ),
                                ),
                              ),
                            )..addAll(
                              trip.participantAvatars.length > 3
                                  ? [
                                      Positioned(
                                        left: 48,
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.grey.shade800,
                                          child: Text(
                                            "+${trip.participantAvatars.length - 3}",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  : [],
                            ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${trip.unfinishedTasks} unfinished tasks",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
