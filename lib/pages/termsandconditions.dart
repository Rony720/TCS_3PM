import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionsPage extends StatelessWidget {
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
                  'Terms of Service',
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
                    'Welcome to the PhysioPlay App developed by Inclusys Neuro Org! Before you access PhysioPlay, please carefully read and accept the following terms and conditions. These terms and conditions ("TERMS") shall apply to your use of the PhysioPlay App of Inclusys Neuro Org (“Inclusys” or "we" or "us" or "our '
                    ').',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '2. Definitions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''Unless otherwise expressly provided, the following definitions will apply to  the capitalized terms:
(i)	“App” means mobile application/website and tablet application provided by ,owned and maintained by Inclusys;
(ii) “Confidential Information” means information provided by one party to the other including in written, graphic, recorded, machine readable or other form concerning the business, clients, suppliers, finances and other areas of the disclosing party’s business or products,  but does not include information in the public domain other than through the default of the party disclosing the information, information required to be disclosed by any court or regulatory authority, or any information already in the possession or control of the disclosing party;
(iii)	“Intellectual Property Rights” means and includes patents, trademarks, service marks, trade names, designs, copyrights, rights of privacy and publicity and other forms of intellectual or industrial property, know how, trade secrets, any other protected rights or assets and any licenses and permissions in connection therewith, in each and every part of the world and whether or not registered or registrable and for the full period thereof, and all extensions and renewals thereof, and all applications for registration in connection with the foregoing;
(iv) “Representative “means any director, officer, employee, agent or professional advisor of Inclusys;
(v) “Services” means the personalised services provided by Inclusys to enable its users to access PhysioPlay  including all  features and functionalities, recommendations and reviews, the website, app and user interfaces as well as all contents and software associated with our services  streamed over the internet to certain internet connected televisions, computers, mobiles and other devices( “Level Ready Devices”);
(vi) “You” or “you” or “your” refers to the individual/user who uses the Services.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '3 Acceptance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'By clicking "I Accept" below, you acknowledge that you have read, understood, and agree to be bound by these Terms. You further represent that you are of legal age to enter into a binding agreement or have obtained parental or guardian consent. If you do not agree to these Terms, please click "I Decline" and exit the App.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '4	Services and Specifications',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'A description of  PhysioPlay is available in the App.  We reserve the right to vary or withdraw any of the Services described in the App without any notice.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '5. Usage guidelines',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''5.1	To use the Services, you must have internet access and a compatible mobile device.
5.2	You will ensure a clear and safe play area free from obstacles. 
5.3	It is advisable to play the game with a support system nearby. This could be anyone who can watch over your physical environment and assist you, ensuring your safety as you immerse yourself in the experience. 
5.4	Regular breaks are recommended to mitigate potential side effects such as discomfort, eye strain, or fatigue, which may be experienced during prolonged gameplay. If you experience any of them, stop using the application immediately. 
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '6. License Grant and Proprietary Rights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''6.1 Inclusys hereby grants you a personal, limited, non-transferable, non-exclusive and revocable license (without the right to assign, transfer or sublicense except as may be specifically permitted in these Terms) to use the App and the software in respect of the Services for the sole purpose of accessing the Services.
6.2	 Except as expressly provided in these Terms, no license, express or implied, is granted or intended to be granted to you and we reserve all rights not expressly hereby granted to you. 
6.3	 All Intellectual Property Rights in the contents of the App is and shall remain, the  Intellectual Property of Inclusys or its licensors, whether adapted, written for or customized for you or not.
6.4	 Any breach of this Clause 5 or abuse of the policies of Inclusys will result in the immediate and permanent cessation of access to all Inclusys servers and Services; and of your license to use the App; and will be pursued to the fullest extent permitted under all Applicable Laws, treaties, and conventions. 
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '7. Access outside India',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Inclusys makes no representation that the content in the App is appropriate to be used or accessed outside the Republic of India. Any users who use or access the App from outside the Republic of India, do so at their own risk and are responsible for compliance with the laws of such jurisdiction. These Terms do not constitute, nor may these Terms be used for or in connection with any promotional activities or solicitation by anyone in any jurisdiction in which such promotional activities or solicitation are not authorized or to any person to whom it is unlawful to promote or solicit.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '8. Disclaimer and Warranties',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'The contents in the App is created by experts and goes through strict quality checks and provided "as is" and without warranties of any kind, express or implied. Inclusys disclaims all warranties, including, but not limited to, warranties of merchantability, fitness for a particular purpose, and non-infringement. Inclusys does not warrant that the App will function uninterrupted, error-free, or virus-free or any representations regarding the availability and its performance or any of the websites to which links may be provided in the App. We do not make any commitment that the contents in the App will be compatible with or operate with your software or hardware.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '9. Cookies',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We use cookies to store and gather certain data to enable a smoother user experience. ',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '10. Limitation of Liabilities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''10.1	Inclusys, its affiliates, directors, officers, employees, agents, and representatives shall not be held responsible for any incidents, accidents, injuries, damages, or even loss of life that may occur while using the App. By accessing the App, the user assumes and understands all risks and liabilities associated with the App.
10.2	Inclusys, its affiliates, directors, officers, employees, agents, and representatives are in no way responsible for any physical or mental health issues including but not limited to discomfort, motion sickness, tripping hazards etc. which may arise while using the App.
10.3	Except as expressly set forth in these Terms, neither party shall be liable for any indirect, consequential, exemplary, special, incidental, or punitive damages incurred or suffered by the other party arising out of or in connection with these Terms. Although Inclusys aims to provide the Services to the highest standards of the industry, neither Inclusys, nor our Representatives, accept any liability for (i) any loss or corruption of data, or (iii) any loss of profit, revenue or goodwill arising out of or in connection with these Terms.
10.4	You shall keep Inclusys saved and harmless from and against any and all third party claims, demands, actions, suits or cause of actions, including any claims related to infringement of any third party intellectual property rights or breach of any third party’s confidential information, arising from any act or omission committed by you pursuant to these Terms. 
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '11. Indemnification',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You agree to indemnify, defend and hold Inclusys, its affiliates, its content providers and their Representatives harmless from and against any and all claims, liability, losses, damages, costs and expenses (including reasonable legal fees on a solicitor and client basis) incurred by us as a result of or in connection with any breach or alleged breach by you or anyone acting on your behalf of any of these Terms.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '12. Confidentiality',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''12.1	Each party agrees to preserve the confidential and secret nature of the other’s Confidential Information and to use the Confidential Information of the other party only for the purpose for which it is provided. Except for the purposes of fulfilling its obligations under these Terms or as permitted by these Terms, the receiving party shall not possess, access, use or disclose any of the other party’s Confidential Information without its written consent, and shall take the same measures to prevent disclosure of the other’s Confidential Information as it takes to protect its own Confidential Information, and in no event take less than commercially reasonable efforts. 
12.2	Inclusys will disclose Confidential Information received from the user only to such of its employees, agents, contractors and advisors who need to know the same in furtherance of these Terms, who have been notified of the confidential nature of the said Information and are bound by signed written confidentiality agreements containing terms substantially similar to those contained in this Clause. Each party shall be responsible for any breach of confidentiality by its employees, agents, contractors and advisors.  
12.3	On receipt of a request from the other party, the former party shall destroy or return all Confidential Information received from the other party and confirm the same in writing.
12.4	The obligations under this Clause will survive the termination of these Terms. 
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '13. Assumption of Risk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You understand and acknowledge that accessing the App involves certain risks, including but not limited to physical exertion, sensory stimulation, and potential discomfort.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '14. Termination',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '''14.1	We shall be entitled to terminate these Terms and cease to provide you with any Services with immediate effect in the event of your (i) misconduct, fraudulent act; and/or (ii) breach of these Terms. 
14.2	We reserve the right to monitor the IP addresses that are used to access the App and if you are is found to be in contravention of the access rules (set out in Clauses 5.1, 5.2 and 5.3), we may terminate your access to the App.  
14.3	On termination of these Terms, Clause 5 (Intellectual property rights), Clause 9 (Liability) and Clause 11 (Confidentiality) shall continue notwithstanding such termination.
''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '15. Modifications to Terms',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Inclusys reserves the right to modify, update, or change these terms and conditions at any time without prior notice. Continued use of the App after such modifications constitutes your acceptance of the revised terms. ',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '16. Privacy Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We respect your Privacy. Please refer to our Privacy Policy for more information.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '17. Waiver',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'No provision in these Terms will be deemed waived and no breach is excused, unless such waiver or consent is in writing and signed by us. Our consent to, or waiver of your breach, whether expressed or implied, will not constitute consent to, waiver of, or excuse for any other different or subsequent breach',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '18. Governing Law & Jurisdiction',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'These Terms of Sale shall be governed by and construed in accordance with Indian law and courts at Cochin District (Kerala) shall have exclusive jurisdiction with respect of any dispute or other action arising as a result of, in relation to or regarding these Terms to the exclusion of any other court that may have jurisdiction in the matter.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '19. Entire Agreement',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'These Terms together with the Privacy Policy, Terms of Use and all other policies of Inclusys constitutes the entire agreement between the parties on the subject matter hereof, and supersedes all prior or contemporaneous written or verbal agreements and understandings with you in connection therewith.  If any provision of these Terms is held by a court of competent jurisdiction to be invalid, void or unenforceable, the remaining provisions shall, nevertheless, continue in full force and effect without being impaired or invalidated in any way.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '20. Grievance Redressal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You may submit any grievance with respect to the App, or the Services, including with respect to any abuse on the App , any discrepancies or grievances with respect to access or usage of the App in violation of these Terms by any person, to the Grievance Officer at: operations@inclusys.org',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'By clicking the "Accept" button, you acknowledge that you have read, understood, and agree to be bound by the Terms and Conditions.',
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/privacy');
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
