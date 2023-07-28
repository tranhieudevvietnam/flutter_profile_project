import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile/utils/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: SizedBox(
                height: width / 2,
                width: width / 1.2,
                child: Assets.user1.avatar.image(fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trần Hiệu',
                    style: TextStyle(
                      color: Color(0xFF2D2D47),
                      fontSize: 30,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Dev Mobile',
                    style: TextStyle(
                      color: Color(0xFFA377E8),
                      fontSize: 20,
                      fontFamily: 'Outfit',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Assets.icon1.svg(width: 30)),
                        const Padding(
                          padding: EdgeInsets.only(left: 50, right: 30),
                          child: Text(
                            'Never frown, even when you are sad, because you never know who is falling in love with your smile.',
                            style: TextStyle(
                              color: Color(0xFF47506B),
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Assets.icon2.svg(width: 20)),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  _buildTileAndText(
                    text: "0356132121",
                    icon: Assets.phone.svg(width: 30),
                    onTap: (value) async {
                      await launchUrl(Uri.parse("tel:$value"));
                    },
                  ),
                  _buildTileAndText(
                    text: "tranhieu.dev.vietnam@gmail.com",
                    icon: Assets.email.svg(width: 30),
                    onTap: (value) async {
                      await Clipboard.setData(ClipboardData(text: value));
                    },
                  ),
                  _buildTileAndText(
                      icon: Assets.link.svg(width: 30),
                      text: "https://github.com/tranhieudevvietnam",
                      onTap: (value) async {
                        await launchUrl(Uri.parse(value));
                      }),
                  _buildTileAndText(
                      icon: Assets.link.svg(width: 30),
                      text: "Motorcycle insurance",
                      onTap: (value) async {
                        await launchUrl(Uri.parse(
                            "https://drive.google.com/file/d/1cMlVxrV_K6dKaiVfPZBjBlhH0ZvPSczp/view?usp=sharing"));
                      }),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildTileAndText(
      {required String text,
      required Widget icon,
      Function(String value)? onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Outfit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
