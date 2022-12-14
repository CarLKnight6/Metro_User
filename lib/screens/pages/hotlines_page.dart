import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/buttons/hotline_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class HotlinesPage extends StatelessWidget {
  HotlinesPage({Key? key}) : super(key: key);

  List hotlines = [];

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
                contactNumber: '09980064774',
                onPressed: () async {
                  const _text = 'tel:09980064774';
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Taxi Region II Operator',
                contactNumber: '09213820660',
                onPressed: () async {
                  const _text = 'tel:09213820660';
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Tuguegarao Police Hotline',
                contactNumber: '09058005118',
                onPressed: () async {
                  const _text = 'tel:09058005118';
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            HotlineButton(
                contactName: 'Tuguegarao Rescue',
                contactNumber: '09066229924',
                onPressed: () async {
                  const _text = 'tel:09066229924';
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
