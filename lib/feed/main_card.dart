import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCard extends StatefulWidget {
  const MainCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subtitle,
      required this.image,
      required this.color,
      required this.fav})
      : super(key: key);

  final String title, subtitle, image;
  final SvgPicture icon;
  final Color color;
  final void Function() fav;

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: widget.color,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(widget.image),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white.withOpacity(0.65),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: widget.icon,
            onPressed: widget.fav,
          ),
        ),
      ],
    );
  }
}
