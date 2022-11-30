import 'package:flutter/material.dart';

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
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
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
            ),const SizedBox(height: 30,),
            const Text(
              'Please enter your Phone or Email',
              style: TextStyle(fontSize: 16),
            ),const SizedBox(height: 30,),
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
                          margin: const EdgeInsets.all( 20),
                          
                          width: double.infinity,
                          child: TabBar(
                            indicator:   UnderlineTabIndicator(
                                borderSide: BorderSide(color: Colors.yellowAccent.shade400),
                                insets: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 5)),
                            controller: tabController,
                            tabs: const [
                              Text(
                                "Phone Number",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              ),
                              Text(
                                "Email",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ],
                          )),
                      Container(height: 250, color: Colors.white,
                        child: TabBarView(
                            controller: tabController,
                            children: [CustomWidget(hintText: 'Enter Phone Number '),  CustomWidget(hintText: 'Enter Email ID')]),
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

class CustomWidget extends StatelessWidget {

  final String hintText;
  const CustomWidget({super.key,required this.hintText});

  @override
  Widget build(BuildContext context) {
      final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(padding: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
TextField(
  decoration: InputDecoration(hintText: hintText,
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(
          width: 2,  
          color: Colors.grey.shade100,),
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
),
       Container(height: height*0.06,width: double.maxFinite,
         child: TextButton(onPressed: () {
           
         },  style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
     
    )
  ),backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)
), child: const Text('Send OTP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),),
       ) ],
      ),
    );
  }
}

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('s'),
    );
  }
}
