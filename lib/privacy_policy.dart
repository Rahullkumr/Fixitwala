import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          """
Fixitwala privacy policy has been compiled to better serve customers who are concerned with how their 'Personally Identifiable Information' (PII) is being used online. Pll is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website. If you do not agree to the policy, please do not use the Kaamwala website or our mobile application.


**Note**: Our privacy policy may change at any time without prior notification. To make sure that you are aware of any changes, kindly review the policy periodically.


**What personal information do we collect from the people that use our app?**

When ordering or registering on our application, as appropriate, you may be asked to enter your name, email address, communication address, mobile number, Contact Numbers or other details to help you with a good service experience.


**When do we collect information?**

We collect information from you when you register on our application or request for a service or product on our smartphone application.


**How do we use your information?**

We may use the information we collect from you when you register, make a request, sign up for our newsletter, respond to a survey or marketing communication, or use certain other site features in the following ways:

1.
  To personalize user experience and to allow us to deliver the type of content and product offerings in which you are most interested.
2.
  To allow us to better service you in responding to your customer service requests.
3.
  To administer a contest, promotion, survey, or other platform features.
4.
  To quickly process your transactions.


**How do we protect visitor information?**

We do not use vulnerability scanning and/or scanning to PCI standards. We use regular Malware Scanning.

Your personal information is contained behind secured networks and is only accessible by a limited number of persons
who have special access rights to such systems and are required to keep the information confidential.
In addition, all sensitive/credit/payment information you supply is encrypted via Secure Socket Layer (SSL) technology.


**Third Party Disclosure**

We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information.


**Third party links**

We do not include or offer third party products or services through any external links on our website.


**How does our app handle do not track signals?**

We honor do not track signals and do not track, plant, cookies or use advertising when a Do Not Track (DNT) browser mechanism is in place.

We also agree to the individual redress principle, which requires that individuals have a right to pursue legally enforceable rights against data collectors and processors who fail to adhere to the law. This principle requires not only those individuals have enforceable rights against data users, but also that individuals have recourse to courts or a government agency to investigate and/or prosecute noncompliance by data processors
""",
        ),
      ),
    );
  }
}
