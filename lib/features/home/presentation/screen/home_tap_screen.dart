import 'package:facebook_ui/core/constants/app_assets.dart';
import 'package:facebook_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';
import '../../data/models/story_model.dart';
import '../widgets/create_story_widget.dart';
import '../widgets/post_widgets.dart';
import '../widgets/story_widget.dart';

class HomeTapScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeTapScreen> createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen> {
  final List<StoryModel> stories = [
    StoryModel(
      userName: 'Ahmed',
      profileImage: AppAssets.image1,
      storyImage: AppAssets.model1,
    ),
    StoryModel(
      userName: 'Sara',
      profileImage: AppAssets.image2,
      storyImage: AppAssets.model1,
    ),
    StoryModel(
      userName: 'Mohamed',
      profileImage: AppAssets.image3,
      storyImage: AppAssets.model3,
    ),
  ];

final List<PostModel> posts = [
  PostModel(
    userName: 'Ahmed Mohamed',
    profileImage: AppAssets.image1,
    time: '2h',
    description: 'A beautiful day with beautiful memories ❤️',
    postImage: AppAssets.model1,
    privacy: 'public',
  ),
  PostModel(
    userName: 'Sara Ali',
    profileImage: AppAssets.image2,
    time: '5h',
    description: 'Sometimes all you need is a little sunshine and a fresh start ☀️',
    privacy: 'friends',
  ),
  PostModel(
    userName: 'Mohamed Hassan',
    profileImage: AppAssets.image3,
    time: '30m',
    description: 'Enjoying every moment! ',
    postImage: AppAssets.model3,
    privacy: 'public',
  ),
];
  

  @override
Widget build(BuildContext context) {
  return ListView(
    children: [
      // What's on your mind?
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 12,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(AppAssets.model1),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: "What's in Your Mind?",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.grayColor,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(
              Icons.collections_outlined,
              color: Color(0xFF0DE571),
              size: 25,
            ),
          ],
        ),
      ),

      Divider(height: 2, color: AppColors.grayColor),

      // Stories
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          padding: const EdgeInsets.symmetric(horizontal: 11),
          itemBuilder: (context, index) {
            return Container(
              height: 168,
              width: 110,
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 16,
              ),
              child: index == 0
                  ? const CreateStoryWidget()
                  : StoryWidget(story: stories[index - 1]),
            );
          },
        ),
      ),

      Divider(height: 2, color: AppColors.grayColor),

      // Posts
      ...posts.map(
        (post) => PostWidgets(post: post),
      ),
    ],
  );
}
}
