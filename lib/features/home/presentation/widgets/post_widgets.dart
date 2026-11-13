import 'package:facebook_ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';

class PostWidgets extends StatelessWidget {
  final PostModel post;

  const PostWidgets({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage(post.profileImage),
                ),

                const SizedBox(width: 10),

                // User Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        post.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${post.time} · ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grayColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Icon(
                            Icons.public,
                            size: 15,
                            color: AppColors.grayColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // More Icon
                Icon(Icons.more_horiz, size: 26, color: AppColors.blackColor),

              ],
            ),
          ),

          // description
          post.description == null
              ? SizedBox.fromSize()
              : const SizedBox(height: 10),
          post.description == null
              ? SizedBox.fromSize()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    post.description!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),

          post.postImage == null
              ? SizedBox.fromSize()
              : const SizedBox(height: 10),

          // Post Image
          post.postImage == null
              ? SizedBox.fromSize()
              : Image.asset(
                  post.postImage!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          SizedBox(height: 8),
          // end Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,

                    onPressed: () {},
                    icon: Icon(Icons.thumb_up_outlined, color: Colors.black),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined, color: Colors.black),
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,

                onPressed: () {},
                icon: Icon(Icons.bookmark_border, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.black, height: 1),
        ],
      ),
    );
  }
}
