import 'package:brewcrewtrue/screens/home/animal_tile.dart';
import 'package:flutter/material.dart';
import 'package:brewcrewtrue/models/animal.dart';
import 'package:provider/provider.dart';
import 'dart:core';

//  Creates a list of animals from a defined animal tile structure
class AnimalList extends StatefulWidget {
  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  @override
  Widget build(BuildContext context) {

    final animals = Provider.of<List<Animal>>(context) ?? [];

    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        return AnimalTile(animal: animals[index]);
      },
    );
  }
}
