import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:picpay/widgets/button_tab.widget.dart';
import 'package:picpay/widgets/history.widget.dart';

class PicPayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildAppBar(context),
            SizedBox(height: 10),
            buildHistory(),
            SizedBox(height: 10),
            buildCard(),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text('Atividades',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  ButtonTab(
                      isSelected: false, text: 'Todas', color: Colors.green),
                  ButtonTab(
                      isSelected: true, text: 'Minhas', color: Colors.green),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: FlutterLogo(),
                        ),
                        SizedBox(width: 10),
                        Text.rich(
                          TextSpan(
                              text: 'Você',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              children: [
                                TextSpan(
                                    text: ' enviou um ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                                TextSpan(text: 'Pix')
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.qr_code_outlined,
                    color: Colors.green,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Colors.green,
                  ),
                  onPressed: null),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Meu saldo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ 00,00',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.wallet_giftcard_outlined,
                    color: Colors.green,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.maps_ugc_outlined,
                    color: Colors.green,
                  ),
                  onPressed: null),
            ],
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text(
                    'O que você quer pagar?',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHistory() {
    return Column(
      children: [
        Row(
          children: [
            ButtonTab(isSelected: true, text: 'Sugestões'),
            ButtonTab(isSelected: false, text: 'Favoritos')
          ],
        ),
        SizedBox(height: 10),
        Container(
            height: 110,
            margin: const EdgeInsets.only(left: 5),
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return History();
                    }))),
      ],
    );
  }

  Widget buildCard() {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(
                Icons.qr_code,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Seleção especial"),
                  Text(
                    'Promoções disponíveis',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 15, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
