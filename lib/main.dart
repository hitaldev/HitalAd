import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(HitalDev());
}
class HitalDev extends StatefulWidget {
  const HitalDev({Key? key}) : super(key: key);
  @override
  _HitalDevState createState() => _HitalDevState();
}
class _HitalDevState extends State<HitalDev> {

  var listAd;
  Future<dynamic> getAd() async{
    var url = Uri.parse("http://hitaldev.ir/ads");
    var response = await http.get(url,);
    listAd = json.decode(response.body);
    print(listAd);
    setState(() {
    });
  }
  @override
  void initState() {
    getAd();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Theme(
          data: ThemeData(fontFamily: "YekanBakh"),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xFF2B2B2B),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.zero,
                      color: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("HITALDEV",style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.w900,
                                fontSize: 11
                            ),),
                            Spacer(),
                            Text("آگهی ها",style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.w900,
                              fontSize: 16
                            ),),
                            SizedBox(width: 10,),
                            Image.asset("assets/images/ad.png",width: 30,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("دسته بندی : خودرو",style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: listAd==null ?
                        Center(child: CircularProgressIndicator())
                        : ListView.builder(
                      itemCount: listAd.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140,
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 1.0,
                                ),
                              ],
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF444444),
                                Colors.black
                              ],
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(listAd[index]["title"],style: TextStyle(
                                        color: Color(0xFF5EDEEF),fontSize: 18,
                                          fontWeight: FontWeight.w900
                                      ),),
                                      Text("${listAd[index]["price"]} تومان ",
                                          textDirection: TextDirection.rtl,style: TextStyle(
                                        color: Colors.white,fontSize: 18,
                                          fontWeight: FontWeight.w900
                                      ),),
                                      Text(listAd[index]["date"],style: TextStyle(
                                          color: Colors.grey
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(listAd[index]["image"],
                                  width: 140,height: 140,fit: BoxFit.fill,),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
