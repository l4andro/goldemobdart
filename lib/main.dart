import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimalstore2/firebase_options.dart';
import 'package:minimalstore2/pages/acessorios_page.dart';
import 'package:minimalstore2/pages/camisas_e_moletom_page.dart';
import 'package:minimalstore2/pages/login_page.dart';
import 'package:minimalstore2/pages/tenis_page.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'services/auth_provider.dart';
import 'themes/theme_provider.dart';
import "package:provider/provider.dart";
import "models/shop.dart";
import 'pages/register_page.dart';
import 'pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Shop()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),
          '/camisas_e_moletom_page': (context) => const  CamisasMoletom(),
          '/tenis_page': (context) => const TenisPage(),
          '/acessorios_page': (context) => const AcessoriosPage(),
          '/register_page': (context) => const RegisterPage(),
          '/profile_page': (context) => const ProfilePage(),
          '/login_page': (context) => LoginPage(),
      
          
        });
  }
}
