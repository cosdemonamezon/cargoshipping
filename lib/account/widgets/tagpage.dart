import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  late PageController _pageController; // ประกาศ late เพื่อระบุว่าจะกำหนดในภายหลัง
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // กำหนดค่า PageController ทันทีใน initState ก่อนใช้งาน
    _pageController = PageController(initialPage: selectedIndex); 
  }

  @override
  void dispose() {
    // อย่าลืมเรียกใช้ dispose เพื่อปิด PageController
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: size.height * 0.001,
          ),
        ),
        title: Text(
          'บทความ',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(0, "TAG 1"),
                _buildTabItem(1, "TAG 2"),
                _buildTabItem(2, "TAG 3"),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController, // ใช้ PageController ที่ถูกกำหนดแล้ว
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index; // อัปเดตเมื่อเปลี่ยนหน้า
                });
              },
              children: [
                _buildTagContent(size),
                _buildTagContent(size),
                _buildTagContent(size),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.07,
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/redstar.png'),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'ติดตามบทความใหม่ๆ ได้ที่นี่',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Image.asset('assets/images/redstar.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          // ใช้ PageController เพื่อเลื่อนไปยังหน้าเมื่อแท็บถูกกด
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        });
      },
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.29,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.01),
        decoration: BoxDecoration(
            color: isSelected ? red1 : Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : greyuserinfo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTagContent(Size size) {
    return ListView(
      padding: EdgeInsets.all(size.height * 0.009),
      children: [
        _buildCard(
          size,
          'assets/images/tag1.png',
          'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag2.png',
          '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag3.png',
          'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag1.png',
          'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag2.png',
          '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag3.png',
          'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
          '24 กรกฎาคม 2567',
        ),
      ],
    );
  }

  Widget _buildCard(Size size, String imagePath, String title, String date) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                height: size.height * 0.11,
                width: size.height * 0.1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.012),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
