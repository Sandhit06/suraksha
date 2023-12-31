import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kavachApp/app/style/app_color.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: SvgPicture.asset(
      //       'assets/icons/arrow-left.svg',
      //       color: Colors.white,
      //     ),
      //     onPressed: () => Get.back(),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      //extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Attendance Roster",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.black,
                          fontFamily: 'poppins',
                          height: 80 / 60,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By Aneesh & Joshita",
                      style: TextStyle(
                        fontSize: 20,
                      ) ,
                    ),

                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 35 / 100,
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/abstract-pattern-design_1053-534.avif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 65 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            padding: EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "We will send the password reset link to\nyour email.",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          height: 150 / 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                    maxLines: 1,
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "example@domain.com",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.sendEmail();
                        }
                      },
                      child: Text(
                        (controller.isLoading.isFalse)
                            ? 'Send Link'
                            : 'Loading...',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('ForgotPasswordView'),
    //     centerTitle: true,
    //   ),
    //   body: ListView(
    //     shrinkWrap: true,
    //     padding: EdgeInsets.all(16),
    //     children: [
    //       TextField(
    //         controller: controller.emailC,
    //         autocorrect: false,
    //         decoration: InputDecoration(
    //           border: OutlineInputBorder(),
    //           labelText: 'Email',
    //         ),
    //       ),
    //       Obx(
    //         () => ElevatedButton(
    //           onPressed: () async {
    //             if (controller.isLoading.isFalse) {
    //               await controller.sendEmail();
    //             }
    //           },
    //           child: Text(controller.isLoading.isFalse ? 'Send Reset Password Link' : "Loading..."),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
