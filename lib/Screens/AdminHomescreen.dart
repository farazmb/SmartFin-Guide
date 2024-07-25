import 'package:flutter/material.dart';
import 'clients.dart'; // Import the Clients screen

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  final List<String> catNames = [
    'All clients',
    'To be notified',
    'Meetings',
    'Import',
    'New clients',
    'Removed',
  ];

  final List<Color> catColors = [
    Color.fromARGB(255, 255, 200, 2),
    Color.fromARGB(255, 87, 205, 118),
    Color.fromARGB(255, 67, 202, 243),
    Color.fromARGB(255, 117, 229, 99),
    Color.fromARGB(255, 194, 127, 240),
    Color.fromARGB(255, 252, 124, 124)
  ];

  final List<Icon> catIcons = [
    Icon(
      Icons.people,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.notification_add_outlined,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.meeting_room,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.import_export_outlined,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.new_label_rounded,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.delete,
      color: Colors.white,
      size: 30,
    ),
  ];

  final List<String> clientImages = [
    'https://i.pinimg.com/236x/da/fd/f2/dafdf25168edcb2f0e1d8702797946cc.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCo5rBr2N6uQKaltnIgwzmdJxCBRhodVB-sQ&s',
    'https://media.glamourmagazine.co.uk/photos/643911c5faffaaf0fce7d598/1:1/w_1280,h_1280,c_limit/SOFT%20GIRL%20AESTHETIC%20140423%20rachelteetyler_L.jpeg',
    'https://knowledgeenthusiast.com/wp-content/uploads/2022/04/pexels-photo-6694422.jpeg',
    'https://i.pinimg.com/236x/da/fd/f2/dafdf25168edcb2f0e1d8702797946cc.jpg',
  ];

  final List<String> clientMessages = [
    'Can we meet today?',
    'Sure thing boss..!',
    'How\'s my case?',
    'Submit it by tomorrow',
    'This needs to be discussed',
  ];

  final List<String> clientNames = [
    'Soha',
    'John',
    'Liza Ann',
    'Webster',
    'Anna'
  ];

  final List<String> clientTimestamps = [
    '12:01 PM',
    '1:32 PM',
    '11:10 PM',
    '10:31 PM',
    '10:31 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard_rounded,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    'Hi, Chazz Wolf',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                    itemCount: catNames.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            catNames[index],
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Clients',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Clients(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: clientNames.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              clientImages[index]),
                        ),
                        title: Text(clientNames[index]),
                        subtitle: Text(clientMessages[index]),
                        trailing: Text(clientTimestamps[index]),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Change this to manage selected tab
      ),
    );
  }
}
