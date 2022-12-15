import 'package:flutter/material.dart';

class TopicSelectionScreen extends StatelessWidget {
  const TopicSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
          child: Column(children: [
            LogoAndSettings(),
            TextWidget(),
            RowItems(width: width),
            RowItems(width: width)
          ],),
        ),
      ),
    );
  }
}

class RowItems extends StatelessWidget {
  const RowItems({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Container(
        width: width*.47,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Image.network('https://fitpage.in/wp-content/uploads/2021/04/Article_Banner-1-37.jpg',fit: BoxFit.cover,width: 100,height: 90,),
        Expanded(child: Text('Ropana Help', style: TextStyle(fontSize: 20))),
      ],),),

      Container(
        width: width*.45,
        child: Row(children: [
        Image.network('https://fitpage.in/wp-content/uploads/2021/04/Article_Banner-1-37.jpg',fit: BoxFit.cover,width: 100,height: 90,),
        Expanded(child: Text('Ropana Help',style: TextStyle(fontSize: 20))),
      ],),),
    ],);
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
      Text('Its alright, \nWe are here for you', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.right,)
    ],);
  }
}

class LogoAndSettings extends StatelessWidget {
  const LogoAndSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.image_rounded,size: 100,),
         IconButton(onPressed: (){},icon: Icon(Icons.settings,size: 45,),),
      ],
    );
  }
}