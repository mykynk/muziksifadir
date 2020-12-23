import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:muziksifadir/constants/size.dart';
import 'package:muziksifadir/viewmodel/sayfalar_model.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  SayfalarModel _sayfalarModel;
  YoutubePlayerController _controllerYoutube = YoutubePlayerController(
    initialVideoId: 'fS_cYA9_WK8',
    params: YoutubePlayerParams(
      // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  ScrollController _controller;
  double _offset = 0, size = 0.50, sizeNavBar = 0.25;
  bool girdiMi = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sayfalarModel = Provider.of<SayfalarModel>(context);
    if (!girdiMi) {
      _sayfalarModel.anaSayfaGetir().then((value) {
        setState(() {
          // anasayfa = value;
          girdiMi = true;
        });
      });
    }

    return _sayfalarModel.state != SayfalarViewState.Busy
        ? Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  left: -200,
                  top: -100,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/turuncu.png'),
                        fit: BoxFit.contain,
                      ),
                      //  color: suYesili,
                      color: Color(0xFFFFFFFF),
                    ),
                    height: height(context) * size,
                    width: height(context) * size,
                    alignment: Alignment(0, 0.5),
                    duration: Duration(milliseconds: 100),
                  ),
                ),
                DraggableScrollbar.rrect(
                  controller: _controller,
                  backgroundColor: Color(0xAAEFB183),
                  heightScrollThumb: 200.0,
                  alwaysVisibleScrollThumb: true,
                  padding: EdgeInsets.fromLTRB(0, 100, 5, 5),
                  child: ListView(controller: _controller, children: <Widget>[
                    Container(
                      height: 150,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: width(context) * 0.03),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20)),
                          //  padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(width: width(context) * 0.015),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: width(context) * 0.505,
                                  width: width(context) * 0.900,
                                  child: YoutubePlayerIFrame(
                                    controller: _controllerYoutube,
                                    aspectRatio: 16 / 9,
                                  ),
                                ),
                              ),
                              SizedBox(width: width(context) * 0.05),
                              Container(
                                width: width(context) * 0.825,
                                child: Column(
                                  children: [
                                    SizedBox(height: height(context) * 0.05),
                                    Text(
                                      """Merhaba Kıymetli Dostlar,
 
Yepyeni bir site ile karşınızdayız. Müziği, müziğin güzelliğini ve iyileştirici gücünü birlikte keşfetmek üzere bir yolculuğa çıktık ve sizleri de bu yolculuğa davet ediyoruz. 

Hayatın her döneminde, müziğin; eğlenme, dinlenme, eğitim ve haz aracı gibi değişik duyguları tatmin etme ve dile getirme özelliğinin yanında bilimsel, sanatsal ve kültürel işlevleri olduğu bilinmekte, bu durum müziği insanlık sosyolojisinde önemli bir yere taşımaktadır. Müzik sanat dallarından biri olmakla birlikte, bireyin kendini ve becerilerini geliştirmesi için bir araçtır.

Müzik, bilindiği üzere zamanın ötesine geçer ve dünyadaki tüm topluluklarda mevcuttur. Nitekim tam da burada Nietzsche’ nin bir sözünü eklemek istiyorum: “ Müzik olmadan hayat bir hata olur”. Çünkü bizi müziğin ritmini takip etmeye yönelten doğal bir içgüdüye sahibiz. 

İbn-i Sina’ ya göre ise ses, varlığımız için zaruridir. Müzik bestelerini bize hoş gösteren, işitme gücümüz değil, o besteden çeşitli telkinler çıkaran idrak yeteneğimizdir. 

İbn-i Sina’ nın etkisinde kalan Osmanlı saray hekimi Musa bin Hamun, Kanunî Sultan Süleyman’ a ithaf ettiği diş hekimliğine ait Türkçe eserinde diş hastalıklarının müzikle tedavisinden söz eder, çocukların müzikle uyutulmasını önerir.

Beyindeki müziğe yanıt veren yapılar, dile yanıt veren yapılardan daha önce gelişti. Çocuklara dikkat edelim, konuşmaya başlamamış olsalar dahi sevdikleri bir şarkıyı duyduklarında hareket eder ve ellerini çırparlar. Hareket ve beden aracılığı ile duygularımızı iletme, ifade etme ihtiyacımızla ilgili spontane tepkiler müzik ile birlikte doğar. 

Farklı kültürlerden insanların farklı müzik türlerini dinlerken aynı şekilde duygusal tepki verdikleri bilimsel çalışmalarda keşfedilmiştir. İşte bu, müziğin evrensel doğası göz önünde bulundurulduğunda, MÜZİK TERAPİSİ tüm geçmişlere ve yaşlara büyülü bir şekilde ulaşır. 

Müzik Terapisi, hasta/danışanların iyileşmeyi teşvik etmek, yaşam kalitesini yükseltmek için müzikal müdahalelerle müziği, müziğin unsurlarını ve müzik aktivitelerini kullanan kanıta dayalı klinik ortamda uygulanan terapötik amaçla kullanılan Geleneksel Tamamlayıcı ve Fonksiyonel Tıp uzmanlık alanıdır.

En çok merak edilen konu ise Ses ve Müzik Terapist kimdir ve kimlere müzik terapi uygulanabilir? 

Bu konulara da hemen açıklık getireyim. 


Müzik Terapist kimdir, kimler Müzik Terapist olabilir 

Müzik terapist, hasta/ danışanların tanılarıyla zihinsel ve fiziksel olarak başa çıkmaları için onlara yardımcı olan kişidir.

MÜZİK TERAPİ, ilgili yasa ve yönetmeliğe göre uygulamaya yetkili personel olarak T.C. Sağlık Bakanlığı tarafından onaylanmış sertifika sahibi tabip ve tabip gözetiminde sağlık meslek mensupları ile müzik eğitimi almış kişiler tarafından uygulanır. 


Müzik Terapi kimlere uygulanır, kimlere uygulanmaz

Herhangi bir ilaç veya madde kullanılmadığından, müzik terapi sağlığı tehdit edebilecek önemli bir risk oluşturmaz. 

Yine de bazı özel durumlarda, örneğin işitme güçlüğü çeken hastalarda, belirgin mental-ruhsal bozukluğu veya madde bağımlılığı olan bireylerde daha dikkatli olunmalıdır. Özellikle terapistin yeterince güven veren bir terapötik ilişki kuramaması durumunda, uygulamadan hoşlanmama, rahatsız-huzursuz olma ya da korkma şeklindeki sorunlarla karşılaşılabilmektedir. Böyle durumlarda müzik terapistinin daha özenli ve dikkatli olması, tıbbi tedaviyi yürüten ilgili hekimle yakın bir iletişim içinde bulunması gerekmektedir. 

Yetkili ve deneyimli bir müzik terapisti, istenmeyen durumların oluşmasını engelleyecek önlemleri alarak terapi sürecini kişiye uygun şekilde düzenlemekle yükümlüdür.


Nasıl Uygulanır?

Müzik terapi uygulamalarının neredeyse tüm ruhsal ve bedensel işlevlerimizi düzenlemeye, geliştirmeye ve pekiştirmeye katkı sağlamasının nedeni, uygulamalarda temel araçlardan birisi olarak kullanılan müziğin veya müziği oluşturan titreşim, ses, melodi, ritim, tempo gibi bileşenlerin hareket, duyu ve algı, dikkat, bellek, dil gibi bilişsel becerilerle ilgili işlemleri yürüten sistemlerle kolayca etkileşime girebilmesidir. 

Müzik beyindeki algı, dikkat, düşünme, öğrenme, dil, konuşma, hareket ve beden kontrolü ile ilgili işlemleri uyarmak ve desteklemek yanında hormon salınımı üzerinde de düzenleyici etkilere sahiptir. Böylesine geniş etkileşimleri içeren müzik terapi uygulamalarında doğal olarak her bireye aynı şekilde uygulanan tek ve standart bir yöntem söz konusu değildir. Uygulamaların nasıl yapıldığını anlamayı kolaylaştırmak için, müzik terapi yöntemlerini pasif ve aktif yöntemler olarak gruplandırabiliriz. 

Ancak, pasif müzik terapi uygulamalarında bile yöntem, sadece kişiye müzik dinletmek ya da konser vermek şeklinde değildir. 

Dinletilecek müziğin seçiminde veya özgün olarak üretilmesinde terapiye katılacak bireyin sorunlarını, gereksinimlerini, fiziksel, sosyal ve psikolojik durumunu, geçmiş müzik beğenilerini-deneyimlerini analiz ederek bireye özgü terapi sürecinin aşamalarına ilişkin ayrıntıları plânlamak, uygulamanın etkilerini çeşitli aşamalarda ve terapi sonunda kanıta dayalı yöntemlerle değerlendirmek gibi gereklilikler söz konusudur. Aktif müzik terapi yaklaşımında kişinin bir enstrüman, örneğin vurmalı bir çalgı kullanarak müziksel eylemlere katılımından, doğaçlama yapma, müzik-şarkı oluşturma, seansların çözüm ve analizine kadar geniş bir yelpaze oluşturan çok çeşitli yöntemler kullanılır. 

KISACASI;  
MÜZİK TERAPİ, TERAPİSTİN KİŞİYE UYGULADIĞI DEĞİL, 
ONUNLA BİRLİKTE GERÇEKLEŞTİRDİĞİ BİR TERAPİ SÜRECİDİR. (Ş.Torun, Prof.)


Diliyorum ki, merak ettiğiniz tüm sorulara cevap verebilmişizdir. Konfüçyüs, müziğin değeri, önemi, kişiler ve toplumlar üzerinde etkisini ne de güzel ifade etmiş:
“Bir milletin mutlu ve ahlaklı bir şekilde idare edilip edilmediğini anlamak isterseniz o memleketin müziğini dinleyiniz. Müzik devlet kurar, devlet yıkar.”

Müzik, hem bireysel hem de toplumsal kültürü ve kültürel özellikleri oluşturduğu, geliştirdiği, zenginleştirdiği gibi; hem beden hem de ruh sağlığımızı modern tıbba eşlik ederek İYİ eder. 

Sağlıkla… Huzurla… Ve Müzikle kalın.

Müzik şifadır, şifa niyetine!
""",
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: width(context) * 0.015),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width(context) * 0.03),
                      ],
                    ),
                  ]),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: AnimatedContainer(
                      height: 100,
                      width: width(context) * sizeNavBar,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(0))),
                      duration: Duration(),
                    )),
              ],
            ),
          )
        : Container();
  }

  _scrollListener() {
    if (_controller.offset >= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        /*_backgroundColor = krem;
        _goster = true;*/
        size = 0.30;
      });
    }
    // _controller.position.minScrollExtent
    if (_controller.offset <= MediaQuery.of(context).size.height * 0.4 &&
        !_controller.position.outOfRange) {
      setState(() {
        /*     _backgroundColor = Colors.transparent;
        _goster = false;*/
      });
    }
  }

  onScroll() {
    setState(() {
      if (_controller.offset < 1000 && _controller.offset > 100) {
        size = ((_controller.offset + 100) * height(context) / (28 * 10)) * 0.0002;
        sizeNavBar = ((_controller.offset + 100) * height(context) / (28 * 10)) * 0.0004;
      }
    });
  }
}
