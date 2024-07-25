import 'package:flutter/material.dart';
import 'package:smartfin_guide/Screens/AddClientScreen.dart';
import 'AddClientScreen.dart'; // Import the new screen

class Clients extends StatelessWidget {
  final List<String> allClientImages = List.generate(
    15,
    (index) =>
        'https://i.pinimg.com/236x/da/fd/f2/dafdf25168edcb2f0e1d8702797946cc.jpg',
  );

  final List<String> allClientNames = List.generate(
    15,
    (index) => 'Client ${index + 1}',
  );

  final List<String> allClientMessages = List.generate(
    15,
    (index) => 'Message ${index + 1}',
  );

  final List<String> allClientTimestamps = List.generate(
    15,
    (index) => 'Time ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Clients'),
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
              itemCount: allClientNames.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5), // Reduced vertical space
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(allClientImages[index]),
                    ),
                    title: Text(allClientNames[index]),
                    subtitle: Text(allClientMessages[index]),
                    trailing: Text(allClientTimestamps[index]),
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
            MaterialPageRoute(builder: (context) => AddClientScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
