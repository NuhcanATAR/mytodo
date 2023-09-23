import 'package:flutter/material.dart';

@immutable
class StringSplashConstant {
  const StringSplashConstant._();

  static const String appName = "MyTodo";
  static const String splashText1 = "Not Al";
  static const String splashText2 = "Hayatını Kolaylaştır!";
  static const String appCloseTitle = "Uygulama Güncelleniyor";
  static const String appCloseDescription =
      "Çok kısa bi süre sonra tekrar kullanıma açılacaktır.";
  static const String appErrorTitle = "Bir sorun oluştu!";
  static const String appErrorDescription =
      "Uygulama başlatılırken bir sorun oluştu, daha sonra tekrar deneyiniz.";
}

@immutable
class StringSliderConstant {
  const StringSliderConstant._();

  static const String sliderTitle1 = "Todolarınızı Oluşturun!";
  static const String sliderDescription1 =
      "Todolarınızı oluşturarak planlarınızı oluşturun.";

  static const String sliderTitle2 = "Kategorize edin!";
  static const String sliderDescription2 =
      "Todolarınızı planlarınız doğrultusunda kategorize edip ayırabilirsiniz.";

  static const String sliderTitle3 = "Zamanınızı Yönetin";
  static const String sliderDescription3 =
      "Todo oluşturarak zamanınızı yönetebilirsiniz.";

  static const String sliderTitle4 = "Favori Todolarını Kaydet";
  static const String sliderDescription4 =
      "Favori Todolarınızı tekrar görüntülemek için kaydedebilirsiniz.";

  static const String sliderTitle5 = "Önemli Todolar!";
  static const String sliderDescription5 =
      "Todolarınız arasında önemli olabilecek todoları ayrı bi yere kaydedebilirsinzi.";

  static const String sliderTitle6 = "Takvim Ajandınızı Oluşturun!";
  static const String sliderDescription6 =
      "Sizin için önemli olan günleri takvim üzerinden işaretleyebilir ve not alabilirsiniz.";

  static const String sliderNextBtn = "Devam et";

  static const String sliderEndTitle = "MyTodo";
  static const String sliderEndSubTitle =
      "Kıymetli Zamanını MyTodo ile planlamaya başlayın!";
  static const String sliderLoginBtn = "Giriş yap";
  static const String sliderRegisterBtn = "Kayıt ol!";
}

@immutable
class StringLoginConstant {
  const StringLoginConstant._();

  static const String title = "MyTodoya Hoşgeldiniz👋";
  static const String subTitle =
      "Hesabınız ile giriş yapabilirsiniz, hesabınız henüz yoksa kayıt olabilirsiniz.";

  static const String email = "Email Adresiniz *";
  static const String password = "Şifreniz *";

  static const String forgotPass = "Şifrenizimi unuttunuz?";
  static const String rememberMe = "Beni Hatırla";

  static const String loginBtn = "Giriş yap";

  static const String registerText = "Henüz hesabınız yokmu?";
  static const String registerBtnText = "Kayıt ol";

  // dialog
  static const String logUserNotFount =
      "Kullanıcı Bulunamadı, bilgilerinizi kontrol ediniz.";
  static const String wronPassword =
      "E-mail veya şifreniz hatalı tekrar deneyiniz.";
  static const String tooManyRequest =
      "Çok fazla başarısız giriş yaptınız, hesabınız askıya alındı, bir süre bekleyin ve tekrar girin.";
  static const String emailNotVerified =
      "Email adresinizi doğrulamadınız, email adresinizi size gönderilen postadan doğrulayın!";
}

@immutable
class StringRegisterConstant {
  const StringRegisterConstant._();

  static const String title = "MyTodoya Hoşgeldiniz👋";
  static const String subTitle =
      "Hesabınızı oluşturun ve işlerinizi planlamaya başlayın, tekrardan hoşgeldin.";

  static const String name = "Adınız *";
  static const String surname = "Soyadınız *";
  static const String email = "Email Adresiniz *";
  static const String password = "Şifreniz *";

  static const String registerBtn = "Kayıt ol!";

  // alerts
  static const String alertTitle = "Girilen email adresi kayıtlıdır!";
  static const String alerRegEndTitle =
      "Hesabınız Oluşturuldu, giriş yaparak todolarınızı oluşturmaya başlayabilirsiniz!";
}

@immutable
class StringForgotPasswordConstant {
  const StringForgotPasswordConstant._();

  static const String title = "Şifrenizimi Unuttunuz 🤔";
  static const String subTitle =
      "Kayıtlı Email Adresinizi girerek şifrenizi yenileyebilirsiniz.";

  static const String email = "E-mail Adresiniz *";

  static const String resetBtnMail = "Gönder";

  // alert
  static const String emailTrue =
      "Email adresinize sıfırlama bağlantısı gönderildi, şifrenizi sıfırlayabilirsiniz.";
  static const String emailFalse =
      "Email Adresi Bulunamadı, email adresinizi kontrol ediniz.";
}

@immutable
class StringTodoConstants {
  const StringTodoConstants._();

  // meeting create string
  static const String meetingCreateTitle = "Toplantı Oluşturun!";
  static String meetingCreateSubTitle =
      "Toplantı bilgilerinizi girerek planınızı kaydedin.";

  // goign place create string
  static const String goingPlaceTitle = "Seyahat Planınızı Oluşturun";
  static const String goingPlaceSubTitle =
      "Seyahat planınızı oluşturabilirsiniz.";
  static const String dateGoingStartDate = "Gidiş Tarihi";
  static const String dateGoingEndDate = "Geliş Tarihi";
  static const String cityStartLocationText = "Başlangıç Konumu *";
  static const String cityEndLocationText = "Gidilecek Konum *";
  static const String datePickerText = "Tarih Belirtin";

  // study create string
  static const String studyCreaeStartDate = "Başlangıç Tarihi";
  static const String studyCreaeEndDate = "Bitiş Tarihi";
  static const String studyCreateTitleText = "Ders Çalışma Planı Oluştur";
  static const String studyCreateSubTitleText =
      "Ders çalışma planınızı oluşturun ve planlı şekilde çalışmaya başlayın.";

  // book create string
  static const String bookCreateTitle = "Kitaplarınızı ekleyin";
  static const String bookCreateSubTitle =
      "Kitaplarınızı ekleyin ve kendinizi geliştirin daha çok kitap ekleyerek kendinizi geliştirin.";
  static const String pageCountText = "Sayfa Sayısı *";
  static const String bookCategoryText = "Kitap Kategorisi *";

  // shopping create string
  static const String shoppingCreateTitle = "Alışveriş Listenizi oluşturun.";
  static const String shoppingCreateSubTitle =
      "Alışveriş listenizi oluşturarak, daha kolay ve hızlı alışverişinizi yapın.";
  static const String shoppingTypeText = "Alışveriş Türü *";

  // healt create string
  static const String healthCreateTitle = "Sağlık Planınızı oluşturun.";
  static const String healthCreateSubTitle =
      "Sağlık planınızı oluşturarak, sağlınızı planlayın.";
  static const String healthCreateDate = "Gidiş Tarihi *";
  static const String healtType = "Kategori Seçimi *";

  // spor create string
  static const String sportTitle = "Spor Planlanlarınızı oluşturun!";
  static const String sportSubTitle =
      "Spor planlarınızı oluşturun ve düzenli spor yapmaya başlayın.";
  static const String sporDate = "Başlama Tarihi *";
  static const String sporTimeType = "Spor Vakti *";

  // movie create string
  static const String movieTitle = "Dizi & Film oluştur!";
  static const String movieSubTitle =
      "İzlemek istediğiniz veya izlediğiniz dizi veya filmleri not alabilirsiniz.";
  static const String movieCategory = "Kategorisi *";
  static const String button = "Kaydet";

  // meeting update string
  static const String meetingUpdateTitle = "Toplantı Bilgini Güncelle!";
  static const String meetingUpdateSubTitle =
      "Toplantı bilginizi güncelleyebilirsiniz.";

  // going to place update string
  static const String goingToPlaceUpdateTitle =
      "Seyahat Planınızı Güncelleyin!";
  static const String goingToPlaceUpdateSubTitle =
      "Seyahat planınızmı güncellemek istiyorsunuz? hemen güncelleyin.";

  // study update string
  static const String studyUpdateTitle = "Ders Çalışma planı güncelleme!";
  static const String studyUpdateSubTitle = "Çalışma planınızı güncelleyin.";

  // book update string
  static const String bookUpdateTitle = "Kitap Listenizi Güncelleyin!";
  static const String bookUpdateSubTitle = "Rafınızda duran kitabı değiştirin.";

  // shopping list update string
  static const String shoppingListUpdateTitle = "Alışveriş Listeni Güncelle!";
  static const String shoppingListUpdateSubTitle =
      "Alışveriş listenizi güncelleyin.";

  // healt update string
  static const String healthUpdateTitle = "Sağlık planınızı güncelleyin!";
  static const String healthUpdateSubTitle =
      "Sağlık planınızı güncelleyebilirsiniz.";

  // spor update string
  static const String sporUpdateTitle = "Spor Planlarınızı güncelleyin!";
  static const String sporUpdateSubTitle =
      "Spor planlarınızı hemen güncelleyin.";

  // movie update string
  static const String movieUpdateTitle = "Dizi & Film Listeni Güncelle!";
  static const String movieUpdateSubTitle =
      "İzleme listeni güncelleyebilirsin.";

  // button string
  static const String updateBtnText = "Güncelle!";

  // no todo title
  static const String noTodoTitle = "Henüz Toplantı Oluşturmadınız!";

  // no todo sub title
  static const String noTodoSubTitle =
      "Toplantı todosu oluşturmadınız isterseniz Toplantı todosu oluşturabilirsiniz.";

  // error todo title
  static const String errorTodoTitle = "Todolar Yüklenemedi!";
  // erro todo sub title
  static const String errorTodoSubTitle =
      "Todolar yüklenirken hata oluştu daha sonra tekrar deneyiniz.";

  // loading title
  static const String loadingTitle = "Todolar Yükleniyor...";
}

@immutable
class StringProfileConstants {
  const StringProfileConstants._();

  // title
  static const String title = "Profil";

  // menu 1
  static const String menu1 = "Ad Soyad Değiştir";
  // menu 2
  static const String menu2 = "E-mail Güncelle";
  // menu 3
  static const String menu3 = "Şifreni yenile";
  // menu 4
  static const String menu4 = "Çıkış Yap";
}
