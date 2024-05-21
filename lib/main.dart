import 'package:flutter/material.dart';
import 'package:flutter_project/model/org_model.dart';
import 'package:flutter_project/model/user_model.dart';
import 'package:flutter_project/provider/auth_provider.dart';
import 'package:flutter_project/provider/donation_provider.dart';
import 'package:flutter_project/screens/donations/donation.dart';
import 'package:flutter_project/screens/home/home.dart';
import 'package:flutter_project/screens/intro-screen/intro.dart';
import 'package:flutter_project/screens/organization-details/orgdetails.dart';
import 'package:flutter_project/screens/sign-in/signin.dart';
import 'package:flutter_project/screens/sign-up/completedetails.dart';
import 'package:flutter_project/screens/sign-up/signup.dart';
import 'package:flutter_project/screens/user_profile/user_profile_screen.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserModel>(create: (context) => UserModel()),
          ChangeNotifierProvider<DonationProvider>(
              create: (context) => DonationProvider()),
          ChangeNotifierProvider(create: (context) => UserAuthProvider(),)
        ],
        child: MaterialApp(
          title: 'Elbi Donation System',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 0, 97, 10)),
            useMaterial3: true,
          ),
          onGenerateRoute: (setting) {
            if (setting.name == '/') {
              return MaterialPageRoute(
                  builder: (context) => const IntroScreen());
            } else if (setting.name == '/sign-up') {
              return MaterialPageRoute(
                  builder: (context) => const SignUpScreen());
            } else if (setting.name == '/sign-in') {
              return MaterialPageRoute(
                  builder: (context) => const SignInScreen());
            } else if (setting.name == '/home') {
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
            } else if (setting.name == '/org-details') {
              var orgname = setting.arguments as Organizations;
              return MaterialPageRoute(
                  builder: (context) => OrgDonation(org: orgname));
            } else if (setting.name == '/forgot-password') {
              return MaterialPageRoute(
                  builder: (context) => const Placeholder());
            } else if (setting.name == '/complete-profile') {
              var args = setting.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (context) => const CompleteDetailsScreen(),
                  settings: RouteSettings(arguments: args));
            } else if (setting.name == '/user-profile') {
              return MaterialPageRoute(
                  builder: (context) => const ProfileScreen());
            } else if (setting.name == '/donations') {
              return MaterialPageRoute(
                  builder: (context) => const DonationsScreen());
            }else {
              return MaterialPageRoute(
                  builder: (context) => const Placeholder());
            }
          },
        ));
  }
}
