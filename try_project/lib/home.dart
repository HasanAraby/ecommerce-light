import 'package:flutter/material.dart';
import 'package:try_project/details.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    {
      'icon': Icons.laptop,
      'title': 'Laptop',
    },
    {
      'icon': Icons.mobile_friendly,
      'title': 'Mobile',
    },
    {
      'icon': Icons.headphones,
      'title': 'Head Phones',
    },
    {
      'icon': Icons.watch,
      'title': 'Watch',
    },
    {
      'icon': Icons.card_giftcard,
      'title': 'Gifts',
    },
    {
      'icon': Icons.tablet,
      'title': 'Tablet',
    },
  ];

  List items = [
    {
      'image': 'assets/images/headphone.jpg',
      'title': 'Head Phones',
      'subTitle': 'JPL',
      'price': '50\$',
    },
    {
      'image': 'assets/images/headphone1.webp',
      'title': 'Head Phones',
      'subTitle': 'JPL',
      'price': '80\$',
    },
    {
      'image': 'assets/images/laptop.jpg',
      'title': 'Laptop',
      'subTitle': 'HP',
      'price': '1000\$',
    },
    {
      'image': 'assets/images/laptop1.jpg',
      'title': 'Laptop',
      'subTitle': 'DELL',
      'price': '1600\$',
    },
    {
      'image': 'assets/images/mouse.jpg',
      'title': 'Mouse',
      'subTitle': 'HP',
      'price': '13\$',
    },
    {
      'image': 'assets/images/watch.jpg',
      'title': 'Watch',
      'subTitle': 'ROLEX',
      'price': '50,000\$',
    },
    {
      'image': 'assets/images/watch1.jpg',
      'title': 'Watch',
      'subTitle': 'CASIO',
      'price': '3,000\$',
    },
    {
      'image': 'assets/images/watch2.jpg',
      'title': 'Watch',
      'subTitle': 'ROLEX',
      'price': '47,000\$',
    },
  ];
  int bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        iconSize: 33,
        selectedItemColor: Colors.orange,
        onTap: (value) {
          setState(() {
            bottomIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: '*',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: '*',
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.menu,
                    size: 40,
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            categories[index]['icon'],
                            size: 50,
                          ),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        Text(
                          '${categories[index]['title']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Best Selling',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 250,
                crossAxisCount: 2,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              data: items[index],
                            )));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(20),
                          width: 300,
                          color: Colors.grey[200],
                          child: Image.asset(
                            items[index]['image'],
                            height: 110,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          items[index]['title'],
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          items[index]['subTitle'],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Text(
                          items[index]['price'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
