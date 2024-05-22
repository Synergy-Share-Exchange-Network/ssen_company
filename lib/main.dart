import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/intermediate.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/responsive.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_award_and_recognition.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_bank_account.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_key_figure.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_partners.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_product.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_service.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_testimonial.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_why_invest.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit_detail_profile.dart';
import 'package:ssen_company/screens/login.dart';
import 'package:ssen_company/services/app_routes.dart';
import 'package:ssen_company/services/theme/app_theme.dart';
import 'package:ssen_company/widget/company%20detail%20widget/about_us_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/contact_us_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/product_and_service_widget.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        title: 'Synegy Share Exchange Network',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: SappTheme.lightTheme,
        darkTheme: SappTheme.darkTheme,
        // home: Intermediate(),
        // home: AddPost(),
        // home: Anlaytics(),
        // home: EditProfile(),
        // home: MainPage(),
        // home: CustomDesktopResponsive(indexfromCall: 0, widget: null,),
        // home:const DesktopResponsive(indexfromCall: 0),
        // home: SubscriberDetailPage(),
        // home: verticlScrollableBankAccount(),
        // home: EditAddTestimonial(),
        // home: Companyprofile(),
        // home:  EditTestimonial(title: 'testimonial',),
        // home: ShareHolderProfile(),
        // home: AnnouncementPage(),
        // home: Product(),
        // home: PostDetail(),
        // home: Responsive(),
        // home: Setting(),
        // home: EditShare(),
        // home: PendingRequest(),
        // home: SignUp(),
        // home: EditDetailCompanyProfile(),
        // home: EditAwardAndRecognition(),
        // home: EditBankAccount(bankAccount: ['bankAccount']),
        // home: EditKeyFigure(keyFigure: []),
        // home: EditTestimonial(testmonyies: []),
        // home: EditWhyInvest(why_invest: []),
        // home: EditProduct(product: []),
        // home: EditService(product: []),
        // home: EditAwardAndRecognition(
        //   awardAndRecognition: [],
        // ),
        // home: EditCompanyProfile(),
        // home: const ContactUsWidget(),
        // home: AboutUsWidget(description: '', title: '',),
        // home: const ProductServiceWidget(),
        home: EditDetailCompanyProfile(),
        // home: StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.active) {
        //         if (snapshot.hasData) {
        //           return const Responsive();
        //         } else if (snapshot.hasError) {
        //           return Center(
        //             child: Text('${snapshot.error}'),
        //           );
        //         }
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(color: Colors.blue),
        //         );
        //       }
        //       return const Login();
        //     }),

        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
