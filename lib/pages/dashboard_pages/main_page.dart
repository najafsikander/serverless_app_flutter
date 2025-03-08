import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  double _width = 0;
  double _height = 0;
  String? imageUrl =
      'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png';

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
      child: SizedBox(
        width: _width,
        height: _height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsersStoryRow(height: _height, width: _width, imageUrl: imageUrl)
          ],
        ),
      ),
    );
  }
}

class UsersStoryRow extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  const UsersStoryRow({super.key, required this.height, required this.width, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return UserStoryAvatar(
                width: width, imageUrl: imageUrl);
          }),
    );
  }
}


class UserStoryAvatar extends StatelessWidget {
  final double width;
  final String? imageUrl;

  const UserStoryAvatar(
      {super.key, required this.width, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: width * 0.09,
        // backgroundColor: Colors.redAccent,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(//add colors to colors array
              colors: [
                Colors.red,
                Colors.yellow,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            radius: width * 0.08,
            backgroundColor: Theme.of(context).primaryColorLight,
            child: Text(imageUrl == null ? 'User' : ''),
          ),
        ),
      ),
    );
  }
}
