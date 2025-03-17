import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  double _width = 0;
  double _height = 0;
  String? imageUrl =
      'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png';
  String? feedImgUrl = 'https://images.pexels.com/photos/547114/pexels-photo-547114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              UsersStoryRow(height: _height, width: _width, imageUrl: imageUrl),
              const Divider(
                height: 0,
              ),
              UserPost(width: _width, height: _height, avatarImg: imageUrl,feedImg: feedImgUrl,),
            ],
          ),
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

class UserPost extends StatelessWidget {
  final double width;
  final double height;
  final String? avatarImg;
  final String? feedImg;
  const UserPost({super.key, required this.width, required this.height, required this.avatarImg, required this.feedImg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 0,
        children: [
          ListTile(
            leading: UserStoryAvatar(width: width, imageUrl: avatarImg),
            title: const Text('Username'),
            subtitle: const Text('Town, City, State'),
            dense:false,
            contentPadding: const EdgeInsets.all(0),
            trailing: Icon(Icons.more_vert, size: width * 0.08,),
          ),
          SizedBox(
            width: width,
            height: height * 0.5,
            child: Image.network(feedImg!,fit: BoxFit.cover,),
          ),
          Container(
            width: width,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 15,
                  children: [
                    // IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.heart,))
                    InkWell(child: const FaIcon(FontAwesomeIcons.heart),onTap: () {},),
                    InkWell(child: const FaIcon(FontAwesomeIcons.comment),onTap: () {},),
                    InkWell(child: const FaIcon(FontAwesomeIcons.paperPlane),onTap: () {},),
                  ],
                ),
                InkWell(child: const FaIcon(FontAwesomeIcons.bookmark),onTap: () {},),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                FaIcon(FontAwesomeIcons.solidHeart,size: 15,),
                Text("532 Likes")
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text("paula_johnson", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text("lorem ipsum dolor sit amet")
              ],
            ),
          )
        ],
      ),
    );
  }
}
