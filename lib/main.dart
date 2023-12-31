import 'package:crypto_gen/Controller/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return
          // MultiProvider(
          // providers: [],
          // child:
          MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const CryptoGen(),
      );
      // )
    });
  }
}

class CryptoGen extends StatefulWidget {
  const CryptoGen({super.key});

  @override
  State<CryptoGen> createState() => _CryptoGenState();
}

class _CryptoGenState extends State<CryptoGen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: Column(children: [
          const Text(
            'hello 👋',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Consumer<CryptoDataProvider>(builder: (context, cryptoData, child) {
            if (cryptoData.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }else{
              return const Text(
                'has data',
                style: TextStyle(
                    fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              );
            }
          })
        ]),
      )),
    );
  }
}
