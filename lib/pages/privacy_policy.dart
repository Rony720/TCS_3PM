import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            // color: Colors.grey[200],
            alignment: Alignment.centerLeft, // Ensures left alignment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Ensures left alignment within the column
              children: [
                Text(
                  'AGREEMENT',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4681F4),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Introduction',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify),
                  SizedBox(height: 8.0),
                  Text(
                    '''This privacy policy (“Privacy Policy”) is issued by Inclusys Neuro Org, which includes its subsidiaries and affiliates (together, “Inclusys” or “we” or “us” or “our(s)”) in managing and operating the mobile application/website and tablet applications provided by Inclusys Neuro Org(collectively referred to as “App”).The term “user” or “users” or “you” or “your” means any individual or entity which uses, accesses the App. 
This Privacy Policy is to be read together with the Terms and Conditions of PhysioPlay App (“Terms”) and all other policies notified by us from time to time. This Privacy Policy outlines Inclusys Neuro Org’s privacy practices regarding the collection, use, disclosure, processing, transfer, storage, retention and safeguarding of the Information (defined hereinafter) provided to us by you through the App.
By accessing, using, our App and by submission of your Information (defined hereinafter), you are implicitly consenting to have your profile registered for e-learning, reporting purposes and helping Inclusys improve the research quality. You agree to be bound by the terms of this Privacy Policy and consent to the collection, storage, possession, dealing, handling, sharing, disclosure or transfer of your Information in accordance with the terms of the Privacy Policy and agree to be governed by the laws of India including but not limited to the laws applicable to data protection and privacy.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '2. Type of Information Collected: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''This Privacy Policy sets out the type of information collected from the users, including the nature of the Sensitive Personal Data or Information, the purpose, means and modes of usage of such Information and how and to whom we shall disclose or transfer such Information. You may at any time withdraw your consent for collection and use of your information including Personal Information (defined hereinafter) or Sensitive Personal Data or Information. However, please note that if you withdraw your consent, we may no longer be able to provide you with the corresponding service for which you have withdrawn your consent. 
We may collect a variety of information from you, including your name, mailing address, phone number, email address and contact preferences, including any other usage and interaction details with us or our affiliates. We may collect such information which when combined with other pieces of information available with us could reasonably allow you to be identified (“Personal Information”). We may also collect, receive, process or store certain sensitive personal data or information provided by you which may consist of, but not be limited to:
(a) App Login Credentials
(b) Name, Live Location, Email ID, Mobile Number etc.
(c) Any detail relating to (a) and (b) above as provided to us for providing the App and/or for processing or storing under lawful contract or otherwise.
((a) to (c) are hereinafter collectively referred to as “Sensitive Personal Data or Information”). Personal Information and Sensitive Personal Information are collectively referred to as “Information”.
You may be asked to provide your Information anytime you visit, access, use or browse our App. We may share Information and use it in consistent with the provisions of this Privacy Policy. We may also combine it with other Information to provide and improve our App, services, content and advertising.

''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '3 Use of Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''We use your Information to provide, analyze, administer, enhance and personalize our services and marketing efforts, to process your registration, and to communicate with you on these and other topics. 
(i)	We use your Information in order to resolve disputes; troubleshoot problems; help promote safe matching; measure consumer interest in services; inform you about offers and updates; customize your experience; detect and protect us against error, fraud and other criminal activity; enforce our Terms; and as otherwise described to you at the time of registration. We may compare and review your Information for errors, omissions and for accuracy.
(ii)	We use your e-mail to send you system e-mails about the functionality of our App.
(iii)	We use your e-mail associated with your account in order to send you newsletters and promotions in conjunction with your use of our services. 
(iv)	We may use your Information in order to provide benchmark analysis and aggregate statistics. This particular Information will be anonymized, will not contain personal identification and will not be transferred or sold to third parties in any way or format that identifies you.
(v)	We use website/App navigation data to operate and improve our App. We may also use website/App navigation data alone or in combination with your Information to provide aggregated information about Inclusys.
(vi)	We collect the IP Addresses to track when you use our App. We use IP Addresses to monitor the regions from which you navigate our App and sign-up to use our services. Your IP Address is also registered for statistical purposes and to better our advertising and layout of the App. 
(vii)	We do not transfer, sell or rent your Information to third parties for their marketing purposes other than what is stated in this Privacy Policy. We request only the information that we need to operate our services and improve our App’s user experience. We do not use your Information to create any advertising creative.
(viii)	We may also disclose or transfer your Information to any third party as a part of reorganization or a sale of the assets, division or transfer of a part or whole of us. We shall ensure that third party to which we transfer or sell our assets will have appropriate confidentiality and security measures, at least as protective as those described in this Privacy Policy, to handle your Information. You will have the opportunity to opt out of any such transfer if the new entity's planned processing of your Information differs materially from that set forth in this Privacy Policy.
(ix)	A third-party payment gateway provider may be required to collect certain financial information from you including, but not restricted to, your credit/debit card number or your bank account details (collectively referred to as “Financial Information”). All Financial Information collected from you by such third party payment gateway providers will be used only for billing and payment processes. The Financial Information collected from you is transacted through secure digital platforms of approved payment gateways which are under encryption, thereby complying with reasonably expected technology standards. The verification of the Financial Information shall be accomplished only by you through a process of authentication in which we shall have no role to play and hence, we shall bear no liability in relation to the same. We shall neither be liable nor responsible for any actions or inactions of third party payment gateway providers or any breach of conditions, representations and warranties given by them. We shall also not be obligated to mediate or resolve any dispute or disagreement between you and such third party payment service providers.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '4. Protection of Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''We use reasonable administrative, logical, physical and managerial measures to safeguard your personal information against loss, theft and unauthorised access, use and modification. These measures are designed to provide a level of security appropriate to the risks of processing your personal information. 

(i)	We do not make any of your Information available to third parties for their marketing purposes. Inclusys’s software may run on individual servers and no data given or collected is shared with other social media platforms. 
(ii)	We use robust security measures to protect data from unauthorized access, maintain data accuracy, and help ensure the appropriate use of data. When the services are accessed using the internet, data protection mechanisms are put in place. These technologies help ensure that your Information is safe, secure, and only available to you and to whom you have granted access.
(iii)	Inclusys does its utmost to secure communications and data storage in order to protect confidentiality of your Information against loss and interception by third parties. However, it is important to know that there is no zero-risk element against loss or interception by others of your Information.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '5. Storage of Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''We save your Information in our database in order to improve our App and user experience and in accordance with our Terms. If you wish that your Information be permanently deleted from our database when you stop using our services, please notify us at empower@inclusys.org 
                    Inclusys is an Indian company. If you are located outside India and choose to provide Information to us, Inclusys transfers your Information to our servers in India. India may not have the same data protection laws as the country in which you initially provided the Information. Therefore while we transfer your Information to India, we will protect it as described in this Privacy Policy. By visiting our App or providing Inclusys with your Information, you fully understand and unambiguously consent to this transfer, processing and storage of your Information in India.''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '6. Data Retention',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We retain your Personal Data for as long as is required to fulfil the activities set out in this Privacy Policy, for as long as otherwise communicated to you or for as long as is permitted by Applicable Law.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '7. Your legal rights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Under Applicable Law, you may have a number of rights, including: the right not to provide your Personal Data to us; the right of access to your Personal Data; the right to request rectification of inaccuracies; the right to request the erasure, or restriction of Processing, of your Personal Data; the right to object to the Processing of your Personal Data; the right to have your Personal Data transferred to another Controller; the right to withdraw consent; and the right to lodge complaints with Data Protection Authorities. We may require proof of your identity before we can give effect to these rights.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '8. Location Services',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''The App, its licensees and agents, may access, collect and analyze your usage of the App and other information related to your location on a regular basis through Bluetooth and Wi-Fi signals and other technologies and data for the performance of the services provided by the App and to help improve the design, functionality, performance, and content of the App. In order to collect geo-location information, the location settings must be enabled on your Device. Therefore, in some cases, the App may request that you enable the location settings.
Except in cases where any specific services requested by you require or involve personal identification, the App collects location data anonymously and in a form that does not personally identify you. By using the App, you agree and consent to transmission, collection, maintenance, processing and use of your location data and queries to provide and improve such services of the App.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '9. Cookies and similar technologies',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''We may Process your Personal Data by placing or reading Cookies and similar technologies. When you visit our App we may place Cookies onto your device, or read Cookies already on your device, subject always to obtaining your consent, where required, in accordance with Applicable Law. We use Cookies to record information about your device, your browser and in some cases, your preferences and browsing habits. We may process your Personal Data through Cookies and similar technologies, in accordance with our Cookie Policy and Privacy Policy. Additionally, you may encounter "cookies" or other similar devices on certain pages of the App that are placed by third parties. We do not control the use of cookies by third parties.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '10. Access, Correction and Deletion',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''Our App strives hard to keep its records updated and accurate with your latest Information. You shall be responsible to ensure that the Information or data you provide from time to time is and shall be correct, current and updated and you have all the rights, permissions and consents to provide such Information or data.
You may note that deletion of certain information or withdrawal of consent may lead to cancellation of your access to the App or your access to certain features and services of the App. Additionally, we may not be able to process your request of correction, updating or deletion, in case the same is not supported by valid documents or data retention is required by the applicable law or law enforcement requests or under any judicial proceedings or it is extremely difficult to implement (such as requests related to backup copies or if a new system is required to process the request or change of technical design) or risks the privacy of other users.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '11. Applicable Law',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''The validity and interpretation of this Privacy Policy shall be governed by the laws of the India.''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '12. Changes to this Privacy Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'This Policy may be amended or updated from time to time to reflect changes in our practices with respect to the Processing of Personal Data, or changes in Applicable Law. We encourage you to read this Policy carefully, and to regularly check this page to review any changes we might make in accordance with the terms of this Policy.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
              'By clicking the "Accept" button, you acknowledge that you have read, understood, and agree to our Privacy Policy.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border(
            //     top: BorderSide(color: Colors.grey[300]!),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Decline',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black), // Border color
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Curved edges
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('hasAcceptedTerms', true);
                    Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: Text('Accept',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF4681F4), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Curved edges
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
