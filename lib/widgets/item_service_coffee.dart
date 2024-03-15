import 'package:flutter/material.dart';

class ItemServiceCoffee extends StatelessWidget {
  const ItemServiceCoffee({
    super.key,
    required this.titleText,
    required this.descriptionText,
  });

  final String titleText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    //* Container as background
    return Container(
      width: 270,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(40, 24, 40, 70),
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200)),
        boxShadow: const [
          BoxShadow(
            color: Colors.brown,
            blurRadius: 6,
            offset: Offset(1, 3),
          )
        ],
      ),
      //* Column
      child: Column(
        children: [
          //* Image Header
          ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Image.network(
              'https://img.jakpost.net/c/2019/03/12/2019_03_12_67439_1552382803._large.jpg',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          //* Space vertical
          const SizedBox(height: 16),
          //* Title Text
          Text(
            titleText,
            style: TextStyle(
              color: Colors.brown[800],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          //* Description Text
          Text(
            descriptionText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          //* Button with background color and radius
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
            ),
            child: const Text('Explore More'),
          ),
        ],
      ),
    );
  }
}
