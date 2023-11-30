import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstPage(),
    );
  }
}

class bookInfo {
  final String name;
  final String author;
  final String rating;
  final String coverUrl;
  final String description;
  final String price;

  bookInfo({
    required this.name,
    required this.author,
    required this.rating,
    required this.coverUrl,
    required this.description,
    required this.price,
  });
}

class firstPage extends StatelessWidget {
  final List<bookInfo> books = [
    bookInfo(
      name: 'Shuvro Samagro ',
      author: 'Humayun Ahmed',
      rating: '4.5',
      coverUrl: 'https://lh3.googleusercontent.com/-ybgrVmu1e_A/VP5SfPaIHFI/AAAAAAABXRM/M7jWFoP-phw/s800/shuvro-samagra-humayun-ahmed.jpg',
      description: "Shuvro is the only son of industrialist Iajuddin or in some stories, Mr. Motahar. His mother, Rehana or Jahanara, in some stories, is the only one with whom Shuvro has a real connection. Here, Ahmed gave us an ideal mother-son relationship. Once, Shuvro told his mother that, 'If I would receive birth a million times, I would have told the Almighty, that I don't care about who I am born to, but each and every time, I should be sent to you.' Shuvro is somewhat of a prince, his complexion is charming and just like other princes, he has many amenities.",
      price: '\$5.8',
    ),
    bookInfo(
      name: 'Harry Potter & The Prisoner Of Azkaban',
      author: 'J.K. Rowling',
      rating: '4.9',
      coverUrl: 'https://m.media-amazon.com/images/I/91VZqV0Cy8L._AC_UF1000,1000_QL80_.jpg',
      description: "Harry Potter & The Prisoner of Azkaban is about Harry's 3rd year at Hogwarts. Along with friends Ron and Hermione, Harry investigates the case of Sirius Black, an escaped prisoner from Azkaban, the wizard prison.",
      price: '\$14.99',
    ),
    bookInfo(
      name: 'Harry Potter & The Chamber Of Secrets',
      author: 'J.K. Rowling',
      rating: '4.7',
      coverUrl: 'https://static.wikia.nocookie.net/harrypotter/images/6/6d/Chamber_of_Secrets_New_UK_Cover.jpg/revision/latest?cb=20170109045927',
      description: "The story follows Harry's second year at Hogwarts School of Witchcraft and Wizardry, where the Heir of Salazar Slytherin opens the Chamber of Secrets, unleashing a monster that petrifies the school's students.",
      price: '\$14.99',

    ),
    bookInfo(
      name: 'Nemesis',
      author: 'Md. Nazimuddin',
      rating: '5.0',
      coverUrl: 'https://static-01.daraz.com.bd/p/4055021cab37d4465c40c446acc2c98d.jpg',
      description: "A popular writer died of paralysis in his apartment. After city homicide investigator Jeffrey Begg catches the potential killer with surprising speed, things take a different turn. Sensational events started coming out one by one. What is ultimately known is as unthinkable as it is unthinkable. Nemesis is a revenge and suspense thriller.",
      price: '\$3.99',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon (Icons.menu),
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookCard(book: books[index]);
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final bookInfo book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(book.coverUrl, height: 100, width: 70),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.name,style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(book.author),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        book.rating, // Replace with the actual rating
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyNowPage(book: book),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Buy Now'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final bookInfo book;

  BuyNowPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              book.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              book.coverUrl,
              height: 550,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(book.author, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              book.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text('Price: ${book.price}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: ['White Edition', 'Black Edition'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
             onChanged: (String? newValue) {

              },
              hint: Text('Select Edition'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
      );
  }
}