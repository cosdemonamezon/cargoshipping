import 'package:cargoshipping/account/widgets/withdrawpage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Firstwithdrawpage extends StatefulWidget {
  @override
  _FirstwithdrawpageState createState() => _FirstwithdrawpageState();
}

class _FirstwithdrawpageState extends State<Firstwithdrawpage> {
  String selectedAmount = ''; // สถานะเก็บจำนวนเงินที่เลือก

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'ถอนเงิน',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'เลือกจำนวนเงิน (บาท)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  _buildAmountContainer('100'),
                  _buildAmountContainer('500'),
                  _buildAmountContainer('1,000'),
                  _buildAmountContainer('5,000'),
                  _buildAmountContainer('10,000'),
                  _buildAmountContainer('50,000'),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              'หรือระบุ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  color: headingtext),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height *0.045,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'ระบุจำนวนเงินขั้นต่ำ 50 บาท',
                  hintStyle: TextStyle(color: arrowcolor, fontSize: 13),
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.all(12.0), // ปรับ padding ของไอคอน
                    child: Image.asset('assets/icons/writemoney.png'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    right: 20.0, // เพิ่มระยะห่างจากขอบขวา
                  ),
                ),
                textAlign: TextAlign.right,
                onChanged: (value) {
                  setState(() {
                    selectedAmount = value;
                  });
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Withdrawpage()),
                );
                // print('Selected Amount: $selectedAmount');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: red1,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'ถอนเงิน',
                style: TextStyle(
                    fontSize: 17, color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountContainer(String amount) {
    bool isSelected = selectedAmount == amount;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.035,
        width: MediaQuery.of(context).size.width * 0.26,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
              fontSize: 13.0,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
