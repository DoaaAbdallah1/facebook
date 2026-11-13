class PostModel {
  final String userName;
  final String profileImage;
  final String time;
  final String? description;
  final String? postImage;
  final String privacy;

  const PostModel({
    required this.userName,
    required this.profileImage,
    required this.time,
    this.description,
    this.postImage,
    required this.privacy,
  });
}