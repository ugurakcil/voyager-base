## VOYAGER BASE

Laravel Voyager'ın hızlı kurulum ve kullanıma hazır bir yapılandırmasıdır. Düzenli, kolay geliştirilebilir bir kodlama yapmak için mevcut düzenin kurallarına uyulması gerekir. 

Burada ilk kurulum işlemleri ve geliştirme yaparken dikkat edilmesi gerekenler detaylarıyla yazılmıştır.

TODO: Version bilgileri yazılacak

### İlk Kurulum

- dex_website gibi bir veritabanı adı tanımlayın.
- utf8mb4_unicode_ci olarak ayarlayın
- ardından bu projenin ana dizinindeki database.sql'i içe aktarın

Terminalde aşağıdaki işlemleri yapın;

```bash
# virtual host tanımlamalarınızı yaptıktan sonra
# bu repoyu klonlayın
# sondaki voyager-base kurulacak klasörün adıdır, 
# proje adına göre değiştirin
git clone https://github.com/ugurakcil/voyager-base.git voyager-base

# kurulum yapılan dizine girin
cd voyager-base

# bağımlılıkları yükleyin
composer install

# env dosyasını kopyalayın
cp .env.example .env
```

Env dosyasında şu alanları düzenleyin;

```env
APP_NAME
APP_URL
DB_DATABASE
DB_USERNAME
DB_PASSWORD

MAIL_MAILER
MAIL_HOST
MAIL_PORT
MAIL_USERNAME
MAIL_PASSWORD
MAIL_ENCRYPTION
MAIL_FROM_ADDRESS
MAIL_FROM_NAME

NOCAPTCHA_SECRET
NOCAPTCHA_SITEKEY
```

Artisan işlemlerini yapın;

```bash
# Cookie'ler için sabit tekil anahtar yaratır
php artisan key:generate

# Storage klasörünü public_html altına symlinkler
php artisan storage:link
```

Linux'ta permission hatası alırsanız, ilgili klasörler için chmod çalıştırın.

### Frontend Kullanım

#### Genel Frontend Kullanım Bilgileri
1. Tüm stil, görsel ve scriptler `public_html/assets/front` klasöründedir
2. HTML katmanı `resources/viewa/front` klasöründedir
3. 3.parti eklentiler `public_html/assets/front/addons` klasöründedir. Bu klasörde custom script veya style tanımlaması, görsel eklemesi vb yapmayın. 3.parti eklentiler silinebilir, yeni sürüme geçirilebilir, bu durumda eklediğiniz kodlar uçar gider. Eklenti isimlerini kısa ve anlaşılır tutun. Küçük harflerle yazın. Hiçbir dosya adında Türkçe karakter ve boşluk kullanmayın. Yeni bir sürüm eklemeniz gerekirse `public_html/assets/front/addons/fontawesome` klasöründe olduğu gibi sürüm numaramalarını tam yazarak ekleyin.
4. Görselleri `public_html/assets/front/img` klasörüne kapsamlarına göre klasörlendirerek ekleyin. Örneğin farklı boyutlarda faviconlar bulunduğundan tüm faviconlar `public_html/assets/front/img/favicons` klasöründe bulunmaktadır. Default favicon `public_html/assets/front/img/favicons/favicon.ico` dosyasıdır.
5. js klasöründe sitenin tümünde kesinlikle kullanılacak ve site geliştirilse dahi çok büyük ihtimalle kullanılmaya devam edecek scriptlerinizi `main.js`e ekleyin. Hazırladığınız bir section'a özel kodları sitenin neredeyse her yerinde bulunmasına rağmen ayrı bir script dosyasına eklemeniz gerekir. Örneğin bir contact section'ınız varsa `contact.js`i örnekte olduğu gibi ayırmalısınız. `homepage.js` gibi sayfa sayfa ayrıştırma yaparak başka sayfalarda kullanılmayan özellik ve sectionların (slider, testimonals etc..) scriptlerini buradan yazın. Ardından section'ın bulunduğu resource'a ekleyin, layout veya foot-tags veya head-tags gibi global bir alana değil!
6. Javascript'e dil terimleri `LOCALIZE` global değişkeni üzerinden obje olarak gelir. Javascript dosyanızı yerelleştirmek için dil terimlerini `lang` klasöründe bulunan `script.php` dosyasından ekleyebilirsiniz. Ardından örn.: `LOCALIZE.hello_world` şeklinde erişebilirsiniz. `contact.js` dosyanızda örnek kullanım bulunmaktadır.

#### Live SASS Compiler Ayarları

`screens` klasöründe bir değişiklik yaptığınızda Live Sass Compiler sistemde bulunan bütün SCSS'leri derlemeye çalışır. Bunlar içinde scss yedekleri, 3.parti eklentilerin stilleri, Bootstrap'ın eklentileri vb. herşey olur ve çok uzun sürür. Bunun önüne geçmek için `hariç klasörleri` özellikle belirtmeliyiz. Aynı zamanda minified dosyalarda sorunun yaşıyorsanız aşağıdaki ayarları kullanın;

Not: savePath klasörü aktif kullanılmamakta fakat planlanmaktadır. CSS çıktılarını SCSS'nin bulunduğu dizin dışında bir klasörde toplamak için faydalı olacaktır.

```json
{
    "liveSassCompile.settings.formats":[
        // This is Default.
        {
        "format": "expanded",
        "extensionName": ".css",
        //"savePath": "~/../css/"
        },
        // You can add more
        {
        "format": "compressed",
        "extensionName": ".css",
        //"savePath": "/assets/styles/css"
        },
        // More Complex
        {
        "format": "compressed",
        "extensionName": ".min.css",
        //"savePath": "~/../css/"
        }
    ],
    "liveSassCompile.settings.excludeList": [ 
        "**/node_modules/**",
        ".vscode/**",
        "**/addons/**",
        "**/History/**",
        "**/vendor/**",
        "**/front/fonts/**",
   ],
    "editor.mouseWheelZoom": true,
    "editor.fontSize": 14,
    "window.zoomLevel": 1,
    "editor.renderWhitespace": "all",

    /*
    // Linux'da bash hatası için
    "terminal.integrated.profiles.linux": {
       "bash": {
	   "path": "/bin/bash"
	}
    },
    */
}
```

#### SCSS İşlemleri
1. Bütün custom stiller `public_html/assets/front/css` klasöründe bulunmaktadır
2. `public_html/assets/front/css/screens` klasöründe bulunan `_desktop.scss, _global.scss, _tablet.scss, _mobile.scss` dosyalarından geliştirme yapılmaktadır.
3. `_global.scss` dosyasını neredeyse hiç kullanmayın. Burası sadece tüm ekran boyutlarına etki edecek font tanımlamaları, button renkleri gibi işlemler içindir. 
4. Tasarım geliştirmeye `_desktop.scss` ile başlayın ardından `_tablet.scss`ye geçin. Tüm boyutlara etki eden ve hiç değişiklik göstermeyen tanımları `_global.scss`e taşıyın. Örneğin mavi ve 10px padding'e sahip bir primary buton global'de bulunabilir, slider section'ına 10px margin atayıp her çözünürlükte değiştirecekseniz global'de olmamalı.
5. RTL uyumluluğu için left, right, padding:x x x x gibi tanımlamaların özel kullanımları vardır. 
6. Left ve Right : Key tarafında `#{$left}` şeklinde, Value tarafında ise `$left` şeklinde kullanılmalıdırlar. Örn.: `margin-#{$left}:10px;` veya position:absolute; için `#{$left}:20px;`.. Value tarafında ise kullanımı : `float: $left;` veya `text-align:$left;`. Başlangıçta bu şekilde kodlayın, sonra hallederim deyip bırakmayın, her zaman eksik bırakılır ve RTL bir dilde saatlerce hatayı bulmak için uğraşırsınız. Left ve Right'ı Latin dillerinde olduğu gibi düşünerek ekleyebilirsin. Arapça ve Farsça gibi RTL dillerde otomatik olarak tersine çevrilmiş olacak.
7. `padding-${left}: 10px; padding-${right}: 20px;` gibi bir işlemin `padding: 0 20px 0 10px;` yazımında da RTL sorunu oluşacaktır. Bunu çözmek için `@include padding(0, 20, 0, 10);` şeklinde yazın. Tek satırlık `margin` için de bu mixin'i kullanabilirsiniz.
8. 3.parti bir yazılım `!important` kullanmamışsa ve onu ezmeniz gerekiyorsa kullanın. Bunun dışında asla `!important` kullanmayın!important
9. Gereken herşey örnekleri ile dosyalarda detaylı bir şekilde yazılmıştır. Bu yazıları yazmak saatler sürmüş olup okumak için erinmeyiniz.

### Backend Kullanım

TODO: Genel kullanım ve cache sorunları gibi sorunların çözümleri detaylandırılacak

#### Genel Backend Kullanım Bilgileri
1. Sitenin sabit dil terimlerini düzenlemek, eklemek için `lang` klasöründe `site.php` dosyasını kullanın.
2. Javascript'e dil terimleri `LOCALIZE` global değişkeni üzerinden obje olarak gelir. Javascript dosyanızı yerelleştirmek için dil terimlerini `lang` klasöründe bulunan `script.php` dosyasından ekleyebilirsiniz. Ardından örn.: `LOCALIZE.hello_world` şeklinde erişebilirsiniz. `contact.js` dosyanızda örnek kullanım bulunmaktadır.

### Yayın Aşamasında
1. APP_ENV ve APP_DEBUG değerlerini production için değiştirmeyi kesinlikle unutmayın
2. Yayına alındığında eski storage:link symlinkini silip yenisini yaratın
3. Tüm eski cacheleri artisan komutları ile temizleyin (optimize)
4. admin ve publisher şifrelerini yayına atmadan değiştirin, publisher rollerini gözden geçirin. Yeni eklediğiniz alanların rolleri atanamamış olabilir.