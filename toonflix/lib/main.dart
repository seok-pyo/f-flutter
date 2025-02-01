import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 10, 150, 150),
        //   title: Text('Hello, Flutter!'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hello, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 62,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Balance',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text('\$5 194 382',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            text: 'Required',
                            bgColor: Colors.amber,
                            textColor: Colors.black),
                        Button(
                            text: 'Request',
                            bgColor: Color(0xFF1F2123),
                            textColor: Colors.white),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                    Text('View All',
                        style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontSize: 18,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CurrencyCard(
                  name: 'Euro',
                  amount: '6 428',
                  currency: 'EUR',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                CurrencyCard(
                  name: 'Bit Coin',
                  amount: '6 428',
                  currency: 'EUR',
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                  offY: -2.5,
                ),
                CurrencyCard(
                  name: 'Euro',
                  amount: '6 428',
                  currency: 'EUR',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  offY: -5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
