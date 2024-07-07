/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../_tanim/dashboard_tanim/model/dashboard_add_model.dart';
import 'barchart/barchartwithlabel.dart';
import 'piechart/my_pie_chart.dart';
import '../viewmodel/dashboard_view_model.dart';
import '../../classNav.dart';
import '../../core/auth/cache_manager.dart';
import '../../core/components/button/icon/icon_date_button.dart';
import '../../core/extension/date_extension.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';
import '../../_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '../../_kullanici_yonetimi/yetki/model/yetki_model.dart';
import '../../core/auth/auth_manager.dart';
import '../../core/components/text_field/date_text_field.dart';
import '../model/dashboard_model.dart';
part 'home_page.g.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with CacheManager {
  late KullaniciListesiModel? user;
  List<YetkiModel> yetkiModels = [];
  String token = '';
  String hintTextTarih = 'dd.mm.yyyy';
  List<DashboardAddModel> names = [];
  //List<MyPieChart> pieChartsShow=[];
  List<String> selectInitPie = [];
  List<String> initPie = [];
  MyBarChart? myBarChart ;
 List<dynamic> grafics = [];
  final DashboardViewModel viewModel = DashboardViewModel(); 
  @override
  void initState() {
    super.initState();
   getData();
    user = context.read<AuthenticationManager>().model;
    yetkiModels = context.read<AuthenticationManager>().yetkiModel;
    int musteriId = context.read<AuthenticationManager>().model!.kullaniciNo;
    viewModel.updateMusteriId(musteriId);
    setState(() {
      hintTextTarih =
          viewModel.tarih != null ? viewModel.tarih.toFormatEdit : 'dd.mm.yyyy';
    });
  }
  Future<void> getData() async {
  names = await viewModel.getDashNames();
  await getInitPieChart();   
  setState(() {
    
  });
  }
  Future<void> getInitPieChart() async {
    if (user != null) {
      initPie = await getPieChartList(user!.kullaniciNo.toString());
      if (initPie.isNotEmpty) {
        for (String item in initPie) {
          if(item == 'Yillik Toplam'){
            List<DashboardModel> dashs  = [];
            selectInitPie.add(item);
            showPieChart(item, dashs);
          }else{
         selectInitPie.add(item);
         showPieChart(item, null);
          }
        }
      }
      setState(() {});
    }
  }
  void showPieChart(String value, List<DashboardModel>?dash) {
    if (!grafics.any((element) => element.id == value)) {
      MyPieChart newPie = MyPieChart(id: value,dashs: dash);
      grafics.add(newPie);
    }
  }
  
   void removeShowPie(String pie){
    grafics.removeWhere((element) => element.id == pie);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const NavBar(),
      body: yetkiModels
              .singleWhere((element) => element.menuAdi == "Dashboard İşlem")
              .izlemeYetki!
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        child: Container(
                          width: 200,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              DateTextField(hintTextTarih: hintTextTarih),
                              _iconButton(context),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                               await  dateChangedPieShow();          
                              },
                              child: const Text("Getir"),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                List<String> newString = [];
                                if(selectInitPie.isNotEmpty){
                                  for(var item in selectInitPie){
                                     newString.add(item);
                                  }
                                }  
                               await addPieChartItem(user!.kullaniciNo.toString(),newString);
                              },
                              child: const Text("Kaydet"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 20, right: 20),
                    child: Center(
                      child: _dropDownDashBoards(),
                    ),
                  ),
                  pieReoderable(size),
                ],
              ),
            )
          : _yetkiszGiris(),
    );
  }

  ReorderableWrap pieReoderable(double size) {
    return ReorderableWrap(
                  onReorder: reorderData,
                  needsLongPressDraggable: true,
                  padding: const EdgeInsets.only(top: 5),
                  children: grafics.map((pieChart) {
                    return SizedBox(
                      width:pieChart.id == 'Yillik Toplam' ?  500: size,
                      height: pieChart.id == 'Yillik Toplam' ? 500  : 250,
                      child: KeyedSubtree(
                        key: ValueKey(pieChart.id),
                        child: Dismissible(
                          key: Key(pieChart.id),
                          onDismissed: (direction) {
                             selectInitPie.removeWhere((element) => element == pieChart.id);
                            removeShowPie(pieChart);
                          },
                          child: Padding(
                           padding:  const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  pieChart.id,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              pieChart.id == 'Yillik Toplam' ? 
                               MyBarChart(dashs: pieChart.dashs, id:pieChart.id):
                               MyPieChart (dashs: pieChart.dashs,id: pieChart.id),
                              ],
                            ),
                          ),
                          background: Container(
                            color: Colors.amber,
                            alignment: Alignment.centerLeft,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
  }


DropdownButtonFormField<String> _dropDownDashBoards() {
    return DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                      ),
                      borderRadius: BorderRadius.circular(25),
                      items: [
                        for(var dropItem in names)
                        DropdownMenuItem<String>(
                          value: dropItem.raporAdi ?? 'yok',
                          child: Text(dropItem.raporAdi ?? 'yok'),
                        ),
                      ],
                      onChanged: (value) async {
                       await viewModel.updateRaporTipi(value!);
                       if(value == 'Yillik Toplam'){
                          List<DashboardModel> dashs =
                          await viewModel.getCharts(context);
                          myBarChart = MyBarChart(dashs: dashs, id: value);
                          selectInitPie.add(myBarChart!.id);
                          grafics.add(myBarChart);
                       }else{
                           List<DashboardModel> dashs =
                          await viewModel.getCharts(context);
                          if(!grafics.any((element) => element.id == value)) {
                            selectInitPie.add(value);
                          showPieChart(value, dashs) ;
                          } 
                          
                       }      
                        setState(() {});
                    },
                      hint: const Text('Görmek istediğiniz grafiği Seçiniz'),
                 );
  }
IconDateButton _iconButton(BuildContext context) {
    return IconDateButton(
     hintTextTarih: hintTextTarih,
     onDateTimeChanged: (DateTime newTime) async{
            setState(() {
                viewModel.updateTarih(newTime);
            hintTextTarih = viewModel.tarih !=
                          null
                      ? viewModel.tarih.toFormatEdit
                      : 'dd.mm.yyyy'; 
            });
      }  
  );
}


  void reorderData(int oldIndex, int newIndex) {
    var item = grafics.removeAt(oldIndex);
    grafics.insert(newIndex, item);

    setState(() {});
  }

 Future<void> dateChangedPieShow() async {
   if(selectInitPie.isNotEmpty){
        for(int i=0; i<selectInitPie.length; i++){
            await viewModel.updateRaporTipi(selectInitPie[i]);
            List<DashboardModel> dashs =await viewModel.getCharts(context);
              if(grafics.any((element) => element.id == selectInitPie[i])) {
                removeShowPie(selectInitPie[i]);
              }
           showPieChart(selectInitPie[i], dashs) ;  
      }
  }
  setState(() {
    
  });
}
}


*/
