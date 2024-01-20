import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        20), // You can adjust the padding values as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/icons/menu.png",
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/icons/shop.png",
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Our way of loving \n you back",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Search(),
                  const SizedBox(
                    height: 20,
                  ),
                  const TypeMenu(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Raleway',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            color: Color(0xFF00623B),
                            fontFamily: 'Raleway',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Menu(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool _iconOnClick = false;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _iconOnClick = !_iconOnClick;
              });
            },
            icon: Icon(
              Icons.home,
              color: _iconOnClick ? Color(0xFFB4DCCC) : Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.payment,
              color: Color(0xFFB4DCCC),
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Color(0xFFB4DCCC),
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFFB4DCCC),
              size: 30,
            ),
          ),
        ],
      ),
      color: Color(0xFF00623B),
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(
                "assets/icons/search.png",
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            Center(
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TypeMenu extends StatefulWidget {
  const TypeMenu({Key? key}) : super(key: key);

  @override
  _TypeMenuState createState() => _TypeMenuState();
}

class _TypeMenuState extends State<TypeMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                backgroundColor: Color(0xFF00623B)),
            onPressed: () {},
            child: const Text(
              "All",
              style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(width: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {},
            child: const Text(
              "Coffee",
              style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(width: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {},
            child: const Text(
              "Tea",
              style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(width: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {},
            child: const Text(
              "Drink",
              style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(width: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {},
            child: const Text(
              "Food",
              style: TextStyle(color: Colors.black, fontFamily: 'Raleway'),
            ),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: [
            const Chocolate(),
            SizedBox(
              width: 30,
            ),
            const Matcha(),
            SizedBox(
              width: 30,
            ),
            const Strawberry(),
          ],
        ),
      ),
    );
  }
}

class Chocolate extends StatefulWidget {
  const Chocolate({Key? key}) : super(key: key);

  @override
  _Chocolate createState() => _Chocolate();
}

class _Chocolate extends State<Chocolate> {
  bool _love = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        width: 256,
        height: 370,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
              child: Image.asset(
                'assets/images/chocolate.png',
                height: 270,
                width: 257,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Chocolate Frappuccino",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$20.00",
                        style: TextStyle(
                          color: Color(0xFF00623B),
                          fontSize: 25,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _love = !_love;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: _love ? Colors.red : Colors.grey[300],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Matcha extends StatefulWidget {
  const Matcha({Key? key}) : super(key: key);

  @override
  _Matcha createState() => _Matcha();
}

class _Matcha extends State<Matcha> {
  bool _love = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        width: 256,
        height: 370,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
              child: Image.asset(
                'assets/images/matcha.png',
                height: 270,
                width: 257,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tea Frappuccino",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$30.00",
                        style: TextStyle(
                          color: Color(0xFF00623B),
                          fontSize: 25,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _love = !_love;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: _love ? Colors.red : Colors.grey[300],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Strawberry extends StatefulWidget {
  const Strawberry({Key? key}) : super(key: key);

  @override
  _Strawberry createState() => _Strawberry();
}

class _Strawberry extends State<Strawberry> {
  bool _love = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        width: 256,
        height: 370,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
              child: Image.asset(
                'assets/images/red_velvet.png',
                height: 270,
                width: 257,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tea Frappuccino",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$30.00",
                        style: TextStyle(
                          color: Color(0xFF00623B),
                          fontSize: 25,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _love = !_love;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: _love ? Colors.red : Colors.grey[300],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
