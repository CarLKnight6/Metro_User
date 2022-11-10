import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/buttons/hotline_button.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class HotlinesPage extends StatelessWidget {
  const HotlinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Hotlines', Colors.grey[300]!),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HotlineButton(
                contactName: 'SCIVER IT Solutions',
                contactNumber: '09090104355',
                onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Taxi Region II Operator',
                contactNumber: '09090104355',
                onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Ilocos Police Hotline',
                contactNumber: '09090104355',
                onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Ilocos Ambulance Hotline',
                contactNumber: '09090104355',
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
