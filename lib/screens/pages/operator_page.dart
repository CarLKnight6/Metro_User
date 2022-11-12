import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class OperatorPage extends StatelessWidget {
  const OperatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Operator', Colors.grey[300]!),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextBold(
                  text: 'Taxi Region II', fontSize: 16, color: Colors.black),
              TextRegular(text: 'Operator', fontSize: 14, color: Colors.black),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
