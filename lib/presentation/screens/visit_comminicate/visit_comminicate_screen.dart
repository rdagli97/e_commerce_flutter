import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_comminicate/comminicate_container.dart';
import 'package:provider/provider.dart';

class VisitComminicateScreen extends StatefulWidget {
  const VisitComminicateScreen({super.key});

  @override
  State<VisitComminicateScreen> createState() => _VisitComminicateScreenState();
}

class _VisitComminicateScreenState extends State<VisitComminicateScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Comminicate'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ComminicateContainer(
                iconData: Icons.phone, desc: '${userRead?.phone}'),
            AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
            ComminicateContainer(
                iconData: Icons.email, desc: '${userRead?.email}'),
            AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
            ComminicateContainer(
              iconData: Icons.location_on,
              desc: '${userRead?.adress}',
            ),
          ],
        ),
      ),
    );
  }
}
