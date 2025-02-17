import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventual/src/routes/app_routes.dart';
import 'package:inventual/src/utils/contstants.dart';

class DashboardHeaderSection extends StatelessWidget {
  final Function openDrawer;

  const DashboardHeaderSection({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 10,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    openDrawer();
                  },
                  child: Image.asset(
                    "assets/images/avatar/user_profile.png",
                    width: 60,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Shane Watson",
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorSchema.titleTextColor)),
                    ),
                    Text(
                      "Admin",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              color: ColorSchema.subTitleTextColor,
                              fontSize: 16)),
                    )
                  ],
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Get.toNamed(AppRoutes.notification);
              },
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue.shade50.withOpacity(0.5)),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: ColorSchema.primaryColor,
                      size: 30,
                    ),
                  ),
                  Positioned(
                      right: 14,
                      top: 14,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
