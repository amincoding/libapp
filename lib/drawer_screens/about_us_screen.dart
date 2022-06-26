import 'package:flutter/material.dart';
import 'package:viplive/core/utils/sizeConfig.dart';

class aboutUsScreen extends StatelessWidget {
  const aboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade700,
      appBar: AppBar(
        title: Text("about us",
),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        color: Colors.lightGreen[100],
        child: Text(
          """مكبة بلبالي المشهورة بحسن الاستقبال والمعاملة و التنوع في منتوجاتها و المصداقية
      تضع بين يديكم تطبيقها الخاص باالشراء والتسوق عبر فضاءاتها المتنوعة من دفئ بيوتكم مع ضمان الجودة والسعر والتوصيل 58/58 ولاية""",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      )),
    );
  }
}
