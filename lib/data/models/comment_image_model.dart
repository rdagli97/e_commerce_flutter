class CommentImage {
  String? image;
  String? commentId;
  int? userId;
  int? id;

  CommentImage({
    this.image,
    this.commentId,
    this.userId,
    this.id,
  });

  CommentImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    commentId = json['comment_id'];
    userId = json['user_id'];
    id = json['id'];
  }
}
