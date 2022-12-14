import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/buttons/hotline_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class HotlinesPage extends StatelessWidget {
  HotlinesPage({Key? key}) : super(key: key);

  List hotlines = [
    'BFP Tuguegarao',
    'CAGELCO',
    'Command Center',
    'CDRRMO',
    'NDRRMC',
    'PNP Tuguegarao',
    'Rescue 111 1',
    'TCPGH',
    'TCTMG',
    'Tuguegarao Information Office',
    'PNP Abulug',
    'PNP Alcala',
    'PNP Allacapan',
    'PNP Amulung',
    'PNP Aparri',
    'PNP Baggao',
    'PNP Ballesteros',
    'PNP Buguey',
    'PNP Calayan',
    'PNP Camalaniugan',
    'PNP Claveria',
    'PNP Enrile',
    'PNP Gonzaga',
    'PNP Gattaran',
    'PNP Iguig',
    'PNP Lal-lo',
    'PNP Lasam',
    'PNP Pamplona',
    'PNP Penablanca',
    'PNP Piat',
    'PNP Rizal',
    'PNP Sanchez Mira',
    'PNP Solana',
    'PNP Sta. Ana',
    'PNP Sta. Prexedes',
    'PNP Sta. Teresita',
    'PNP Sto. Nino',
  ];

  List numbers = [
    '09178113474',
    '09175782437',
    '09560697141',
    '(078)3041714',
    '9111406',
    '09058005118',
    '09066229924',
    '0788441337',
    '09265378090',
    '0783771632',
    '09066426468',
    '09278602133',
    '09068323322',
    '09175720744',
    '09172032003',
    '09359869494',
    '09277500799',
    '09152299200',
    '09461932489',
    '09175146905',
    '09174724084',
    '09069723081',
    '09178896216',
    '09165177702',
    '09175991247',
    '09052011953',
    '09057955955',
    '09057969547',
    '09261712844',
    '09262968628',
    '09162458090',
    '09177722352',
    '09175932574',
    '09274352980',
    '09177713861',
    '09262591257',
    '09063466951',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Hotlines', Colors.grey[300]!),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: ListView.separated(
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: hotlines.length,
            itemBuilder: (context, index) {
              return Container(
                child: HotlineButton(
                    contactName: hotlines[index],
                    contactNumber: numbers[index],
                    onPressed: () async {
                      var _text = 'tel:${numbers[index]}';
                      if (await canLaunch(_text)) {
                        await launch(_text);
                      }
                    }),
              );
            }),
      ),
    );
  }
}
