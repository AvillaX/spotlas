import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlas/feed/main_feed.dart';
import 'package:spotlas/feed/tab.dart';

class Feed extends StatefulWidget {
  const Feed(
      {Key? key,
      required this.description,
      required this.name,
      required this.user,
      required this.restaurant,
      required this.location,
      required this.type,
      required this.photo,
      required this.userPhoto,
      required this.restaurantPhoto})
      : super(key: key);

  final String description;
  final String name,
      user,
      restaurant,
      location,
      type,
      photo,
      userPhoto,
      restaurantPhoto;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool more = true;
  late String firstPart;
  late String secondPart;
  String icon = "assets/Star_Border.svg";

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 50) {
      firstPart = widget.description.substring(0, 50);
      secondPart = widget.description.substring(50, widget.description.length);
    } else {
      firstPart = widget.user + widget.description;
      secondPart = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainFeed(
            name: widget.name,
            user: widget.user,
            restaurant: widget.restaurant,
            location: '${widget.type} • ${widget.location}',
            photo: widget.photo,
            userPhoto: widget.userPhoto,
            restaurantPhoto: widget.restaurantPhoto,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/Map.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/Comment.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/Heart_Border.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/Share.svg"),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              more = !more;
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: '${widget.user}  ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: (secondPart == "")
                            ? firstPart
                            : (more)
                                ? ('$firstPart... ')
                                : (firstPart + secondPart),
                        style: const TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: (more) ? ' more...' : ' less...',
                        style: const TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Tabb(text: 'Outdoors'),
                ),
                Tabb(text: 'Cheap'),
                Tabb(text: 'Live Music'),
                Tabb(text: 'Fancy'),
                Tabb(text: 'Romantic'),
                Tabb(text: 'Some other'),
                Tabb(text: 'Other 2'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 10, bottom: 10),
            child: Text('4 days ago'),
          )
        ],
      ),
    );
  }
}
