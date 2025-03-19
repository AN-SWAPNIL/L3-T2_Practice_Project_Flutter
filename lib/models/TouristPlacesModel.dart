import 'package:flutter/material.dart';


class TouristPlacesModel {
  final String name;
  final String image;

  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Mountain", image: "assets/mountain.png"),
  TouristPlacesModel(name: "Beach", image: "assets/beach.png"),
  TouristPlacesModel(name: "Forest", image: "assets/forest.png"),
  TouristPlacesModel(name: "City", image: "assets/city.png"),
];