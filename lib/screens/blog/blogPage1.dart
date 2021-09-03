import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class BlogPage1 extends StatelessWidget {

  String _title="";

  BlogPage1(String title){
    _title=title;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
            Html(
              data: """
              <div class="intro" itemprop="description">
              <p>Çocuklarda tuvalet eğitimi ne zaman başlamalı? Miniğinin yaşından öte, becerileri itibariyle de tuvalet eğitimine hazır olduğundan emin olabilmen için sana birtakım sorular yönelttik. Bakalım çocuğun bezden kurtulmaya hazır mı?</p>
              </div>
              <p><a name="1-tuvalet-egitimi-icin-en-uygun-yas-nedir"></a></p>
              <a name="1-tuvalet-egitimi-kac-yasinda-baslar"></a><h2>Tuvalet eğitimi kaç yaşında başlar?</h2>
              <p>Tuvalet eğitimi için en uygun yaş nedir sorusu, annelerin en merak ettikleri konulardan. Tuvalet eğitimi zamanlaması çocuğunun gelişimsel becerisine ve tabii ki istekli olmasına bağlı. Pek çok çocuk için 1.5-3 yaş arası tuvalet eğitim yaşı için uygun zamandır. Ancak çocukların idrar keseleri 20-21. aylardan önce çok sık boşalır, yani kontrol etmek zordur. Bu da eğitimin biraz daha uzun sürmesine neden olabilir. Bu yüzden bazı uzmanlar 0-2 yaş tuvalet eğitimini önermezler. 2 yaşından sonra başlanmasını tavsiye ederler.</p>
              <p>Ortalamada; <strong>kız çocukları 29. ay ve erkek çocukları 31. ay itibari ile tuvalet eğitimini kazanırlar.</strong> Çocukların yaklaşık %98'i 3 yaş itibariyle tuvalet eğitimini tamamlamış olur. Tuvalet eğitimi gecikirse çocuğunda kabızlık ya da idrar tutma gibi problemler ortaya çıkabilir. Normal gelişime rağmen 4 yaş ve sonrasında verilen tuvalet eğitimi gecikmiş kabul edilir.</p>
              <p><a name="2-tuvalet-egitimi-icin-en-uygun-zaman-nedir"></a></p>
              <a name="2-tuvalet-egitimi-icin-en-uygun-zaman-nedir"></a><h2>Tuvalet eğitimi için en uygun zaman nedir?</h2>
              <p><img src="asset:images/blog1_1.jpg"></p>
              <p>Tuvalet eğitimine başlamak için gözetmen gereken en önemli konu, çocuğunun bezi bırakmaya hazır olup olmadığını anlamaktır. Aşağıdaki 10 soruya vereceğin cevaplar çoğunlukla evet ise, alıştırmalara başlayabilirsin.</p>
              <ol><strong>
              <li>
              <p>Bebek bezi günde 1 ya da 2 saat boyunca kuru kalıyor mu? Çocuğun sabahları her zaman olmasa da bazen kuru uyanıyor mu?</p>
              </li>
              <li>
              <p>Dışkı zamanını kestirebiliyor musun? Dışkılamada düzenlilik -örneğin her sabah kalktıktan sonra ya da kahvaltıdan hemen sonra- var mı? Bu arada hemen belirtelim; düzenli dışkılamak her çocuk için çok da geçerli olmayabilir. Ancak çocuğun düzenli dışkılıyorsa bu, tuvalet eğitimi konusunda sana avantaj sağlar.</p>
              </li>
              <li>
              <p>Çocuğunun idrar ya da dışkıya karşı dikkat artışı nasıl? Örneğin kaka yapacakken bir köşeye gidip çömeliyor, sesini yükselterek haber vermeye çalışıyor ya da yüz ifadesini değiştiriyor mu? İdrar bacaklarının arasından aktığında fark ediyor, işaret ediyor ya da rahatsızlığını belirtiyor mu?</p>
              </li>
              <li>
              <p>Basit yönergeleri anlayıp uygulayabilir mi? İhtiyaçlarını ifade edebiliyor mu?</p>
              </li>
              <li>
              <p>Kuru-ıslak, kirli-temiz, aşağı-yukarı gibi kavramları biliyor mu?</p>
              </li>
              <li>
              <p>Kaka yapmak, çiş yapmak, tuvaleti gelmek, popo gibi tuvalet ile ilgili terimleri biliyor mu?</p>
              </li>
              <li>
              <p>Bebek bezinden rahatsız oluyor mu? İç çamaşırı giymek istiyor mu?</p>
              </li>
              <li>
              <p>Pantolonunu ve iç çamaşırını aşağı indirebiliyor mu, yukarı çekebiliyor mu? Eteğini kaldırabiliyor mu?</p>
              </li>
              <li>
              <p>Arkadaşlarının ya da ailedeki diğer kişilerin tuvalet alışkanlıkları konusunda meraklı mı? Onları tuvalete kadar izliyor, takip ediyor, ne yaptıklarını merak ediyor, taklit etmeye çalışıyor mu?</p>
              </li>
              <li>
              <p>Temiz ve kuru kalmaya ilgili mi? Düzenli, derli toplu olma konusunda meraklı mı? Altının ıslak kalmasını istemiyor, bezinin değiştirilmesini talep ediyor mu?</p>
              </li>
              </ol></strong>
              <p>Çocuğu ne zaman tuvalete alıştırmalı, sorusu için uygun olmayan durumlardan bahsedelim. Eğer;</p>
              <ul>
              <li>Yeni kardeşi olduysa, </li>
              <li>Ev içerisinde bir değişiklik olduysa, </li>
              <li>Boşanma, kayıp gibi durumlar söz konusu olduysa çocuğun tuvalet eğitimi için bir süre daha bekleyebilirsin. </li>
              </ul>
              <p>Kısaca "Tuvalet eğitimi hangi dönemde verilir?" sorusunu da yanıtlayalım. Bu sürece yaz ayında girmen daha doğru olabilir. Çünkü bu sayede çocuğun daha az kıyafetle eğitime kolayca ve üşümeden başlayabilir. </p>
              </a></p>
              <div id="WSA2"></div>
              <p><a name="3-cocuklarda-tuvalet-egitimi-nasil-olmali"></a></p>
              <a name="3-cocuklarda-tuvalet-egitimi-nasil-olmali"></a><h2>Çocuklarda tuvalet eğitimi nasıl olmalı?</h2>
              <p>Çocuğunun tuvalet eğitimine hazır olduğunu düşünüyorsan şimdi dikkat etmen gereken iki konu daha var.</p>
              <p>Tuvalet eğitimine sen hazır mısın? Tuvalet alışkanlığı eğitiminine en az çocuğun kadar senin de hazır olman gerekir. İşler düşündüğün gibi gitmeyebilir; mesela çocuğun pek çok kereler altına kaçırabilir, geceleri sık sık onu tuvalete kaldırman gerekebilir, kakasını lazımlığa yapmaktan korkabilir.</p>
              </a></p>
              </div>

              """,
            ),
          ],
        ),
      ),
    );
  }
}