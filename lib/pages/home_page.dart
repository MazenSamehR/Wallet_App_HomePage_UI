import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/my_button.dart';
import 'package:wallet_app/util/my_card.dart';
import 'package:wallet_app/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pageController
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child:const Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[300],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "My",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " Cards",
                            style: TextStyle(fontSize: 28),
                          ),
                        ],
                      ),

                      //plus button
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //cards
              SizedBox(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                      balance: 5250.25,
                      cardNumber: 12345678,
                      expiryMonth: 11,
                      expiryYear: 28,
                      color: Colors.deepPurple[400],
                    ),
                    MyCard(
                      balance: 10700.56,
                      cardNumber: 87654321,
                      expiryMonth: 02,
                      expiryYear: 29,
                      color: Colors.blue[400],
                    ),
                    MyCard(
                      balance: 420.42,
                      cardNumber: 12345678,
                      expiryMonth: 08,
                      expiryYear: 24,
                      color: Colors.green[400],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 40),

              //3 buttons [send - pay - bills]
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                    iconImagePath: 'lib/icons/expense.png',
                    buttonText: "Send",
                  ),

                  //pay button
                  MyButton(
                    iconImagePath: 'lib/icons/credit-card.png',
                    buttonText: "Pay",
                  ),

                  // bills button
                  MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: "Bills",
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // column [stats - transaction]
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    // statistics
                    MyListTile(
                      iconImagePath: 'lib/icons/analysis.png',
                      tileSubTitle: "Payments and Income",
                      tileTitle: "Statistics",
                    ),

                    //transaction
                    MyListTile(
                      iconImagePath: 'lib/icons/transaction.png',
                      tileSubTitle: "Transactions History",
                      tileTitle: "Transactions",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
