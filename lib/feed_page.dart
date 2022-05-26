import 'package:flutter/material.dart';
import 'package:spotlas/const.dart';
import 'package:spotlas/feed/feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Constant constant = Constant();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          const Text('Feed'),
          Expanded(
            child: ListView.builder(
                cacheExtent: 150,
                itemCount: constant.description.length,
                itemBuilder: (context, index) {
                  return Feed(
                    name: constant.name[index],
                    user: constant.user[index],
                    restaurant: constant.restaurant[index],
                    type: constant.type[index],
                    location: constant.location[index],
                    photo: constant.photo[index],
                    userPhoto: constant.userPhoto[index],
                    restaurantPhoto: constant.restaurantPhoto[index],
                    description: constant.description[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
