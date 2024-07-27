import 'package:flutter/material.dart';
import 'package:smartfin_guide/Screens/AddClientScreen.dart';
import 'package:smartfin_guide/Screens/InboxScreen.dart';

class Clients extends StatelessWidget {
  final List<Map<String, String>> clientData = [
    {
      'image': 'https://randomuser.me/api/portraits/men/1.jpg',
      'name': 'John Doe',
      'message': 'Hey, how are you doing?',
      'timestamp': '10:15 AM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/1.jpg',
      'name': 'Anna Smith',
      'message': 'Just checking in!',
      'timestamp': '11:20 AM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/2.jpg',
      'name': 'Louis Johnson',
      'message': 'Can we meet this week?',
      'timestamp': '12:05 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      'name': 'Marie Brown',
      'message': 'I received your package.',
      'timestamp': '1:45 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/3.jpg',
      'name': 'Michael Davis',
      'message': 'Let\'s schedule a call.',
      'timestamp': '2:30 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      'name': 'Soha Ahmed',
      'message': 'I have a question about the project.',
      'timestamp': '3:10 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/4.jpg',
      'name': 'Junaid Khan',
      'message': 'I will be late for the meeting.',
      'timestamp': '4:00 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/men/5.jpg',
      'name': 'Brad Lee',
      'message': 'Can you send me the report?',
      'timestamp': '4:45 PM',
    },
    {
      'image': 'https://randomuser.me/api/portraits/women/4.jpg',
      'name': 'Webster Clark',
      'message': 'Thank you for your help!',
      'timestamp': '5:30 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('All Clients', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: clientData.length,
              itemBuilder: (context, index) {
                final client = clientData[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            InboxScreen(
                              clientName: client['name']!,
                              clientImage: client['image']!,
                              clientMessages: client['message'],
                            ),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(position: offsetAnimation, child: child);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(client['image']!),
                        ),
                        title: Text(
                          client['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(client['message']!),
                        trailing: Text(
                          client['timestamp']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AddClientScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(position: offsetAnimation, child: child);
              },
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
