import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_comment_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';

class CommentsVisitScreen extends StatelessWidget {
  const CommentsVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Comments'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                  CustomCommentTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
