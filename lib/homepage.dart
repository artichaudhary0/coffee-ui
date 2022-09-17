import 'package:coffee/utils/coffe_card.dart';
import 'package:coffee/utils/coffe_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List coffeType = [
    ["Cuppicino", true],
    ["Latte", false],
    ["Black", false],
    ["Tea", false],
  ];
  //when user select coffe types

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/coffee2.jpg",
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "Favorites",
          icon: Icon(
            Icons.favorite,
          ),
        ),
        BottomNavigationBarItem(
          label: "Notification",
          icon: Icon(
            Icons.notifications,
          ),
        ),
      ]),
      body: Column(
        children: [
          // Find the beast coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find yur coffee...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          Container(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              itemCount: coffeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //horizontal listview of coffee tiles

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeCard(
                  coffeeName: 'Cuppicino',
                  imagePath: 'assets/coffee1.jpg',
                  price: '4',
                ),
                CoffeeCard(
                  coffeeName: 'Black',
                  imagePath: 'assets/coffee2.jpg',
                  price: '3',
                ),
                CoffeeCard(
                  coffeeName: 'Latte',
                  imagePath: 'assets/coffee6.jpg',
                  price: '6',
                ),
                CoffeeCard(
                  coffeeName: 'Latte',
                  imagePath: 'assets/coffee4.jpg',
                  price: '3',
                ),
                CoffeeCard(
                  coffeeName: 'Tea',
                  imagePath: 'assets/coffee5.jpg',
                  price: '4',
                ),
                CoffeeCard(
                  coffeeName: 'Cuppicino',
                  imagePath: 'assets/coffee6.jpg',
                  price: '7',
                ),
                CoffeeCard(
                  coffeeName: 'Tea',
                  imagePath: 'assets/coffee1.jpg',
                  price: '5',
                ),
                CoffeeCard(
                  coffeeName: 'Latte',
                  imagePath: 'assets/coffee2.jpg',
                  price: '2',
                ),
                CoffeeCard(
                  coffeeName: 'Tea',
                  imagePath: 'assets/coffee6.jpg',
                  price: '8',
                ),
                CoffeeCard(
                  coffeeName: 'Cuppicino',
                  imagePath: 'assets/coffee4.jpg',
                  price: '5',
                ),
                CoffeeCard(
                  coffeeName: 'Latte',
                  imagePath: 'assets/coffee5.jpg',
                  price: '3',
                ),
                CoffeeCard(
                  coffeeName: 'Tea',
                  imagePath: 'assets/coffee6.jpg',
                  price: '8',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
