import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Transporttrackpage extends StatefulWidget {
  const Transporttrackpage({Key? key}) : super(key: key);

  @override
  State<Transporttrackpage> createState() => _TransporttrackpageState();
}

class _TransporttrackpageState extends State<Transporttrackpage> {
  String selectedShippingMethod = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: SizedBox(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTransportOption('ทางรถ', 'assets/icons/carim.png'),
                _buildTransportOption('ทางเรือ', 'assets/icons/boatim.png'),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: size.height * 0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Text(
                    'รายการสถานะ :',
                    style: TextStyle(
                        fontSize: 13,
                        color: headingtext,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.015,
                    vertical: 0,
                  ),
                  itemCount: tracktransport.length,
                  itemBuilder: (context, index) {
                    final order = tracktransport[index];
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      padding: EdgeInsets.all(size.height * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            order['images'],
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            order['title'],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'ดำเนินการอยู่ ${order['process']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  Widget _buildTransportOption(String title, String assetPath) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedShippingMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedShippingMethod = title;
        });
      },
      child: Container(
        width: size.width * 0.45,
        height: size.height * 0.085,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: isSelected ? 1.0 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(assetPath, height: 40),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}