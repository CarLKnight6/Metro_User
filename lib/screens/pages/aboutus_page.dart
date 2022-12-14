import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Developer', Colors.grey[300]!),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/SCIVER LOGO.png',
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextRegular(
                            text:
                                'SCIVER IT SOLUTIONS is one the country’s leading Advanced Systems Research and Development firm focused on creating evolving assets of IT systems and platforms, which are integrated set of programs and solutions that drive businesses nowadays.',
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 20,
                        ),
                        TextRegular(
                            text:
                                'Focused on research and development by providing vision, strategy, and outstanding implementation in system solutions, SCIVER IT SOLUTIONS is passionate in bringing exceptional service, efficient workforce, and customer satisfaction to keep partners staying ahead of the curve.',
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 20,
                        ),
                        TextRegular(
                            text:
                                "Backed by a team of expert programming engineers, SCIVER IT SOLUTIONS confidently delivers quality assured likewise excellent customer support service to meet every partner’s needs above and beyond.",
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 20,
                        ),
                        TextRegular(
                            text:
                                "SCIVER IT SOLUTIONS partners with both government entities and private companies in the Philippines as the technology arm to help fulfill business objectives and to keep innovating with software solutions.",
                            fontSize: 12,
                            color: Colors.black),
                        const SizedBox(
                          height: 20,
                        ),
                        TextRegular(
                            text: "Contact Number: 09980064774",
                            fontSize: 12,
                            color: Colors.black),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
