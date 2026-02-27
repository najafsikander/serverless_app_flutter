import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serverless_app/widgets/video_player_wraper.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {

  double _width = 0;
  double _height = 0;

  String? imageUrl = Constants.kProfilePicUrl;
  String? feedImgUrl = Constants.kFeedImageUrl;
  String? feedVideoUrl = Constants.kFeedVideoUrl;

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
        // Main Scrollview for the page
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              //Top row for stories
              UsersStoryRow(height: _height, width: _width, imageUrl: imageUrl),
              const Divider(
                height: 0,
              ),
              // A single user post widget
              UserPost(width: _width, height: _height, avatarImg: imageUrl,feedImg: feedImgUrl, feedVideo: feedVideoUrl, mediaType: "img",),
              UserPost(width: _width, height: _height, avatarImg: imageUrl,feedImg: feedImgUrl, feedVideo: feedVideoUrl, mediaType: "video",),
            ],
          ),
        ),
      ),
    );
  }
}

// List of stories widget
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
      // Rendering list of stories
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

// User Story Widget
class UserStoryAvatar extends StatelessWidget {
  final double width;
  final String? imageUrl;

  const UserStoryAvatar(
      {super.key, required this.width, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Margin outside the circle
    return Container(
      margin: const EdgeInsets.only(right: 10),
      // Boundary Circle
      child: CircleAvatar(
        radius: width * 0.09,
        //Container to show gradient border
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
          // Main Circle Avatar
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

// Main User Post Widget
class UserPost extends StatelessWidget {
  final double width;
  final double height;
  final String? avatarImg;
  final String? feedImg;
  final String? feedVideo;
  final String mediaType;
  const UserPost({super.key, required this.width, required this.height, required this.avatarImg, required this.feedImg, required this.feedVideo, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.7,
      // Layout of the post
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 0,
        children: [
          // User Info Area
          ListTile(
            leading: UserStoryAvatar(width: width, imageUrl: avatarImg),
            title: const Text('Username'),
            subtitle: const Text('Town, City, State'),
            dense:false,
            horizontalTitleGap: 2,     // 👈 reduce this
            minLeadingWidth: 0,        // 👈 remove default 40px
            contentPadding: const EdgeInsets.all(0),
            trailing: Icon(Icons.more_vert, size: width * 0.08,),
          ),
          // Image Area for post
          SizedBox(
            width: width,
            height: height * 0.5,
            child: mediaType == "img" ?Image.network(feedImg!,fit: BoxFit.cover,):VideoPlayerWrapper(videoUrl: feedVideo!,),
          ),
          // User interactions area: like, comment, share & bookmark
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
          // Showing received likes
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
          // Comments Preview Area
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
