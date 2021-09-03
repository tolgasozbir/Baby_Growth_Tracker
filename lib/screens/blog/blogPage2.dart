import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class BlogPage2 extends StatelessWidget {

  String _title="";

  BlogPage2(String title){
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
              <p>Çocuğun; dönmeyi, emeklemeyi, ayakta durmayı, yürümeyi nasıl öğrendiyse elbette tuvaletini yapmayı da öğrenecek. Peki, ama ne zaman? Tuvalet eğitiminde nelere dikkat etmelisin? Çocuklara tuvalet alışkanlığı nasıl kazandırılır? Bebek bezini çocuğuna nasıl ve ne zaman bıraktırabilirsin? </p>
              <p>Tüm bu soruların için detaylı bir araştırma yaptık, Universal Kuşadası Hastanesi Çocuk Sağlığı Uzmanı Dr. Özlem Gürcü'den de çok faydalı bilgiler aldık. Bebeklerde tuvalet eğitimi dönemini daha rahat geçirmek için okumaya devam et!</p>
              </div>
              <div itemprop="articleBody">
              <p><a name="1-bebeklere-tuvalet-egitimi-ne-zaman-verilir"></a></p>
              <a name="1-bebeklere-tuvalet-egitimi-ne-zaman-verilir"></a><h2>Bebeklere tuvalet eğitimi ne zaman verilir?</h2>
              <p>Çocukların idrar torbasının gelişimi 15-18 aylarda başlar. Çocuklar çişlerini geceleri daha az yaparken gündüzleri bu süre yaklaşık 3 saatte birdir. Bu süreç, 15 aylıktan 3 yaşına kadar değişebilir.</p>
              <p>Bu yüzden bebeklerde tuvalet eğitimi yaşı 2- 2,5 yaş arası. Fakat elbette bu zaman, çocuktan çocuğa göre değişebilir. Kimi için 2,5, kimi için ise 3 yaş tuvalet eğitimi kolaydır. Bebeklerde tuvalet eğitimi zamanını belirlerken yavrunun psikolojik olarak hazır olup olmadığına da dikkat etmen gerek. </p>
              <p><a name="2-tuvalet-egitimi-kac-guen-suerer"></a></p>
              <a name="2-tuvalet-egitimi-kac-guen-suerer"></a><h2>Tuvalet eğitimi kaç gün sürer?</h2>
              <p><img src="asset:images/blog2_1.jpg"></p>
              <p>Pek çok anne gibi sen de tuvalet eğitiminin çok kısa sürede tamamlanmasını umut ediyorsun. Çocuğun tuvalet eğitimine çok hazır olabilir ve gerçekten birkaç günde tuvalet eğitiminin büyük bir kısmını tamamlayabilir. Genel olarak bebeklerde tuvalet eğitimi 3-6 ay arasında tamamlanır. </p>

              <div id="MSA2"></div>
              <p><a name="3-cocuklara-tuvalet-egitimi-nasil-verilir"></a></p>
              <a name="3-cocuklara-tuvalet-egitimi-nasil-verilir"></a><h2>Çocuklara tuvalet eğitimi nasıl verilir?</h2>
              <ul>
              <li>Tuvalet alışkanlığı konusunda çocuğuna kitaplar oku. Kullanacağı malzemeleri, eşyaları tanıt. Külot, lazımlık, sifon, çiş, kaka gibi terimler hakkında bilgisinin olmasını sağla.</li>
              <li>Sırasıyla yapılması gerekenler konusunda tuvalet eğitimi kartlarından tuvalete girme, soyunma, tuvaleti yapma ve temizlenme sırası hakkında fikir edinmesine yardımcı ol.</li>
              <li>Kitap ve kartların yanında tuvalet eğitimi oyunları, “miş gibi oyunlar” da işe yarar. Çocuğunla birlikte oyuncak bebeği tuvalete götürebilir, kakasını yaptırabilirsin.</li>
              <li>Tuvalete gittiğinde çocuğunu da götür. Başlangıçta kıyafetli dahi olsa lazımlığa belirli bir süre oturmasını sağla. Bir süre sonra bunu rutine döndürmesine destek ol.</li>
              <li>Çocuğun belirli bir süre lazımlığa oturmaya başladığında ona artık çişini ve kakasını lazımlığa yapabileceğini anlat.</li>
              <li>Bebek bezini çıkar ve bir daha takma! Unutma ki en büyük yanlışlardan biri tuvalet eğitimine başladıktan sonra ya geceleri ya bir yerlere giderken ya da zaman zaman sabahları bebek bezini tekrar takmaktır.</li>
              <li>Çocuğun tuvaletini tutmayı öğrenene kadar her an çişini ve kakasını yapabileceğinden, kıyafetlerin kolay çıkarılabilir olmasına dikkat et. Zor fermuarlar, çıtçıtlar, düğmeler işini zorlaştırır.</li>
              <li>Daha önce belirlediğin, tuvalet ihtiyacının daha çok olduğu saatlerde çocuğunu tuvalete götür. Onu yüreklendirerek tuvaletini yapmasını bekle. Tabii ki ilk başlarda tuvaletini hemen lazımlığa yapmasını beklememen gerekir. Birkaç denemeden sonra ilk başarı gelecek, merak etme.</li>
              <li>Takip etmen gereken başka bir şey de saat. Bazı çocuklar tuvalete düzenli çıkarlar. Eğer benzer bir düzen, çocuğun için de geçerli ise bu avantajı değerlendirmeye bak.</li>
              <li>Çocuğun başarılı olduğunda ona küçük ödüller ver.</li>
              </ul>
              <p><img src="asset:images/blog2_2.jpg"></p>
              <ul>
              <li>En azından tuvalet eğitimi başlangıcında çocuğuna yardımcı olan tek kişi sen değilsen, mesela evde bakıcı varsa ikinizin de tutumu, yaklaşımı aynı olmalı.</li>
              <li>Tuvalet eğitimi süresince çok sabırlı olmaya çalış. Sabrının taşabileceği durumlarla karşılaşman olası. Bu gibi durumlarda derin derin nefes al, bu sürecin geçici olacağını kendine hatırlat.</li>
              <li>Onu devamlı uyarmayıp biraz kendi haline bırakabilirsin. Bir süre lazımlık, çiş, kaka gibi kelimeleri kullanmamaya çalışman işe yarayabilir.</li>
              <li>Anaokulu öğretmeni, doktor, hemşire gibi bir otorite figüründen yardım alabilirsin.</li>
              <li>Tuvalet eğitimi için en güzel mevsim hiç şüphesiz bahar ayları ve özellikle yaz mevsimidir. Çünkü bu aylarda salgın hastalıkları daha azdır. Kat kat giyinmeye gerek yoktur.</li>
              <li>Kısa bir sürede soyunmak daha kolaydır. Çıplak dolaştığında üşüme riski azdır. Yine de çocuğun çok hazırsa mevsim çok önemli değil, bazı önlemleri alman yeterli.</li>
              <li>Tüm sorumluluğu çocuğuna verebilirsin. İsterse lazımlık kullanabileceğini isterse bez ya da eğitim (alıştırma) külodu kullanabileceğini belirtebilirsin.</li>
              <li>Çocuğun çişini söylüyor ama kakası için illa ki bez istiyor olabilir. Çocuğun kakası için bez istiyorsa lazımlık teklif et. Bezde ısrar ediyorsa bez vermeye devam et. Çünkü buna karşı çıkarsan çocuğunun kakasını tutmasına ve kabızlığa neden olabilirsin.</li>
              <li>Özellikle uygun sıcaklık ve kolay temizlenebilir bir alan varsa arada sırada çocuğunun poposunu çıplak bırak. Bu onun, vücut sinyallerini tanıması için iyi bir yoldur.</li>
              </ul>
              <p><a name="8-erkek-cocuga-tuvalet-egitimi-nasil-verilir"></a></p>
              <a name="4-erkek-cocuga-tuvalet-egitimi-nasil-verilir"></a><h2>Erkek çocuğa tuvalet eğitimi nasıl verilir?</h2>
              <p>Erkek ve kız çocuklarında tuvalet eğitiminün süresi ve yöntemi farklılıklar gösterebilir. Erkek çocukların bezi bırakması kızlara göre daha geç olabilir.</p>
              <p>Erkek çocuğun için tuvalet eğitimi nasıl olmalı, şunlara dikkat et:</p>
              <ul>
              <li>Çiş yapma eğitimine oturarak başlat.</li>
              <li>Ayakta çiş yapmayı kendisi denemek isteyebilir. Babasından, televizyondan ya da anaokulunda arkadaşlarından görmüş olabilir. Denemesine izin ver.</li>
              <li>Ayakta çiş yapmayı öğreteceğin zaman klozetin önüne minik bir tabure koy. Penisini doğru hizada tutup klozete yöneltebilecek seviyede durmalı.</li>
              <li>Tuvaleti tıkamayacak şekilde içine ya da kolzetin teknesine kağıttan toplar atabilir, hedefi vurmaya çalışabilir. Bu tür tuvalet eğitimi oyunları erkek çocuğu tuvalete alıştırmak sürecinde çok işe yarar.</li>
              </ul>
              
              <p><a name="4-tam-o-anda-bebeklerde-tuvalet-egitimi-sirasinda-yapman-gereken-7-sey"></a></p>
              <a name="5-bebeklerde-tuvalet-egitimi-sirasinda-yapman-gereken-7-sey"></a><h2>Bebeklerde tuvalet eğitimi sırasında yapman gereken 7 şey</h2>
              <p>Minik yavrunun tuvalet eğitimine hazır olduğunu anlamanı kolaylaştıracak, "İşte zamanı geldi!" dediğin anlarda şunlar aklında bulunsun:</p>
              <ol>
              <li>
              <p>Çocuğunun bezi bırakıp alıştırma küloduna geçiş yapmasını sağla. Ancak bunun için ısrar etme. Eğer bez konusunda ısrarcı ise bezi takmaya devam et. Ancak bezi tuvalette aç, lazımlığa oturmasını sağla. Bunu bir rutin halinde uygula.</p>
              </li>
              <li>
              <p>Lazımlık, en azından bir süre için çok yakınlarda ve kolay ulaşılabilir olsun.</p>
              </li>
              <li>
              <p>İşaretleri iyi takip et. Başlangıçta işaretleri net olarak anlamayabilirsin. Gün geçtikçe bu konuda epey tecrübe edinmiş olacaksın.</p>
              </li>
              <li>
              <p>Çocuğun yanında bir arkadaşı ile tuvalete gitmek isteyebilir. Ona izin ver, çünkü bu onun için çok daha eğlencelidir.</p>
              </li>
              <li>
              <p>Zaman zaman musluğu açmak çişini daha çabuk yapması için iyi bir yöntem olabilir. Değerlendir.</p>
              </li>
              <li>
              <p>Çocuğun bir süre sonra lazımlık değil tuvaleti kullanmaya devam edeceğinden lazımlık ve tuvalet arasındaki bağı kur. Lazımlığın içerisindeki çiş ya da kakayı tuvalete dök ve bu bağlantıyı anlamasını sağla.</p>
              </li>
              <li>
              <p>Fiziksel sorunlar: İdrarda kan bulunması, ağrılı idrar yapma, gülerken altına kaçırma ya da idrar yolu enfeksiyonları söz konusu olabilir.</p>
              </li>
              </ol>
              
              <p><a name="5-tuvalet-egitimi-gece-nasil-verilir"></a></p>
              <a name="6-tuvalet-egitimi-gece-nasil-verilir"></a><h2>Tuvalet eğitimi gece nasıl verilir?</h2>
              <p>Tuvalet eğitimi, tamamlanması gereken bir süreç. Bebeğin mışıl mışıl uyurken onu kaldırmalı mısın, tuvalet eğitiminde gece bez bağlanmalı gibi sorular aklına takılıyor olabilir. </p>
              <p>Öyleyse çocuklarda gece tuvalet alışkanlığı nasıl kazandırılır, anlatalım:</p>
              <ul>
              <li>Gündüz tuvalet eğitimi tamamlandıktan, belli bir düzene oturduktan sonra gece tuvalet eğitiminer başlamalısın.</li>
              <li>Çocuğunu gündüz olduğu gibi gece de bezsiz yatırmalısın. Bebek bezi bağlamak yerine yatağına koruyucu bir bez serebilirsin.</li>
              <li>Çocuğuna yatmadan önceki son 2 saatte sıvı verme.</li>
              <li>Tuvalet eğitiminde gece uyandırma sıklığını çocuğunu gözlemleyerek belirlemelisin. Normalde 1-2 saatte bir çocuğunu uyandırabilirsin ama bu süre her çocukta farklılık gösterebilir.</li>
              <li>Gece tuvalet alışkanlığı kazandırmak gündüze göre daha zordur. Çocuğuna baskı yapma, altına kaçırdığı zaman ona kızma. 5-6 yaşına kadar gece tuvalet alışkanlığı kazanamaması normal.</li>
              </ul>
              
              <p><a name="6-tuvalet-egitimi-sirasinda-yapmaman-gerekenler-neler"></a></p>
              <a name="7-tuvalet-egitimi-sirasinda-yapmaman-gerekenler-neler"></a><h2>Tuvalet eğitimi sırasında yapmaman gerekenler neler?</h2>
              <p><img src="asset:images/blog2_3.jpg"></p>
              <p>Bebek tuvaleti, elbette karmaşık bir konu. Bugüne kadar bebek bezi kullanan miniğin için tuvalete doğru zamanda gitmek, korkmamak, temizlenmek zor gelebilir. Annelerin tuvalet eğitimi sırasında en çok yaptığı hatalar şunlar, sen bunları yapma:</p>
              <ul>
              <li>Az zamanda çok büyük bir başarı bekleme. Evet, 1-2 günde bile tuvalet alışkanlığı kazanan çocuklar da var. Ama çoğu çocuk için tuvalet eğitimi bu kadar kısa sürmez!</li>
              <li>Kazalar olduğunda ya da başarısızlık durumunda çocuğunu azarlama, cezalandırma, utandırma.</li>
              <li>Kazaları önleyeceğini düşünerek sıvı kısıtlaması yapma. Bu hem sağlıksız olur hem de etkisiz.</li>
              <li>Çocuğunun kolay kaka yapması için laksatif, fitil kullanımı gibi doğal olmayan yollara başvurma.</li>
              <li>Çocuğunu lazımlığa zorla oturtma.</li>
              <li>Umudunu yitirme. Bazen çok umutsuz olduğunu düşündüğün zamanlar olabilir. Ancak tuvalet eğitimi sonsuza kadar sürmeyecek. Buna emin ol.</li>
              </ul>
              <p><a name="7-cocugunun-tuvalet-egitiminde-sorun-yasamasina-neden-olabilecek-7-problem"></a></p>
              <a name="8-cocugunun-tuvalet-egitiminde-sorun-yasamasina-neden-olabilecek-7-problem"></a><h2>Çocuğunun tuvalet eğitiminde sorun yaşamasına neden olabilecek 7 problem</h2>
              <p>Tuvalet eğitimi süresince hatta daha sonrasında da zaman zaman kazaların olması çok normal. Ancak her çiş ve her kaka kaza ile sonuçlanıyorsa tuvalet eğitimi zamanlaması yanlış olabilir. Önce aşağıdaki 7 durumun söz konusu olup olmadığını gözden geçir.</p>
              <p><strong>1. Stres:</strong> Çocuğunun hayatında köklü bazı değişikliklerin olması onu stres altına sokar. Bakıcının değişmesi, senin işe başlaman, bir kardeşinin olması ya da evden taşınmanız stres nedeni olabilir.</p>
              <p><strong>2. Yorgunluk:</strong> Bu dönem çocuğunun çok yorulduğu bir dönem olabilir. Anaokuluna başlamıştır, günlük aktiviteleri fazlalaşmıştır. Yorgunluk bazı becerilerde kontrolün azalmasına neden olabilir.</p>
              <p><strong>3. Heyecan:</strong> Çok fazla heyecanlanması çocuğunun idrar kesesi üzerindeki kontrolünü azaltabilir.</p>
              <p><strong>4. Ebeveyn baskısı:</strong> Çocuğuna tuvalet eğitimi konusunda baskı yapman onu zorlayıp yavaşlatabilir.</p>
              <p><strong>5. Konsantrasyon:</strong> Çocuğun oyun oynamaktan kendini alamadığı, heyecan verici başka bir aktiviteden vakit bulamadığı için lazımlığa konsantre olamıyor olabilir.</p>
              <p><strong>6. Sıkışma:</strong> Çocuğun tuvaletini fark ettiği halde hızlı hareket edemiyor olabilir.</p>
              <p><strong>7. Fiziksel sorunlar:</strong> İdrarda kan bulunması, ağrılı idrar yapma, gülerken altına kaçırma ya da idrar yolu enfeksiyonları söz konusu olabilir.</p>
              </div>

              """,
            ),
          ],
        ),
      ),
    );
  }
}