import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

late TabController tabController;

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Please enter your Phone or Email',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: TabBar(
                            indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    color: Colors.yellowAccent.shade400),
                                insets: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 5)),
                            controller: tabController,
                            tabs: const [
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          )),
                      Container(
                        height: height * 0.6,
                        color: Colors.white,
                        child: TabBarView(
                            controller: tabController,
                            children: const [
                              CustomWidget(hintText: 'Enter Phone Number '),
                              CustomWidget(hintText: 'Enter Email ID')
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CustomWidget extends StatefulWidget {
  final String hintText;
  const CustomWidget({super.key, required this.hintText});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey.shade100,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ontap ? OtpWidget() : Container(),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: height * 0.06,
            width: double.maxFinite,
            child: TextButton(
              onPressed: () {
                setState(() {
                  ontap = true;
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow)),
              child: Text(
                ontap ? 'Login' : 'Send OTP',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('By clicking Login ,you accept our'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter OTP',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'We ve sent the code verification to your phone number',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        OtpTextField(handleControllers: (controllers) {
          
        },
          keyboardType: TextInputType.number,
          numberOfFields: 6,
          borderColor: const Color(0xFF512DA8),
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          }, // end onSubmit
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
