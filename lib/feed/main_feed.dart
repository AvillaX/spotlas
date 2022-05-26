import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas/feed/main_card.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({
    Key? key,
    required this.name,
    required this.user,
    required this.restaurant,
    required this.location,
    required this.photo,
    required this.userPhoto,
    required this.restaurantPhoto,
  }) : super(key: key);

  final String name,
      user,
      restaurant,
      location,
      photo,
      userPhoto,
      restaurantPhoto;

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 650,
          child: PageView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.photo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          height: 650,
          padding:
              const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainCard(
                title: widget.user,
                subtitle: widget.name,
                image: widget.userPhoto,
                color: Colors.red.withOpacity(0.8),
                icon: SvgPicture.asset(
                  "assets/Options.svg",
                  color: Colors.white,
                ),
                fav: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: MainCard(
                  title: widget.restaurant,
                  subtitle: widget.location,
                  image: widget.restaurantPhoto,
                  color: Colors.white,
                  icon: SvgPicture.asset(
                    (checked) ? "assets/Star.svg" : "assets/Star_Border.svg",
                    color: Colors.white,
                  ),
                  fav: () {
                    setState(() {
                      checked = !checked;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
