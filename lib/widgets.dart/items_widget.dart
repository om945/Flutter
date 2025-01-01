import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/models.dart';

class ItemsWidget extends StatelessWidget {
  final Items item;

  const ItemsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(
          item.img,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              // fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
