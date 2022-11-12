import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Privacy Policy', Colors.grey[300]!),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextBold(
                      text: 'Privacy Policy',
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextBold(
                      text:
                          'Privacy Policy of SCIVER IT Solutions and its Mobile Application.',
                      fontSize: 12,
                      color: Colors.black),
                ),
                Center(
                  child: TextRegular(
                      text:
                          'This application collects some Personal Data from its Users',
                      fontSize: 12,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Data Controller and Owner',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        'SCVER IT Solutions Inc. – 3rd Floor LC Square, Balintawak St., Laoag City, Philippines.nOwner contact email: crm@scivercorp.com',
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Types of Data Collected',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "Among the types of Personal Data that this Application collects, by itself or through third parties, there are: email address, Camera permission, Precise location permission (continuous), Approximate location permission (continuous), Microphone permission and Phone permission. \nComplete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or by specific explanation texts displayed prior to the Data collection. \nThe Personal Data may be freely provided by the User, or, in case of Usage Data, collected automatically when using this Application. \nAll Data requested by this Application is mandatory and failure to provide this Data may make it impossible for this Application to provide its services. \nIn cases where this Application specifically states that some Data is not mandatory, Users are free not to communicate this Data without any consequences on the availability or the functioning of the service. \nUsers who are uncertain about which Personal Data is mandatory are welcome to contact us. \nAny use of Cookies – or of other tracking tools – by this Application or by the owners of third party services used by this Application serves the purpose of providing the service required by the User, in addition to any other purposes described in the present document and in the Cookie Policy, if available. Users are responsible for any third party Personal Data obtained, published or shared through this Application and confirm that they have the third party's consent to provide the Data to the Owner. ",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Model and place of processing the Data',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "Methods of processing\nThe Data Controller processes the Data of Users in a proper manner and shall take appropriate security measures to prevent unauthorized access, disclosure, modification, or unauthorized destruction of the Data.\nThe Data processing is carried out using computers and/or IT enabled tools, following organizational procedures and modes strictly related to the purposes indicated. In addition to the Data Controller, in some cases, the Data may be accessible to certain types of persons in charge, involved with the operation of the site (administration, sales, marketing, legal, system administration) or external parties (such as third party technical service providers, mail carriers, hosting providers, IT companies, communications agencies) appointed, if necessary, as Data Processors by the company. The updated list of these parties may be requested from the Data Controller at any time.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(text: 'Place', fontSize: 14, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Data is processed at the Data Controller's operating offices and in any other places where the parties involved with the processing are located. For further information, please contact the Data Controller.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Retention Time', fontSize: 14, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Data is kept for the time necessary to provide the service requested by the User, or stated by the purposes outlined in this document, and the User can always request that the Data Controller suspend or remove the data.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'The use of the collected Data',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Data concerning the User is collected to allow the Owner to provide its services, as well as for the following purposes: Access to third party accounts, Managing contacts and sending messages and Device permissions for Personal Data access.\nThe Personal Data used for each purpose is outlined in the specific sections of this document.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: 'Facebook permissions asked by this Application',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "This Application may ask for some Facebook permissions allowing it to perform actions with the User's Facebook account and to retrieve information, including Personal Data, from it. This service allows this Application to connect with the User's account on the Facebook social network, provided by Facebook Inc.\nFor more information about the following permissions, refer to the Facebook permissions documentation and to the Facebook privacy policy. The permissions asked are the following:\n\nBasic information\nBy default, this includes certain User’s Data such as id, name, picture, gender, and their locale. Certain connections of the User, such as the Friends, are also available. If the User has made more of their Data public, more information will be available.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(text: 'Email', fontSize: 14, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text: "Provides access to the User's primary email address.\n\nDevice permissions for Personal Data access\nDepending on the User's specific device, this Application may request certain permissions that allow it to access the User's device Data as described below.\nBy default, these permissions must be granted by the User before the respective information can be accessed. Once the permission has been given, it can be revoked by the User at any time. In order to revoke these permissions, Users may refer to the device settings or contact the Owner for support at the contact details provided in the present document.\nThe exact procedure for controlling app permissions may be dependent on the User's device and software.\n\nPlease note that the revoking of such permissions might impact the proper functioning of this Application.\nIf User grants any of the permissions listed below, the respective Personal Data may be processed (i.e accessed to, modified or removed) by this Application. "
                            "\n\nApproximate location permission (continuous) "
                            "Used for accessing the User's approximate device location. This Application may collect, use, and share User location Data in order to provide location-based services. "
                            '\n\n'
                            "Camera permission"
                            "\nUsed for accessing the camera or capturing images and video from the device. " +
                        '\n\n' +
                        'Microphone permission' +
                        "\nUsed for accessing and recording microphone audio from the User's device." +
                        '\n\n' +
                        "Phone permission" +
                        "\nUsed for accessing a host of typical features associated with telephony. This enables, for instance, read-only access to the “phone state”, which means it enables access to the phone number of the device, current mobile network information, make calls and send SMS." +
                        '\n\n' +
                        "Precise location permission (continuous)" +
                        "\nUsed for accessing the User's precise device location. This Application may collect, use, and share User location Data in order to provide location-based services.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text:
                        'Detailed information on the processing of Personal Data',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "Personal Data is collected for the following purposes and using the following services: "
                        "\nAccess to third party accounts"
                        "\nDevice permissions for Personal Data access"
                        "\nManaging contacts and sending messages",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text:
                        'Additional information about Data collection and processing',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text: "Legal action "
                            "\nThe User's Personal Data may be used for legal purposes by the Data Controller, in Court or in the stages leading to possible legal action arising from improper use of this Application or the related services. "
                            "\nThe User declares to be aware that the Data Controller may be required to reveal personal data upon request of public authorities. " +
                        "\n\nAdditional information about User's Personal Data" +
                        "\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular services or the collection and processing of Personal Data upon request. " +
                        "\nSystem logs and maintenance"
                            "\nFor operation and maintenance purposes, this Application and any third party services may collect files that record interaction with this Application (System logs) or use for this purpose other Personal Data (such as IP Address). " +
                        "\n\nInformation not contained in this policy " +
                        "More details concerning the collection or processing of Personal Data may be requested from the Data Controller at any time. Please see the contact information at the beginning of this document. " +
                        "\n\nThe rights of Users  " +
                        "Users have the right, at any time, to know whether their Personal Data has been stored and can consult the Data Controller to learn about their contents and origin, to verify their accuracy or to ask for them to be supplemented, cancelled, updated or corrected, or for their transformation into anonymous format or to block any data held in violation of the law, as well as to oppose their treatment for any and all legitimate reasons. Requests should be sent to the Data Controller at the contact information set out above. " +
                        "This Application does not support “Do Not Track” requests. " +
                        "To determine whether any of the third party services it uses honor the “Do Not Track” requests, please read their privacy policies. " +
                        "\n\nChanges to this privacy policy"
                            "The Data Controller reserves the right to make changes to this privacy policy at any time by giving notice to its Users on this page. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom. If a User objects to any of the changes to the Policy, the User must cease using this Application and can request that the Data Controller remove the Personal Data. Unless stated otherwise, the then-current privacy policy applies to all Personal Data the Data Controller has about Users.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
