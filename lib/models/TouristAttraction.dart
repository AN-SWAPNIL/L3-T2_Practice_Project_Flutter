class TouristAttraction {
  final String name;
  final List<String> images;
  final double distance;
  final double rating;
  final String duration;


  TouristAttraction({
    required this.name,
    required this.images,
    required this.distance,
    required this.rating,
    required this.duration,

  });
}
List<TouristAttraction> touristAttractions = [
  TouristAttraction(
    name: "St.Martin Island",
    images: ["assets/St.Martin Island.png", "assets/st.martin2.jpeg", "assets/st.martin3.jpeg"],
    distance: 10.5,
    rating: 4.8,
    duration: "02d:15h:20m",
  ),
  TouristAttraction(
    name: "Nilgiri",
    images: ["assets/Nilgiri.png", "assets/nilgiri2.jpg", "assets/nilgiri3.jpg"],
    distance: 9.5,
    rating: 4.2,
    duration: "01d:15h:20m",
  ),
  TouristAttraction(
    name: "Ratargul Swamp Forest",
    images: ["assets/ratargul swamp forest.png", "assets/ratargul2.jpeg", "assets/ratargul3.jpeg"],
    distance: 7.5,
    rating: 4.5,
    duration: "7h:20m",
  ),
  TouristAttraction(
    name: "Sajek Valley",
    images: ["assets/sajek valley.png", "assets/sajek2.jpeg", "assets/sajek3.jpeg"],
    distance: 12.5,
    rating: 4.7,
    duration: "01d:14h:45m",
  ),

  TouristAttraction(
    name: "Hanging Bridge of Rangamati",
    images: ["assets/Hanging Bridge of Rangamati.png", "assets/Hanging bridge of Rangamati2.jpg", "assets/hanging bridge of Rangamati3.jpg"],
    distance: 311.2,
    rating: 4.6,
    duration: "8hr:24min",

  ),
];

