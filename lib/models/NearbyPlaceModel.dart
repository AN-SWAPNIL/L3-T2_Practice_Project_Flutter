class NearbyPlaceModel {
  final String name;
  final String duration;
  final double rating;
  final double distance;
  final List<String> images;

  NearbyPlaceModel({
    required this.name,
    required this.duration, // Added
    required this.rating, // Added
    required this.distance, // Added
    required this.images, // Added
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    name: "Ahsan Manzil", // Added
    duration: "1 hour", // Added
    rating: 4.5, // Added
    distance: 2.5, // Added
    images: ["assets/ahsan.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Bichanakandi", // Added
    duration: "2 hours", // Added
    rating: 4.7, // Added
    distance: 5.0, // Added
    images: ["assets/Bichanakandi.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Foy's Lake", // Added
    duration: "1.5 hours", // Added
    rating: 4.4, // Added
    distance: 3.0, // Added
    images: ["assets/foyslake.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Nuhas Polli", // Added
    duration: "2.5 hours", // Added
    rating: 4.6, // Added
    distance: 6.0, // Added
    images: ["assets/nuhaspolli.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Boga Lake", // Added
    duration: "3 hours", // Added
    rating: 4.8, // Added
    distance: 7.5, // Added
    images: ["assets/bogalake.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Cox's Bazar",
    duration: "01d:14h:45m",
    rating: 4.2,
    distance: 9.5,
    images: ["assets/cox.jpeg"],

  ),
  NearbyPlaceModel(
    name: "Lalakhal", // Added
    duration: "2 hours", // Added
    rating: 4.7, // Added
    distance: 5.5, // Added
    images: ["assets/lalakhal.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Golden Temple", // Added
    duration: "1 hour", // Added
    rating: 4.5, // Added
    distance: 2.0, // Added
    images: ["assets/golden_temple.jpg"], // Modified
  ),
  NearbyPlaceModel(
    name: "Lalbagh Fort", // Added
    duration: "1.5 hours", // Added
    rating: 4.6, // Added
    distance: 3.5, // Added
    images: ["assets/Lalbagh.jpg"],
  ),
  NearbyPlaceModel(
    name: "St.Martin Island",
    duration: "02d:15h:20m",
    rating: 4.8,
    distance: 10.5,
    images: ["assets/St.Martin Island.png", "assets/st.martin2.jpeg", "assets/st.martin3.jpeg"],

  ),
  NearbyPlaceModel(
    name: "Nilgiri",
    duration: "02d:15h:20m",
    rating: 4.2,
    distance: 9.5,
    images: ["assets/Nilgiri.png", "assets/nilgiri2.jpg", "assets/nilgiri3.jpg"],

  ),
  /*NearbyPlaceModel(
      name: "Ratargul Swamp Forest",
      duration: "7h:20m",
      rating: 4.5,
      distance: 7.5,
      images: ["assets/images/ratargul swamp forest.png", "assets/images/ratargul2.jpeg", "assets/images/ratargul3.jpeg"],

  ),*/
  NearbyPlaceModel(
    name: "Sajek Valley",
    duration: "01d:14h:45m",
    rating: 4.7,
    distance: 12.5,
    images: ["assets/sajek valley.png", "assets/sajek2.jpeg", "assets/sajek3.jpeg"],

  ),
  NearbyPlaceModel(
    name: "Debotakum",
    duration: "01d:14h:45m",
    rating: 4.2,
    distance: 9.5,
    images: ["assets/debotakhum.jpg"],

  ),
  /*NearbyPlaceModel(
    name: "Hanging Bridge of Rangamati",
    duration: "8hr:24min",
    rating: 4.6,
    distance: 311.2,
    images: ["assets/images/Hanging Bridge of Rangamati.png", "assets/images/Hanging bridge of Rangamati2.jpg", "assets/images/hanging bridge of Rangamati3.jpg"],
  ),*/
];
