import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    TextEditingController EmailEditingController = TextEditingController();

    TextEditingController PhoneNumberEditingController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 300,
          width: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text('data'),
              TabBar(
                controller: tabController,
                tabs: [
                Tab(text: 'EMail'),
                Tab(
                  text: 'phone',
                )
              ]),
              SizedBox(height: 200,
                child: TabBarView(
                  
                  controller: tabController,
                  children: [Text('data'), Text('data222')]),
              )
            ],
          ),
        ),
      ),
    );
  }
}







         // const Text(
              //   'Login',
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              // ),
              // const Text(
              //   'Please enter your Phone or Email',
              //   style: TextStyle(fontWeight: FontWeight.w600),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),











   // SizedBox(
              //   height: 30,
              // ),
              // TextButton(onPressed: () {}, child: Text('Sent'))