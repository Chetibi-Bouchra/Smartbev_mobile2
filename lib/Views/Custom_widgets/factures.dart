import 'package:flutter/material.dart';
import 'facture_card_model.dart';

class CardList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  CardList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return CustomCard(
          title: item['title']!,
          description: item['description']!,
          rightText: '7:04:45', // Add a sample right text
          bottomText: '45 DA', // Add a sample bottom text
        );
      },
    );
  }
}
