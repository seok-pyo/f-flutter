import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, amount, currency;
  final IconData icon;
  final bool isInverted;
  final double offX, offY;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.amount,
    required this.currency,
    required this.icon,
    required this.isInverted,
    this.offX = 0,
    this.offY = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(offX * 10, offY * 10),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: isInverted
                  ? Colors.white
                  : Color(
                      0xFF1F2123,
                    ),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(amount,
                            style: TextStyle(
                              color: isInverted ? Colors.black : Colors.white,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(currency,
                            style: TextStyle(
                              color: isInverted ? Colors.black : Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: Offset(
                      7,
                      12,
                    ),
                    child: Icon(
                      icon,
                      color: isInverted ? Colors.black : Colors.white,
                      size: 88,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
