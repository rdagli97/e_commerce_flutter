import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class ComminicateContainer extends StatelessWidget {
  const ComminicateContainer({
    super.key,
    required this.iconData,
    required this.desc,
  });
  final IconData iconData;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // icon
          Icon(
            iconData,
            color: AppColors.grey,
          ),
          // description
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: CustomText(
              text: desc,
              fontWeight: FontWeight.w600,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }
}
