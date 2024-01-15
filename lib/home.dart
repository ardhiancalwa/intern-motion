import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/icons/menu.png",
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/icons/shop.png",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
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
                  SizedBox(
                    height: 40,
                  ),
                  Container(
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
                          SizedBox(width: 8),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Color(0xFF00623B),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                          child: Text(
                            "All",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Raleway'),
                          ),
                        ),
                        SizedBox(width: 14),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey[300],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                          child: Text(
                            "Coffee",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Raleway'),
                          ),
                        ),
                        SizedBox(width: 14),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey[300],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                          child: Text(
                            "Tea",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Raleway'),
                          ),
                        ),
                        SizedBox(width: 14),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey[300],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                          child: Text(
                            "Drink",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Raleway'),
                          ),
                        ),
                        SizedBox(width: 14),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey[300],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 33, vertical: 8),
                          child: Text(
                            "Food",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Raleway'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
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
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 256,
                            height: 361,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                      bottom: Radius.circular(15)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$20.00",
                                            style: TextStyle(
                                              color: Color(0xFF00623B),
                                              fontSize: 25,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 256,
                            height: 361,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                      bottom: Radius.circular(15)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$30.00",
                                            style: TextStyle(
                                              color: Color(0xFF00623B),
                                              fontSize: 25,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 256,
                            height: 361,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                      bottom: Radius.circular(15)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$30.00",
                                            style: TextStyle(
                                              color: Color(0xFF00623B),
                                              fontSize: 25,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              Icon(
                Icons.payment,
                color: Color(0xFFB4DCCC),
                size: 40,
                ),
              Icon(
                Icons.favorite_border,
                color: Color(0xFFB4DCCC),
                size: 40,
                ),
              Icon(
                Icons.notifications_none,
                color: Color(0xFFB4DCCC),
                size: 40,
                ),
            ],
          ),
          color: Color(0xFF00623B),
        ),
      ),
    );
  }
}
