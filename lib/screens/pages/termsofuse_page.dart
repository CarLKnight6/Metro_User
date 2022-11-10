import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../widgets/appbar/normal_appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Terms of Use', Colors.grey[300]!),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextBold(
                    text: 'Terms and Conditions',
                    fontSize: 18,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "Please read these Terms and Conditions carefully before using the Ilocos Taxi Mobile Application operated by SCiVER IT Solutions\nThe Terms and Conditions serve as a binding legal agreement between the Company and you, the user of this App. By using the App, you agree that you have understood and accepted the Terms and Conditions set forth herein. If you do not agree with any of the Terms and Conditions, kindly stop and refrain from using the App. The Company reserves the right to amend and/or modify the Terms and Conditions at any time as it may deem necessary. The new terms may be displayed on-screen and you may be required to read and accept them to continue your use of the App. The following are the terms of use of the App on your Eligible Mobile Device. An Eligible Mobile Device means a compatible wireless internet enabled mobile phone or other comparable mobile device.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(text: '1. Service', fontSize: 16, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Operator is a Transport Cooperative and the users acknowledge the nature of business as such. The liability of the Operator shall be limited to those acts and omissions committed by the transport provider while online, pursuant to Section VI of Memorandum Circular No. 2015-015-A issued by the Land Transportation and Regulatory Board, which states: "
                        "\n\nVI. LIABILITY\n"
                        "The Operator shall exercise due diligence of a good father of a family in accrediting and supervising its drivers. The Operator shall be held liable for acts or omissions committed by its Drivers while online, except if the same is beyond the Operators control."
                        "The Operator reserves its right to limit or suspend your account in the event of booking cancellation or fake bookings. A booking is considered canceled for purposes of application of the penalty if after the lapse of ten (10) minutes, you decide to cancel the booking without any justifiable cause.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '2. Licenses', fontSize: 16, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "By agreeing to these Terms and Conditions, the Operator grants you a non-exclusive, non-transferable, and personal license to use the App. The App shall be limited to your personal use, and shall not be used for commercial purposes. All rights not expressly granted to you are reserved by the Company and its licensors..",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '3. Representations and Warranties',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "To the fullest extent permitted by law, the App is provided as is and without warranty. "
                        "\nYou hereby warrant that you are of legal age and possess the required legal capacity to enter into contracts. You also warrant that the information you provided is accurate and true. "
                        "\nYou further warrant and agree that: "
                        "\n* You shall not use the App for any unlawful purpose or for the commission of any act constituting a crime as defined under the pertinent laws of the Republic of the Philippines; "
                        "\n* You shall not use the App to transport hazardous chemicals or illegal drugs; "
                        "\n* You shall not use the App to make fake bookings; "
                        "\n* You shall not commit any act which tends to disrupt the operations of the App or its network; "
                        "\n* You shall not hack or send any malicious code, virus, or harmful data into the App; "
                        "\n* You agree not to copy (to the fullest extent permitted by law), decompile or reverse engineer the Software;"
                        "\n* You are duly informed and agree that by using the App, standard telecommunication rates or charges will apply:",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text:
                        '4. Consent to export of personal data and privacy policy',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "By accepting these Terms and Conditions, you consent to your personal data being exported to the Company. Your personal data will be handled and processed in accordance with the Company’s Privacy Policy. "
                        "Additionally, by using the App and the services, you acknowledge and agree that internet transmissions are never completely private or secure. You understand that any message or information you send using the App may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted. ",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '5. Charges and Payment',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "Payment for the transportation services shall be on a cash basis. Payment shall be made upon reaching the destination intended by the user. Payment shall be given to the transport provider or its employee or agent.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '6. Intellectual property, copyright and trademarks',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Company shall own all rights and interests in all related intellectual property connected with the App and its software. All content included in the App, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software, is the property of the Company and is protected by international copyright laws. The Company’s trademarks and trade name may not be used in connection with any product or service that is not that of the Company’s, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits the Company. All other trademarks not owned by the Company or its subsidiaries that appear on the App are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by the Company or its subsidiaries. Lastly, this statement of Terms and Conditions does not convey any ownership over intellectual property rights owned by the Company, over the App, or the software.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '7. Limitation of liability',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "In no event shall the Company, nor any of its officers, directors and employees, be held liable for anything arising out of or in any way connected with your use of the App, whether such liability is under contract. The Company, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of the App.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text:
                        '8. Events beyond the reasonable control of the company',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "The Company will not be liable or responsible for any failure to perform, or delay in performance of any of its obligations under these Terms and Conditions that is caused by any act or event beyond the Company’s reasonable control, including failure of public or private telecommunications networks (Event Outside Our Control). "
                        "If an Event Outside Our Control takes place that affects the performance of the Company’s obligations under these Terms and Conditions, (i) the Company’s obligations under these Terms and Conditions will be suspended and the time for performance of its obligations will be extended for the duration of the Event Outside Our Control, and (ii) the Company will use its reasonable endeavours to find a solution by which its obligations under these Terms and Conditions may be performed despite the Event Outside Our Control.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '9. Indemnification',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "You hereby indemnify the Company to the fullest extent from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '10. Entire Agreement',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "These Terms and Conditions constitute the entire agreement between the Company and you in relation to your use of the App, and supersede all prior agreements and understandings.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '11. Governing Law',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "These Terms and Conditions will be governed by and interpreted in accordance with the laws of the Republic of the Philippines.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '12. Contact us', fontSize: 16, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "If you have any questions about these Terms and Conditions, you may send an email to the Company at crm@scivercorp.com. You may also reach the Company thru their Customer Service hotline at 09980064774.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                    text: '13. Complaint Mechanism',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text:
                        "In case of complaints with regard to the service provided by the App and/or any of the Operator, you may contact the Company thru its Customer Service hotline at 09980064774. You can also send a complaint email at crm@scivercorp.com.",
                    fontSize: 12,
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
