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
              TextRegular(
                  text:
                      "A. History of Cagayan Valley Kalinga Apayao Transport Cooperative CVKATCO It was in the year 2007 when LTFRB Dir. Flory Cuesta allowed the operation of Van to be used as public utility to cater passengers to all routes touching Tuguegarao City which composed of 17 routes with 20 different associations. The operationof PUVs has been tuff and continued by the next management LTFRB director Dir. Benito Ceasar, transport industry was shaken by the Memorandum Circular from the LTFRB for the implementation of total face-out to all old model vans/change-unit. Since the implementation was strictly executed, some transport operators grabbed the opportunity to Bank Car Loans to replace their unit provided to pay the unit in 5 years. Due to this implementation, all transport associations formed their federation of associations in Region 02 in order to have their voice to be heard in all concern agencies like LTFRB, LTO, and DOTr. These different associations have their own way of generating funds for the association benefits to its members. The Cagayan Valley Transport Federation was then created in 2016 which composed of 27 associations with different Chair leaders until the leadership of Dir. Nasruding Talipasan. In the year 2017, Memorandum Circulars have been updated and new guidelines have been issued for study and application. Transport industrywas again vigilant with the upcoming implementation of the new OFG guidelines when Dir. Edward Cabase replaced Dir. Talipasan in 2018 for the strict implementation of the new rulings until the OTC/LTFRB required the transport operations to form a cooperative to meet the OFG guidelines for Modernization process. Almost all associations who have been sleep was awaken for the implementation of Public Utility Vehicle Modernization Program PUVMP. Since there were different interpretation by each associations that's why there were many cooperatives that had been registered to CDA hoping to be included in the consolidation process of all the vehicles in preparation to the June 30, 2020 implementation of OFG guidelines that is why we formed our cooperative in the name of our different association leaders who founded the KAGAYAN VALLEY KALINGA APAYAO TRANSPORT COOPERATIVE CVKATCO which was officially registered to CDA in January 7, 2019.",
                  fontSize: 12,
                  color: Colors.black),
              const SizedBox(height: 20),
              TextRegular(
                  text:
                      "Mission\nTo create and maintain a safe and convenient transport service for travelers to and around Region of high quality service to its members, excellent transportation programs and services.",
                  fontSize: 12,
                  color: Colors.black),
              const SizedBox(height: 20),
              TextRegular(
                  text:
                      "Vision\nOur members and passengers will view the transportation departmental organization as one that providing prompt and reliable services on a continues basis to the public. To promote the growth benefits of its members and to achieve the best performing transport service in the region.",
                  fontSize: 12,
                  color: Colors.black),
              const SizedBox(height: 20),
              TextRegular(
                  text:
                      "Core Values\nC - Competence\nV - Viable\nK - Knowledgeable\nA - Accountability",
                  fontSize: 12,
                  color: Colors.black),
              const SizedBox(height: 20),
              TextRegular(
                  text:
                      "Social Goals\nImprove the quality of public transport service in line with the present utility vehicle modernization.",
                  fontSize: 12,
                  color: Colors.black),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
