import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm/login.dart';

class Loginsuccess extends StatefulWidget {
  final String email;
  const Loginsuccess({super.key, required this.email});

  @override
  State<Loginsuccess> createState() => _LoginsuccessState();
}

class _LoginsuccessState extends State<Loginsuccess> {
  final List<Map<String, String>> books = [
    {
      "title": "Chopsticks",
      "author": "Shinzou Mitsuda",
      "category": "Horror",
    },
    {
      "title": "Journey Under the Midnight Sun",
      "author": "Keigo Higashino",
      "category": "Mystery"
    },
    {
      "title": "Genius on the Left, Lunatic on the Right",
      "author": "Gao Ming",
      "category": "Philosophical"
    },
    {
      "title": "Born a Crime",
      "author": "Trevor Noah",
      "category": "Biography",
    },
    {
      "title": "Pride and Prejudice",
      "author": "Jane Austen",
      "category": "Romance"
    },
  ];

  String selectedCategory = "Mystery";

  void logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  List<Map<String, String>> getBooksByCategory(String category) {
    return books.where((book) => book['category'] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredBooks =
        getBooksByCategory(selectedCategory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        title: Text(
          'N E U C  L i b r a r y',
          style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login as: ${widget.email}',
                  style: GoogleFonts.bonaNova(fontSize: 20),
                ),

                SizedBox(height: 20),

                DropdownButton<String>(
                  value: selectedCategory,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: books
                      .map<DropdownMenuItem<String>>(
                          (Map<String, String> book) {
                        return DropdownMenuItem<String>(
                          value: book['category'],
                          child: Text(book['category']!),
                        );
                      })
                      .toSet()
                      .toList(), // To ensure unique categories
                ),
                SizedBox(height: 20),
                // ListView to display the list of books in the selected category
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ListTile(
                          leading: Icon(Icons.book, color: Colors.black),
                          title: Text(
                            filteredBooks[index]['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'by ' + filteredBooks[index]['author']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
