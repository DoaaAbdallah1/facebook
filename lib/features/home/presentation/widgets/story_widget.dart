import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/models/story_model.dart';

class StoryWidget extends StatelessWidget {
   final StoryModel story;
  const StoryWidget({super.key, required this.story, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.blueColor,
            image: DecorationImage(
              image: AssetImage(story.storyImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.blueColor, width: 1),
              image: DecorationImage(
                image: AssetImage(story.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
