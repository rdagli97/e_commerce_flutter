class CommentImageModel {
  String? image;
  String? commentId;
  int? userId;
  int? id;

  CommentImageModel({
    this.image,
    this.commentId,
    this.userId,
    this.id,
  });

  CommentImageModel.fromJson(Map<String, dynamic> json) {
    image = json['comment_images']['image'];
    commentId = json['comment_images']['comment_id'];
    userId = json['comment_images']['user_id'];
    id = json['comment_images']['id'];
  }
}
