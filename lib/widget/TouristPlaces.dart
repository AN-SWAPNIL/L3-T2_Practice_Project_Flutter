import 'package:flutter/material.dart';
import 'package:demo_project/models/TouristPlacesModel.dart';
import 'package:demo_project/widget/DetailScreen.dart' as detail_screen_widget; // Alias this import

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Ensure this height doesn't cause overflow
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detail_screen_widget.DetailScreen(place: touristPlaces[index]),
                ),
              );
            },
            child: Chip(
              label: Text(touristPlaces[index].name),
              avatar: CircleAvatar(
                backgroundImage: AssetImage(touristPlaces[index].image),
              ),
              backgroundColor: Colors.white,
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(right: 10)),
        itemCount: touristPlaces.length,
      ),
    );
  }
}
