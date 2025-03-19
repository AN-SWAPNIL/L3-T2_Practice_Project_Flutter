import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:demo_project/pages/ViewDetailsPage.dart';
import 'package:demo_project/widget/Distance.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../homepage/favorites_provider.dart';
import '../models/NearbyPlaceModel.dart';
import 'Directions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NearbyPlaceDetailsPage extends StatefulWidget {
  final NearbyPlaceModel place;

  const NearbyPlaceDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  _NearbyPlaceDetailsPageState createState() => _NearbyPlaceDetailsPageState();
}

class _NearbyPlaceDetailsPageState extends State<NearbyPlaceDetailsPage> {
  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(23.8103, 90.4125), // Coordinates for Dhaka, Bangladesh
    zoom: 11.5,
  );

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  Future<void> _ratePlace() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    double? rating;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Rate this place'),
          content: RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            itemSize: 40,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              rating = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (rating != null) {
                  _submitRating(userId, rating!);
                }
              },
              child: const Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitRating(String userId, double rating) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).collection('ratings').doc(widget.place.name).set({
        'rating': rating,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating submitted successfully!')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit rating.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    print("Place Details: ${widget.place.name}, ${widget.place.distance}, ${widget.place.duration}");
    final provider = Provider.of<FavoritesProvider>(context);
    final size = MediaQuery.of(context).size;
    final userId = FirebaseAuth.instance.currentUser?.uid;


    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.infinity,
              child: Stack(
                children: [
                  FlutterCarousel.builder(
                    itemCount: widget.place.images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(widget.place.images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: size.height * 0.38,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20,
                            icon: const Icon(Ionicons.chevron_back),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              provider.toggleFavorite(widget.place, userId!);
                            },
                            icon: Icon(
                              provider.isExist(widget.place)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.place.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                Text(
                  "${widget.place.distance.toStringAsFixed(1)} km",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.place.duration,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Started in", // Replace with relevant detail if needed
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Spacer(),
                /*Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    onPressed: () {
                      // Handle chat or communication action if needed
                    },
                    iconSize: 27,
                    icon: const Icon(Ionicons.chatbubble_ellipses_outline),
                  ),
                ),*/
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.place.rating.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      icon: Icon(
                        Ionicons.star,
                        color: Colors.yellow[800],
                        size: 25,
                      ),
                      onPressed: _ratePlace,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                image: const DecorationImage(
                  image: AssetImage('assets/map2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // child: GoogleMap(
              //   initialCameraPosition: _initialCameraPosition,
              //   onMapCreated: (controller) => _googleMapController = controller,
              //   markers: {
              //     if (_origin != null) _origin!,
              //     if (_destination != null) _destination!,
              //   },
              //   polylines: {
              //     if (_info != null)
              //       Polyline(
              //         polylineId: const PolylineId('overview_polyline'),
              //         color: Colors.blue,
              //         width: 5,
              //         points: _info!.polylinePoints
              //             .map((point) => LatLng(point.latitude, point.longitude))
              //             .toList(),
              //       ),
              //   },
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/map2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Distance(),
            const SizedBox(height: 20),
           /* ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewDetailsPage(placeName: widget.place.name),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
              ),
              child: const Text(" "),
            ),*/
          ],
        ),
      ),
    );
  }
}