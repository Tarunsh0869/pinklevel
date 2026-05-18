// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get chooseLanguage => 'भाषा चुनें';

  @override
  String get continueText => 'आगे बढ़ें';

  @override
  String get dashboard => 'डैशबोर्ड';

  @override
  String get assessment => 'स्वयं जांच';

  @override
  String get guide => 'गाइड';

  @override
  String get doctorVisit => 'डॉक्टर से मिलें';

  @override
  String get disclaimer => 'डिस्क्लेमर';

  @override
  String get mythsFacts => 'मिथक और तथ्य';

  @override
  String get warningSigns => 'चेतावनी संकेत';

  @override
  String get normalVsAbnormal => 'सामान्य बनाम असामान्य';

  @override
  String get startAssessment => 'जांच शुरू करें';

  @override
  String get safetyDisclaimer => 'सुरक्षा डिस्क्लेमर';

  @override
  String get dashboardGreeting => 'नमस्ते 👋';

  @override
  String get dashboardSubtitle => 'आज आप कैसा महसूस कर रहे हैं?';

  @override
  String get dashboardCTATitle => 'क्या आप स्वयं जांच के लिए\nतैयार हैं?';

  @override
  String get dashboardCTASubtitle =>
      'यह एक आसान चरण-दर-चरण गाइड है\nजिसमें लगभग 5 मिनट लगते हैं। घबराने की जरूरत नहीं।';

  @override
  String get dashboardCTAButton => 'स्वयं जांच शुरू करें';

  @override
  String get dashboardQuickOptions => 'त्वरित विकल्प';

  @override
  String get dashboardAssessmentTitle => 'स्वयं मूल्यांकन';

  @override
  String get dashboardAssessmentSubtitle => 'लक्षणों की जांच करें';

  @override
  String get dashboardWarningTitle => 'चेतावनी संकेत';

  @override
  String get dashboardWarningSubtitle => 'किन बातों पर ध्यान दें';

  @override
  String get dashboardMythsTitle => 'मिथक और तथ्य';

  @override
  String get dashboardMythsSubtitle => 'सही जानकारी पाएं';

  @override
  String get dashboardDoctorTitle => 'डॉक्टर विजिट';

  @override
  String get dashboardDoctorSubtitle => 'डॉक्टर से कब मिलें';

  @override
  String get dashboardInfoBanner =>
      'याद रखें: स्वयं जांच, डॉक्टर द्वारा की जाने वाली मेडिकल जांच का विकल्प नहीं है।';

  @override
  String get exitAppTitle => 'ऐप बंद करें?';

  @override
  String get exitAppContent => 'क्या आप सच में ऐप बंद करना चाहते हैं?';

  @override
  String get exitAppCancel => 'रद्द करें';

  @override
  String get exitAppConfirm => 'बंद करें';

  @override
  String get assessmentTitle => 'स्वयं मूल्यांकन';

  @override
  String assessmentProgressLabel(int answered, int total) {
    return '$answered में से $total उत्तर दिए';
  }

  @override
  String get assessmentSubmit => 'सबमिट करें';

  @override
  String get assessmentResultConsult => 'कृपया डॉक्टर से सलाह लें';

  @override
  String get assessmentResultNoConcern => 'कोई चिंता वाली बात नहीं दिखी';

  @override
  String get assessmentResultConsultBody =>
      'आपने एक या अधिक प्रश्नों का उत्तर \"हाँ\" दिया है। इसका मतलब यह नहीं है कि आपको कैंसर है, लेकिन सही जांच के लिए स्वास्थ्य विशेषज्ञ या डॉक्टर से सलाह लेना जरूरी है।';

  @override
  String get assessmentResultNoConcernBody =>
      'आपने सभी प्रश्नों का उत्तर \"नहीं\" दिया है। हर महीने स्वयं जांच जारी रखें और नियमित स्वास्थ्य जांच के लिए डॉक्टर से संपर्क करते रहें।';

  @override
  String get assessmentGoHome => 'होम पर वापस जाएं';

  @override
  String get assessmentRetake => 'फिर से मूल्यांकन करें';

  @override
  String get assessmentYes => 'हाँ';

  @override
  String get assessmentNo => 'नहीं';

  @override
  String get assessmentQ1 =>
      'क्या आपको स्तन या बगल में कोई नई गांठ या मोटापन महसूस हो रहा है?';

  @override
  String get assessmentQ2 =>
      'क्या आपने अपने स्तन के आकार या बनावट में कोई बदलाव देखा है?';

  @override
  String get assessmentQ3 =>
      'क्या स्तन की त्वचा पर गड्ढे, सिकुड़न या लालिमा दिखाई दे रही है?';

  @override
  String get assessmentQ4 => 'क्या निप्पल से कोई असामान्य स्राव हो रहा है?';

  @override
  String get assessmentQ5 =>
      'क्या निप्पल अंदर की ओर मुड़ रहा है या उसकी दिशा में बदलाव दिख रहा है?';

  @override
  String get assessmentQ6 =>
      'क्या स्तन या निप्पल के हिस्से में लगातार दर्द महसूस हो रहा है?';

  @override
  String get guideFinish => 'समाप्त करें';

  @override
  String get guideNextStep => 'अगला चरण';

  @override
  String get guidePrevious => 'पिछला';

  @override
  String get guideLookFor => 'इन बदलावों को देखें:';

  @override
  String get guideClinicalAdvice => 'क्लिनिकल सलाह';

  @override
  String get guideStep1Title => 'दृश्य निरीक्षण';

  @override
  String get guideStep1Desc =>
      'आईने के सामने सीधे खड़े हों। अपने कंधे सीधे रखें और हाथों को कमर पर रखें।';

  @override
  String get guideStep1Look1 => 'आकार, बनावट या रंग में बदलाव';

  @override
  String get guideStep1Look2 => 'त्वचा में गड्ढे, सिकुड़न या उभार';

  @override
  String get guideStep1Look3 => 'निप्पल की स्थिति में बदलाव या लालिमा';

  @override
  String get guideStep1Advice =>
      'स्वयं जांच करने का सही समय आमतौर पर पीरियड खत्म होने के कुछ दिन बाद होता है।';

  @override
  String get guideStep2Title => 'हाथ ऊपर उठाएं';

  @override
  String get guideStep2Desc =>
      'दोनों हाथों को सिर के ऊपर उठाएं और आईने में ध्यान से बदलाव देखें।';

  @override
  String get guideStep2Look1 => 'स्तन के आकार या समानता में बदलाव';

  @override
  String get guideStep2Look2 => 'त्वचा में खिंचाव, गड्ढे या सिकुड़न';

  @override
  String get guideStep2Look3 => 'निप्पल की दिशा या स्थिति में बदलाव';

  @override
  String get guideStep2Advice =>
      'हाथ ऊपर उठाने पर कुछ बदलाव ज्यादा साफ दिखाई दे सकते हैं।';

  @override
  String get guideStep3Title => 'निप्पल स्राव जांचें';

  @override
  String get guideStep3Desc =>
      'प्रत्येक निप्पल को बहुत हल्के से दबाकर देखें कि कोई असामान्य स्राव तो नहीं हो रहा।';

  @override
  String get guideStep3Look1 => 'खून जैसा या साफ तरल स्राव';

  @override
  String get guideStep3Look2 => 'सिर्फ एक निप्पल से स्राव';

  @override
  String get guideStep3Look3 => 'असामान्य तरल निकलना';

  @override
  String get guideStep3Advice =>
      'अगर खून जैसा या साफ स्राव दिखे तो डॉक्टर से सलाह लें।';

  @override
  String get guideStep4Title => 'लेटकर जांच';

  @override
  String get guideStep4Desc =>
      'लेट जाएं और एक हाथ सिर के पीछे रखें। उंगलियों के पोरों से जांच करें।';

  @override
  String get guideStep4Look1 => 'कोई गांठ या कठोर भाग';

  @override
  String get guideStep4Look2 => 'मोटा या अलग महसूस होने वाला ऊतक';

  @override
  String get guideStep4Look3 => 'दर्द वाला हिस्सा';

  @override
  String get guideStep4Advice =>
      'उंगलियों के पोरों का उपयोग करें, न कि सिरों का।';

  @override
  String get guideStep5Title => 'खड़े होकर जांच';

  @override
  String get guideStep5Desc =>
      'खड़े होकर या बैठकर उसी गोलाकार तरीके से जांच दोहराएं।';

  @override
  String get guideStep5Look1 => 'नई गांठ या सूजन';

  @override
  String get guideStep5Look2 => 'दर्द या संवेदनशील हिस्सा';

  @override
  String get guideStep5Look3 => 'बगल के पास कोई बदलाव';

  @override
  String get guideStep5Advice =>
      'नहाते समय खड़े होकर जांच करना आसान हो सकता है।';

  @override
  String get warningSignsTitle => 'स्तन में दिखने वाले बदलाव';

  @override
  String get warningSignsSubtitle =>
      'इन बदलावों का मतलब हमेशा कैंसर नहीं होता, लेकिन इनके बारे में डॉक्टर या योग्य स्वास्थ्य विशेषज्ञ से बात करना सही रहता है।';

  @override
  String get warningSignsViewNormal =>
      'सामान्य और चिंताजनक बदलावों की तुलना करें';

  @override
  String get warningSignsBanner =>
      'स्तन में होने वाले कई बदलाव कैंसर नहीं होते। अगर कोई बदलाव नया हो, आपके लिए असामान्य लगे, या ठीक न हो, तो स्वास्थ्य विशेषज्ञ से जांच करवाना बेहतर है।';

  @override
  String get warningSign1Title => 'नई गांठ या मोटा हिस्सा';

  @override
  String get warningSign1Desc =>
      'स्तन या बगल में नई गांठ, कड़ा स्थान या मोटा हिस्सा महसूस होना, जो आसपास के हिस्से से अलग लगे।';

  @override
  String get warningSign2Title => 'त्वचा में गड्ढे या बनावट में बदलाव';

  @override
  String get warningSign2Desc =>
      'त्वचा में गड्ढे, सिकुड़न, खिंचाव या संतरे के छिलके जैसी असमान बनावट दिखना।';

  @override
  String get warningSign3Title => 'निप्पल में बदलाव';

  @override
  String get warningSign3Desc =>
      'निप्पल का नया-नया अंदर की ओर मुड़ना, दिशा बदलना या आपके लिए सामान्य से अलग दिखना।';

  @override
  String get warningSign4Title => 'निप्पल से स्राव';

  @override
  String get warningSign4Desc =>
      'निप्पल से ऐसा स्राव होना जो आपके लिए नया हो, खासकर खून जैसा, साफ पानी जैसा या बिना दबाए निकलने वाला।';

  @override
  String get warningSign5Title => 'सूजन या आकार में बदलाव';

  @override
  String get warningSign5Desc =>
      'पूरे स्तन या किसी हिस्से में सूजन, या आकार में नया बदलाव, भले ही कोई गांठ महसूस न हो।';

  @override
  String get warningSign6Title => 'लालिमा, दाने या घाव जैसा बदलाव';

  @override
  String get warningSign6Desc =>
      'निप्पल या स्तन की त्वचा पर लालिमा, पपड़ी, मोटापन, दाने या घाव जैसा बदलाव जो बना रहे।';

  @override
  String get normalVsAbnormalPageTitle => 'सामान्य बनाम असामान्य';

  @override
  String get normalVsAbnormalHeading => 'सामान्य क्या है?';

  @override
  String get normalVsAbnormalSubtitle =>
      'अपने शरीर में होने वाले सामान्य बदलावों को समझना जरूरी है ताकि आप उन बदलावों को पहचान सकें जिन पर ध्यान देना जरूरी है।';

  @override
  String get normalColumnTitle => 'सामान्य';

  @override
  String get abnormalColumnTitle => 'डॉक्टर से मिलें';

  @override
  String get normalItem1 => 'दोनों स्तनों के आकार में हल्का अंतर';

  @override
  String get normalItem2 => 'पीरियड से पहले हल्की संवेदनशीलता';

  @override
  String get normalItem3 => 'हल्की गांठदार या रस्सी जैसी बनावट';

  @override
  String get normalItem4 => 'गर्भावस्था के दौरान स्राव';

  @override
  String get normalItem5 => 'मासिक चक्र के दौरान आकार में बदलाव';

  @override
  String get abnormalItem1 => 'नई कठोर या बिना दर्द वाली गांठ';

  @override
  String get abnormalItem2 => 'त्वचा में गड्ढे या सिकुड़न';

  @override
  String get abnormalItem3 => 'निप्पल का अंदर की ओर मुड़ना';

  @override
  String get abnormalItem4 => 'निप्पल से खून जैसा स्राव';

  @override
  String get abnormalItem5 => 'लगातार लालिमा या दाने';

  @override
  String get abnormalItem6 => 'बिना कारण आकार में बदलाव';

  @override
  String get normalVsAbnormalBanner =>
      'आप अपने शरीर को सबसे अच्छे से जानते हैं। अगर कुछ अलग या गलत लगे, तो अपनी भावना पर भरोसा करें और स्वास्थ्य विशेषज्ञ से सलाह लें।';

  @override
  String get mythsFactsHeading => 'मिथक और तथ्य को समझें';

  @override
  String get mythsFactsSubtitle =>
      'गलत जानकारी नुकसानदायक हो सकती है। यहां कुछ जरूरी तथ्य दिए गए हैं जिन्हें जानना आवश्यक है।';

  @override
  String get mythLabel => 'मिथक';

  @override
  String get factLabel => 'तथ्य';

  @override
  String get myth1 => 'सिर्फ परिवार में इतिहास होने पर ही स्तन कैंसर होता है।';

  @override
  String get fact1 =>
      'कई मामलों में स्तन कैंसर उन महिलाओं में भी हो सकता है जिनके परिवार में इसका कोई इतिहास नहीं होता। इसलिए सभी महिलाओं को जागरूक रहना चाहिए।';

  @override
  String get myth2 => 'स्तन में गांठ का मतलब हमेशा कैंसर होता है।';

  @override
  String get fact2 =>
      'हर गांठ कैंसर नहीं होती। कई गांठें सामान्य या गैर-कैंसर वाली हो सकती हैं। फिर भी नई गांठ दिखे तो डॉक्टर से जांच जरूर करवानी चाहिए।';

  @override
  String get myth3 => 'स्तन कैंसर केवल अधिक उम्र की महिलाओं को होता है।';

  @override
  String get fact3 =>
      'उम्र बढ़ने के साथ जोखिम बढ़ सकता है, लेकिन स्तन कैंसर किसी भी उम्र में हो सकता है। पुरुषों में भी स्तन कैंसर हो सकता है, हालांकि यह कम होता है।';

  @override
  String get myth4 => 'अंडरवायर ब्रा पहनने से स्तन कैंसर होता है।';

  @override
  String get fact4 =>
      'ब्रा के प्रकार या पहनने की आदत और स्तन कैंसर के बीच कोई प्रमाणित वैज्ञानिक संबंध नहीं है।';

  @override
  String get myth5 => 'मैमोग्राम करवाने से कैंसर फैल जाता है।';

  @override
  String get fact5 =>
      'मैमोग्राम कम मात्रा की रेडिएशन का उपयोग करता है और सामान्य रूप से सुरक्षित माना जाता है। शुरुआती पहचान के लाभ इसके जोखिम से अधिक होते हैं।';

  @override
  String get myth6 => 'पुरुषों को स्तन कैंसर नहीं हो सकता।';

  @override
  String get fact6 =>
      'पुरुषों को भी स्तन कैंसर हो सकता है, हालांकि यह दुर्लभ होता है। इसलिए किसी भी असामान्य बदलाव को नजरअंदाज नहीं करना चाहिए।';

  @override
  String get doctorVisitPageTitle => 'डॉक्टर विजिट गाइड';

  @override
  String get doctorVisitHeading => 'डॉक्टर से कब मिलें';

  @override
  String get doctorVisitSubtitle =>
      'अगर आपको कोई चिंताजनक बदलाव दिखे तो इंतजार न करें। समय पर डॉक्टर से जांच करवाना बहुत जरूरी है।';

  @override
  String get doctorVisitWhenTitle => 'इन स्थितियों में डॉक्टर से मिलें:';

  @override
  String get doctorVisitWhatTitle => 'क्या लेकर जाएं:';

  @override
  String get doctorVisitQuestionsTitle => 'डॉक्टर से पूछें:';

  @override
  String get doctorVisitBookButton => 'डॉक्टर अपॉइंटमेंट बुक करें';

  @override
  String get doctorVisitDisclaimerButton => 'सुरक्षा अस्वीकरण देखें';

  @override
  String get doctorVisitBanner =>
      'नियमित जांच और पेशेवर स्क्रीनिंग जरूरी है, भले ही आप ठीक महसूस करें। शुरुआती पहचान जीवन बचाती है।';

  @override
  String get doctorWhen1 => 'स्तन या बगल में नई गांठ या कठोर भाग महसूस हो';

  @override
  String get doctorWhen2 => 'स्तन के आकार, बनावट या समानता में बदलाव दिखे';

  @override
  String get doctorWhen3 => 'निप्पल से स्राव हो, खासकर खून जैसा या साफ तरल';

  @override
  String get doctorWhen4 => 'निप्पल अंदर की ओर मुड़ जाए या उसकी स्थिति बदल जाए';

  @override
  String get doctorWhen5 => 'त्वचा में गड्ढे, सिकुड़न या बनावट में बदलाव दिखे';

  @override
  String get doctorWhen6 => 'लगातार लालिमा, दाने या सूजन बनी रहे';

  @override
  String get doctorWhen7 => 'स्तन या निप्पल में बिना कारण लगातार दर्द हो';

  @override
  String get doctorWhen8 =>
      'कोई भी अन्य असामान्य या लंबे समय तक रहने वाला बदलाव दिखे';

  @override
  String get doctorBring1 => 'वर्तमान दवाओं और सप्लीमेंट्स की सूची';

  @override
  String get doctorBring2 => 'अपना मेडिकल इतिहास और पहले की जांच रिपोर्ट';

  @override
  String get doctorBring3 => 'परिवार में स्तन या ओवरी कैंसर का इतिहास';

  @override
  String get doctorBring4 => 'लक्षणों की सूची और वे कब शुरू हुए';

  @override
  String get doctorBring5 => 'डॉक्टर से पूछने वाले सवालों की सूची';

  @override
  String get doctorBring6 => 'पहचान पत्र और जरूरी स्वास्थ्य दस्तावेज';

  @override
  String get doctorAsk1 => 'इन बदलावों का कारण क्या हो सकता है?';

  @override
  String get doctorAsk2 =>
      'क्या मुझे कोई जांच या इमेजिंग टेस्ट करवाने की जरूरत है?';

  @override
  String get doctorAsk3 => 'जांच या इलाज के अगले कदम क्या होंगे?';

  @override
  String get doctorAsk4 => 'मुझे कितनी बार स्तन की जांच करवानी चाहिए?';

  @override
  String get doctorAsk5 => 'क्या मेरे लिए कोई जोखिम कारक हैं?';

  @override
  String get doctorAsk6 => 'मुझे अगली मुलाकात कब तय करनी चाहिए?';

  @override
  String get doctorDialogTitle => 'स्वास्थ्य विशेषज्ञ से संपर्क करें';

  @override
  String get doctorDialogSubtitle => 'यह सुविधा आमतौर पर इनसे जुड़ सकती है:';

  @override
  String get doctorDialogOption1 => 'अपने डॉक्टर को कॉल करें';

  @override
  String get doctorDialogOption2 => 'ऑनलाइन बुकिंग पोर्टल';

  @override
  String get doctorDialogOption3 => 'मैसेजिंग सिस्टम';

  @override
  String get doctorDialogOption4 => 'नजदीकी क्लिनिक खोजें';

  @override
  String get doctorDialogNote =>
      'अभी के लिए कृपया अपने स्वास्थ्य विशेषज्ञ या डॉक्टर से सीधे संपर्क करें।';

  @override
  String get doctorDialogClose => 'बंद करें';

  @override
  String get disclaimerPageTitle => 'सुरक्षा अस्वीकरण';

  @override
  String get disclaimerHeading => 'महत्वपूर्ण अस्वीकरण';

  @override
  String get disclaimerBanner =>
      'यह ऐप केवल शैक्षिक उद्देश्य के लिए है। यह डॉक्टर की सलाह, जांच, निदान या उपचार का विकल्प नहीं है।';

  @override
  String get disclaimerNoteTitle => 'कृपया ध्यान दें:';

  @override
  String get disclaimerNote1 =>
      'किसी भी मेडिकल सलाह के लिए हमेशा योग्य स्वास्थ्य विशेषज्ञ या डॉक्टर से संपर्क करें।';

  @override
  String get disclaimerNote2 =>
      'स्वयं जांच, नियमित क्लिनिकल ब्रेस्ट एग्जाम या मैमोग्राम का विकल्प नहीं है।';

  @override
  String get disclaimerNote3 =>
      'अगर आपको कोई बदलाव दिखाई दे, तो जल्द से जल्द डॉक्टर से जांच करवाएं।';

  @override
  String get disclaimerNote4 =>
      'समय पर जांच और शुरुआती पहचान जीवन बचाने में मदद कर सकती है।';

  @override
  String get disclaimerNote5 =>
      'यह ऐप किसी भी प्रकार का निदान या उपचार की सलाह नहीं देता।';

  @override
  String get disclaimerUnderstood => 'मैं समझ गया/गई';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingNext => 'अगला';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get onboarding1Title => 'अपने शरीर को जानें';

  @override
  String get onboarding1Desc =>
      'हमारी चरण-दर-चरण गाइड की मदद से स्तन स्वयं जांच करना सीखें।';

  @override
  String get onboarding2Title => 'संकेतों को पहचानें';

  @override
  String get onboarding2Desc =>
      'जानें कि किन बदलावों पर ध्यान देना है और कब डॉक्टर से सलाह लेनी चाहिए।';

  @override
  String get onboarding3Title => 'स्वस्थ और सुरक्षित रहें';

  @override
  String get onboarding3Desc =>
      'नियमित स्वयं जांच और डॉक्टर द्वारा स्क्रीनिंग शुरुआती पहचान में मदद करती है।';
}
