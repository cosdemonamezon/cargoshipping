import 'package:cargoshipping/account/widgets/accumulatedpointswidget.dart';
import 'package:cargoshipping/account/widgets/statementwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Accumulatedpoints extends StatelessWidget {
  const Accumulatedpoints({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'รายการคะแนนสะสม',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'เดือนกันยายน 2567',
                    style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * 0.024,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset('assets/icons/downarrow.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4, // กำหนดความสูงที่เหมาะสม
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: accumulatedpoints.length,
                itemBuilder: (context, index) {
                  return Accumulatedpointswidget(
                    accumulatedpoints: accumulatedpoints[index],
                    onTap: () {
                      
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
