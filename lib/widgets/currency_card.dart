import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData iconData;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.iconData,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color:
            isInverted ? Colors.white : const Color.fromARGB(255, 28, 27, 27),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: isInverted
                          ? const Color.fromARGB(255, 28, 27, 27)
                          : Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              amount,
                              style: TextStyle(
                                  color: isInverted
                                      ? const Color.fromARGB(255, 28, 27, 27)
                                      : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              code,
                              style: TextStyle(
                                  color: isInverted
                                      ? const Color.fromARGB(255, 28, 27, 27)
                                      : Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(-5, 10),
                child: Icon(
                  iconData,
                  color: isInverted
                      ? const Color.fromARGB(255, 28, 27, 27)
                      : Colors.white,
                  size: 88,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
