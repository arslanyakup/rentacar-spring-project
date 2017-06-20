<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!-- Head BEGIN -->
<head>
    <title>Kiralama Koşulları</title>
    <!-- Favicon -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="<%=request.getContextPath()%>/resources/themefolder1/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="shortcut icon"
          href="<%=request.getContextPath()%>/resources/themefolder1/assets/ico/favicon.ico">
    <!-- Fonts START -->
    <link
            href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
            rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/font-awesome/css/font-awesome.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">

    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-select/bootstrap-select.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/prettyphoto/css/prettyPhoto.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/assets/owl.carousel.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/assets/owl.theme.default.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/swiper/css/swiper.min.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/animate/animate.min.css"
            rel="stylesheet">
    <!-- Global styles END -->

    <script
            src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/modernizr.custom.js"></script>

    <!-- Theme styles START -->
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/frontend/layout/css/style-responsive.css"
            rel="stylesheet">
    <link
            href="<%=request.getContextPath()%>/resources/themefolder1/assets/css/theme.css"
            rel="stylesheet">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body id="home" class="wide">

<%@include file="/WEB-INF/views/template/header.jsp"%>

<!-- WRAPPER -->
<div class="wrapper">

    <!-- CONTENT AREA -->
    <div class="content-area">

        <!-- PAGE WITH SIDEBAR -->
        <section class="page-section with-sidebar sub-page">
            <div class="container">
                <div class="row">
                    <br/>
                    <br/>
                    <br/>
                    <p>1) Kiralayan; mülkiyetinde bulunan aracı, aşağıda belirtilen koşullara uyulması şartıyla, kiracıya, önceden saptanan süre için vermiştir. Kiracı, bu ekle sözleşmede yazılı gün ve saatte, aynı şekilde, aldığı yerde geri vereceğini kabul etmiştir. Kira süresini; en az 24 saat öncesinden haber verip, kiralayanın muvafakatini almak ve kira depozitine gerekli miktarı eklemek kaydıyla uzatabilir.
<br/>
                        2) Kiracı, aracı aşağıda belirtilen durumlarda kullanmayacağını kabul ve taahhüt eder.a.T.C. kanunlarınca taşınması suç sayılan her türlü eşyanın taşınması ve diğer gayri kanuni işlerde,
                        a. Başka bir aracı veya romorü çekmekte veya itmekte
                        b. Yarış hız hız tayini, ralli, denemeler, motorlu sporlarda
                        c. Normal trafiğe kapalı ve uygun olmayan yollarda
                        d. Trafik kuralları tarafından saptanmış yolcu sayısının üstünde yolcu ve her ne şekilde olursa olsun bagaj dışı yük ve patlayıcı, parlayıcı maddeler taşınmasında,
                        e. Alkol ve uyuşturucu maddelerin etkisi altında,
                        f. Ödeme şekli ne olursa olsun, ivaz karşılığında, yolcu ve mal taşımada
                        <br/>
                        3) Sözleşmenin düzenlendiği sırada, kiracının 21 yaşını doldurmuş olması, en az iki yıllık, geçerli ehliyetini ibrazı gerekir.
                        <br/>
                        4) Kiracı; kiralayanın onayı olmaksızın, aracı üçüncü şahıslara kullandıramaz. Bu durumda kiracı aracı kullanacak üçüncü şahsın kimlik, adres ve ehliyetine ilişkin bilgileri sözleşmeye kaydettirmeye ve kiralanan vasıtayı kullanma yetkisi tanıdığı kişinin, bu kontratın tüm koşullarına tamamen uymasını sağlamaya mecburdur. Aracı kullanan kişiler, kontratta imzaları olmasa dahi kiracı ile birlikte müteselsilen sorumludurlar.
                        <br/>
                        5) Kiracı; Bu sözleşmede belirtilen ikametgah adresinin doğruluğunu beyanla, bu adresteki her hangi bir değişikliği kiralayana derhal yazılı olarak bildireceğini, aksi takdirde sözleşmede yazılı adresine yapılacak gerek idari gerekse hukuki tebligatların geçerli sayılacağını ve tebliğ konusunda herhangi bir itirazda bulunulmayacağını taahhüd eder.
                        <br/>
                        6) Kiracı, seyir dışında aracı trafik kurallarına uygun ve güvenliğini sağlayacak biçimde emniyetli bir yerde kapalı ve kilitli olarak park etmekle yükümlüdür.
                        <br/>
                        7) Kiracı, aracı kiralayana teslim anında, araca ait resmi belgeleri (Trafik belgesi, Tescil belgesi, Sigorta, Plakalar) iade edilmediğinde bunların teminine kadar geçecek süreye ait kirayı ödeyeceği gibi, kaybı halinde yenilerinin alınması için yapılacak giderleride demekle yükümlüdür.
                        <br/>
                        8) Aracın; herhangi bir olay nedeniyle, kiracının; kusuru olsun ya da olmasın, yetkili makamlarca müsaderesi veya el konması halinde geri alınması için yapılacak olan her türlü girişime ilişkin harcamalar bedeli, kiracı tarafından kiralayana nakten ve defaten ödenir.
                        <br/>
                        9) Trafik cezaları ve aracın trafikçe çekilmesi sırasında meydana gelecek hasar kiracıya ait olup, aracın trafikçe alıkonulması durumunda bu süre kiralama süresine dahil edilir.
                        <br/>
                        10) Kiracı aracın kiralayana iadesinden sonra araçta bırakılan herhangi bir malın kaybından veya hasarlanmasından doğacak herhangi bir sorumluluktan, bunlarla ilgili masraflarda dahil kiralayanı peşinen ibra etmiştir.
                        <br/>
                        11) Kiralayan; aracın üretimini yapmadığından, vasıtanın ve yedek parçalarının mekanik veya imalat hatasından meydana gelebilecek kaza, herhangi bir kayıp ve sakatlıktan sorumlu tutulamaz.
                        <br/>
                        12) Kiralayanın yazılı izni olmaksızın araçlar yurt dışına çıkarılamaz.
                        <br/>
                        13) Kiracı, hiçbir şekilde bu sözleşmede doğan hakları, aracın içindeki donanım ve gereçleri devir, temlik ve terhin edemez. Bunları kiralayana zarar verecek biçimde kullanamaz.
                        <br/>
                        14) Her durumda kiracı ve kiralayan, üçüncü şahıslara karşı sahip oldukları tazminat haklarının takibinden birbirlerine gerekli kolaylıkları gösterip, hakları oranında birbirlerine vekalet vermek ve de dava haklarının temlik etmek zorunda olup, yargılama giderleri bu oran dahilinde paylaşılır.
                        <br/>
                        15) Kiracı, kira kontratında belirtilen şahsi bilgilerinin kiralayanın şahsi dosyasında saklanmasına, ayrıca kiranın zamanında ödenmesine, aracın zamanında teslim edilmesi gibi sözleşmeye aykırı durumlarda, adının uyarı listesine yazılmasına peşinen muvafakat eder.
                        <br/>
                        16) Kiralayan; kiracının belirtilen şartlardan her hangi birine uyulmaması durumunda cezai yollara başvurmaya tedbir veya hüküm istihsaline hacet kalmaksızın. Aracın derhal geri alabilir dilerse peşin verilmiş kira bedelini irad kaydedebilir.
                        <br/>
                        17) Kiralayan; bir sebep göstermek ve tazminat ödemek zorunda olmaksızın sözleşmeyi dilediği zaman fesh edebileceği gibi uzatmaktan da kaçınabilir.
                        <br/>
                        18) Benzin ücreti kiracıya aittir.
                        <br/>
                        19) BAKIM: Kiracı; kira süresi içinde, aracın yağını, suyu ve lastik havalarını kontrol etmekle yükümlüdür. Kiracı: kira süresi içinde vasıtanın periyodik bakımlarının, yağ değişimi ve benzeri gibi kiralayanın en yakın bürosuna baş vurarak ücretsiz yaptıracaktır. Bunun mümkün olmadığı hallerde akımı yetkili servis istasyonunda yaptıracak masrafları kiralayanın adına alacağı fatura karşılığında kendisine iade edilecektir.
                        <br/>
                        20) TAMİRAT: Normal kullanma ve eskime sonucu yapılan tamirat, yedek parça ve lastik değiştirme masrafları kiralaya aittir. Normal kullanım harici, ihmal ve hatalı kullanım sonucu (yağsız, susuz kullanım, donma, lastik yarılması gibi) yapılacak tamirat, parça ve lastik masrafları ile aracın hareket etmemiş durumunda kiralandığı yere getirilmesi için yapılan taşıma harcamaları ve geçerli tarife üzerinden hesaplanarak aracın işten kalma ücreti kiracıya aittir. Acil durumlarda gerekebilecek acil onarımlar, Kiralayan''a bildirilip onayı alınarak yaptırılır, masrafları kiralayanın adına aldığı fatura karşılığında kiracıya iade edilir.
                        <br/>
                        21) Taraflar arasında azılı olarak kararlaştırılmadıkça bu şartlardaki herhangi bir ilave veya değişiklik hükümsüzdür.
                        <br/>
                        22) Kiracı ile kiralayan arasındaki anlaşmazlıklar İzmir Mahkemeleri ve İcra Dairelerinde, T.C. Kanunlarına göre çözümlenecektir.
                        <br/>
                    <p style="color: #0A246A">23) ÖDEME:</p> Kiracı: geçerli fiat tarifesindeki kira bedeli ile imzasını atarak kabul ettiği seçenekli maddelerin bedelini ve kira sonunda ortaya çıkabilecek ücretleri, kanunen uygulanan vergileri ile ödemeyi kabul eder. Sözleşmenin düzenlenmesi sırasında o tarihte geçerli tarifeye göre yaklaşık kira tutarı üzerinden depozit alınır. Bu depozito kiralama bitiminde saptanacak kesin hesap sonucuna göre tasfiye edilir. Kiracı bu sözleşme ile tahakkuk edecek borçlarından mahsup edemez. Ödemeler nakden ve defaten yapılır. Kiracı gecikmelerde, ödenmeyen miktar üzerinden, yıllık vadeli mevduata uygulanan faizi ödemeyi bile itiraz kabul ve taahhüt eder. Bir günlük kira 24 saat, haftalık veya aylık kira süreleri ise 7 ve 30 gün üzerinden hesap edilir. 3 saati geçen gecikmeler tam gün olarak hesaplanır.
                        <br/>
                        <p style="color: #0A246A">24) SİGORTA:</p>
                        <br/>
                        A) Kiralanan araçlar; Karayolları Trafik Yasası uyarınca zarar gören üçüncü şahıslara karşı, yasal poliçe sınırları içinde Mecburi Mali Mesuliyet Sigortası ile sigortalanmıştır. Kiralayan; üçüncü şahıslara zarar veren kazalar sonucu oluşacak sorumluluğu, her araç için yaptırılmış. Mecburi Mali Mesuliyet Sigortası teminat kapsamı hadleri halinde kalmak şartı ile, sigorta şirketinden alacağı tazminat miktarında yüklenir. Bu hadlerin üstündeki sorumluluk ve kazaya uğrayan kişilerin ve yakınlarının manevi tazminat talepleri kapsamı hadleri dahilinde kalmak şartı ile, sigorta şirketinden alacağı tazminat miktarında yüklenir. Bu hadlerin üstündeki sorumluluk ve kazaya uğrayan kişilerin ve yakınlarının manevi tazminat talepleri kiracıya ait olup, kiralayan, kiracıya rücu hakkını mahfuz tutar.
                        <br/>
                        B) Kiracı kiraladığı aracın çalışmasından veya her türlü kaza sonucu uğrayacağı zararlardan, aracın kiralandığı yere getirilmesi için yapılan taşıma harcamalarından ve aracın tamir süresince işlem kalma ücretinden itirazsız sorumludur.
                        <br/>
                        C) Ancak: kiranın başlangıcında belirlenen hasar muafiyet pirimini ödemeyi kabul eden kiracı, aşağıda belirtilen şartları yerine getirdiği takdirde bu sorumluluklardan kurtulur.
                        <br/>
                        a- Kiracı ve yetkili sürücü; doktor raporu ile saptanmış engelleyici durumu yoksa, kaza yerinde gereken güvenlik önlemlerini alacak, hasarlı araca her şekilde olursa olsun müdahale etmeyecek, ilgili kişi ve tanıkların isim adreslerini tespit edecek, kazayı kiralayan ve en yakın görevlilerine derhal haber verecektir.
                        <br/>
                        b- Sorumluluk ve suçun takdiri yetkili makamlara ait olduğundan, ifadesinde sadece olayın oluş tarzını anlatacak peşinen suçu ve sorumluluğu kabullenmeyecektir.
                        <br/>
                        c- Kiracı; kazanın olduğu en yakın yere en yakın yetkili makamdan alınmış (Trafik Polisi veya Jandarma) Trafik Kazası Tespit Tutanağı’nı alkol raporunu, şahit isim ve adreslerini, en geç 48 saat içinde kiralayana teslim edecektir.
                        <br/>
                        d- Çalınma halinde, kiracı, derhal en yakın polis veya jandarma karakoluna ve kiralayana haber verecektir.
                        <br/>
                        TEMİNAT DIŞINDA KALAN HALLER
                        <br/>
                        1) Kaza ve alkol raporunun olmadığı durumlar
                        <br/>
                        2) Kazanın sözleşmede adı yazılı olmayan bir sürücünün yönetiminde meydana gelmesi durumu
                        <br/>
                        3) Sürücünün kaza sırasında alkol veya uyuşturucu etkisi altında olduğu durumlar
                        <br/>
                        4) Sürücünün geçerli ehliyete sahip olmadığı durumlar
                        <br/>
                        5) Trafik kurallarının ihlali ve aşırı hız dolayısıyla meydana gelen kazalar
                        <br/>
                        6) Sürücünün %100 kusurlu olduğu durumlar
                        <br/>
                        7) Kira sözleşmesinde belirtilen süre dışında meydana gelen kaza ve hasarlar
                        <br/>
                        8) Başka bir aracın ya da hareket eden veya etmeyen nesnelerin çekilmesi, itilmesi, yüklenerek taşınması sırasında meydana gelecek kaza ve hasarlar,
                        <br/>
                        9) Aracın, yarış, hız tayini, ralli denemeleri, motorlu sporlar sırasında veya normal trafiğe kapalı, uygun olmayan yollarda kullanılması sırasında meydana gelecek kazalar hasarlar
                        <br/>
                        10) Trafik kuralları tarafından saptanmış yolcu sayısının üstünde yolcu ve her ne şekilde olursa olsun bagaj dışı yük ve patlayıcı, parlayıcı maddeler taşınması sırasında meydana gelecek kaza ve hasarlar
                        <br/>
                        11) Sigara ve emsali yakıcı maddenin tesiri ile alevli bir yangın başlangıcı olmaksızın husule gelen yanıklar
                        <br/>
                        12) Aracın döşemesinde meydana gelecek yanık ve lekeler
                        <br/>
                        13) Hatalı kullanımdan meydana gelecek lastik yarılmaları, teminat dışında olup, bu durumlarda meydana gelecek hasarlardan tamamen kiracı sorumludur.
                        <br/>
                        14) Kendisine atfı kabul olmayan her türlü fiil ve ihmalden dolayı sigorta tazminatından kısmen veya hiç istifade edemeyen kiralayan tahsil edemediği zarar için ve aracın işten kalma tazminatı için kiracıya rücu hakkına sahiptir.</p>
                    <br/>
                </div>
            </div>
        </section>
        <!-- /PAGE WITH SIDEBAR -->

    </div>
    <!-- /CONTENT AREA -->

    <div id="to-top" class="to-top">
        <i class="fa fa-angle-up"></i>
    </div>

</div>
<!-- /WRAPPER -->

<%@include file="/WEB-INF/views/template/footer.jsp"%>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/superfish/js/superfish.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/js/moment-with-locales.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/owl-carousel2/owl.carousel.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.easing.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.smoothscroll.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/swiper/js/swiper.jquery.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/prettyphoto/js/jquery.prettyPhoto.js"></script>

<!-- JS Page Level -->
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/theme-ajax-mail.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/js/theme.js"></script>
<script
        src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
<script
        src="<%=request.getContextPath()%>/resources/themefolder1/assets/plugins/jquery.cookie.js"></script>
<script src="<%=request.getContextPath()%>/resources/ajax.js"></script>
<script src="<%=request.getContextPath()%>/resources/header.js"></script>

</body>
<!-- END BODY -->
</html>