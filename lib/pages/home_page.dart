import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_2/models/models.dart';
import 'package:flutter_application_2/widgets.dart/Drawer.dart';
import 'package:flutter_application_2/widgets.dart/items_widget.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // final int day = 10;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/Catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Shopping App",
          style: TextStyle(color: const Color.fromARGB(255, 243, 243, 243)),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: (CatalogModel.items.isNotEmpty)
                  ? ListView.builder(
                      itemCount: CatalogModel.items.length,
                      itemBuilder: (context, index) => ItemsWidget(
                        item: CatalogModel.items[index],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()))),
      drawer: MyDrawer(),
    );
  }
}
