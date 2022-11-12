import 'package:flutter/material.dart';

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
    );
  }
}
