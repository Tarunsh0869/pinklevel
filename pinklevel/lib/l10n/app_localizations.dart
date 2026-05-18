import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
  ];

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @assessment.
  ///
  /// In en, this message translates to:
  /// **'Self Assessment'**
  String get assessment;

  /// No description provided for @guide.
  ///
  /// In en, this message translates to:
  /// **'Guide'**
  String get guide;

  /// No description provided for @doctorVisit.
  ///
  /// In en, this message translates to:
  /// **'Doctor Visit'**
  String get doctorVisit;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimer;

  /// No description provided for @mythsFacts.
  ///
  /// In en, this message translates to:
  /// **'Myths & Facts'**
  String get mythsFacts;

  /// No description provided for @warningSigns.
  ///
  /// In en, this message translates to:
  /// **'Warning Signs'**
  String get warningSigns;

  /// No description provided for @normalVsAbnormal.
  ///
  /// In en, this message translates to:
  /// **'Normal vs Abnormal'**
  String get normalVsAbnormal;

  /// No description provided for @startAssessment.
  ///
  /// In en, this message translates to:
  /// **'Start Assessment'**
  String get startAssessment;

  /// No description provided for @safetyDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Safety Disclaimer'**
  String get safetyDisclaimer;

  /// No description provided for @dashboardGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello 👋'**
  String get dashboardGreeting;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get dashboardSubtitle;

  /// No description provided for @dashboardCTATitle.
  ///
  /// In en, this message translates to:
  /// **'Ready for a self-exam?'**
  String get dashboardCTATitle;

  /// No description provided for @dashboardCTASubtitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s an easy step-by-step guide that takes about 5 minutes. No need to worry.'**
  String get dashboardCTASubtitle;

  /// No description provided for @dashboardCTAButton.
  ///
  /// In en, this message translates to:
  /// **'Start Self-Exam'**
  String get dashboardCTAButton;

  /// No description provided for @dashboardQuickOptions.
  ///
  /// In en, this message translates to:
  /// **'Quick Options'**
  String get dashboardQuickOptions;

  /// No description provided for @dashboardAssessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Self Assessment'**
  String get dashboardAssessmentTitle;

  /// No description provided for @dashboardAssessmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check your symptoms'**
  String get dashboardAssessmentSubtitle;

  /// No description provided for @dashboardWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Warning Signs'**
  String get dashboardWarningTitle;

  /// No description provided for @dashboardWarningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What to look for'**
  String get dashboardWarningSubtitle;

  /// No description provided for @dashboardMythsTitle.
  ///
  /// In en, this message translates to:
  /// **'Myths & Facts'**
  String get dashboardMythsTitle;

  /// No description provided for @dashboardMythsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get the right information'**
  String get dashboardMythsSubtitle;

  /// No description provided for @dashboardDoctorTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Visit'**
  String get dashboardDoctorTitle;

  /// No description provided for @dashboardDoctorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When to see a doctor'**
  String get dashboardDoctorSubtitle;

  /// No description provided for @dashboardInfoBanner.
  ///
  /// In en, this message translates to:
  /// **'Remember: Self-exam is not a substitute for a medical examination by a doctor.'**
  String get dashboardInfoBanner;

  /// No description provided for @exitAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Close App?'**
  String get exitAppTitle;

  /// No description provided for @exitAppContent.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to close the app?'**
  String get exitAppContent;

  /// No description provided for @exitAppCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get exitAppCancel;

  /// No description provided for @exitAppConfirm.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get exitAppConfirm;

  /// No description provided for @assessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Self-Assessment'**
  String get assessmentTitle;

  /// No description provided for @assessmentProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'{answered} of {total} answered'**
  String assessmentProgressLabel(int answered, int total);

  /// No description provided for @assessmentSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get assessmentSubmit;

  /// No description provided for @assessmentResultConsult.
  ///
  /// In en, this message translates to:
  /// **'Please Consult a Doctor'**
  String get assessmentResultConsult;

  /// No description provided for @assessmentResultNoConcern.
  ///
  /// In en, this message translates to:
  /// **'No Concerning Signs Found'**
  String get assessmentResultNoConcern;

  /// No description provided for @assessmentResultConsultBody.
  ///
  /// In en, this message translates to:
  /// **'You answered \"Yes\" to one or more questions. This does not mean you have cancer, but it is important to consult a healthcare professional for a proper examination.'**
  String get assessmentResultConsultBody;

  /// No description provided for @assessmentResultNoConcernBody.
  ///
  /// In en, this message translates to:
  /// **'You answered \"No\" to all questions. Continue monthly self-exams and stay in touch with your doctor for regular checkups.'**
  String get assessmentResultNoConcernBody;

  /// No description provided for @assessmentGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go Back to Home'**
  String get assessmentGoHome;

  /// No description provided for @assessmentRetake.
  ///
  /// In en, this message translates to:
  /// **'Retake Assessment'**
  String get assessmentRetake;

  /// No description provided for @assessmentYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get assessmentYes;

  /// No description provided for @assessmentNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get assessmentNo;

  /// No description provided for @assessmentQ1.
  ///
  /// In en, this message translates to:
  /// **'Do you feel any new lump or thickening in your breast or armpit?'**
  String get assessmentQ1;

  /// No description provided for @assessmentQ2.
  ///
  /// In en, this message translates to:
  /// **'Have you noticed any change in the size or shape of your breast?'**
  String get assessmentQ2;

  /// No description provided for @assessmentQ3.
  ///
  /// In en, this message translates to:
  /// **'Is there any dimpling, puckering, or redness on the skin of your breast?'**
  String get assessmentQ3;

  /// No description provided for @assessmentQ4.
  ///
  /// In en, this message translates to:
  /// **'Is there any unusual discharge from your nipple?'**
  String get assessmentQ4;

  /// No description provided for @assessmentQ5.
  ///
  /// In en, this message translates to:
  /// **'Is your nipple turning inward or has its direction changed?'**
  String get assessmentQ5;

  /// No description provided for @assessmentQ6.
  ///
  /// In en, this message translates to:
  /// **'Do you feel persistent pain in your breast or nipple area?'**
  String get assessmentQ6;

  /// No description provided for @guideFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get guideFinish;

  /// No description provided for @guideNextStep.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get guideNextStep;

  /// No description provided for @guidePrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get guidePrevious;

  /// No description provided for @guideLookFor.
  ///
  /// In en, this message translates to:
  /// **'Look for these changes:'**
  String get guideLookFor;

  /// No description provided for @guideClinicalAdvice.
  ///
  /// In en, this message translates to:
  /// **'Clinical Advice'**
  String get guideClinicalAdvice;

  /// No description provided for @guideStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Visual Inspection'**
  String get guideStep1Title;

  /// No description provided for @guideStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Stand in front of a mirror with your shoulders straight and your arms on your hips.'**
  String get guideStep1Desc;

  /// No description provided for @guideStep1Look1.
  ///
  /// In en, this message translates to:
  /// **'Changes in size, shape, or color'**
  String get guideStep1Look1;

  /// No description provided for @guideStep1Look2.
  ///
  /// In en, this message translates to:
  /// **'Dimpling, puckering, or bulging of the skin'**
  String get guideStep1Look2;

  /// No description provided for @guideStep1Look3.
  ///
  /// In en, this message translates to:
  /// **'A nipple that has changed position or redness'**
  String get guideStep1Look3;

  /// No description provided for @guideStep1Advice.
  ///
  /// In en, this message translates to:
  /// **'The best time to perform a self-exam is usually a few days after your period ends.'**
  String get guideStep1Advice;

  /// No description provided for @guideStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Raise Arms'**
  String get guideStep2Title;

  /// No description provided for @guideStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Raise your arms and look for the same changes.'**
  String get guideStep2Desc;

  /// No description provided for @guideStep2Look1.
  ///
  /// In en, this message translates to:
  /// **'Changes in breast symmetry'**
  String get guideStep2Look1;

  /// No description provided for @guideStep2Look2.
  ///
  /// In en, this message translates to:
  /// **'Skin pulling or dimpling'**
  String get guideStep2Look2;

  /// No description provided for @guideStep2Look3.
  ///
  /// In en, this message translates to:
  /// **'Changes in nipple direction'**
  String get guideStep2Look3;

  /// No description provided for @guideStep2Advice.
  ///
  /// In en, this message translates to:
  /// **'Some changes may be more visible with arms raised.'**
  String get guideStep2Advice;

  /// No description provided for @guideStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Check for Discharge'**
  String get guideStep3Title;

  /// No description provided for @guideStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'Gently squeeze each nipple to check for discharge.'**
  String get guideStep3Desc;

  /// No description provided for @guideStep3Look1.
  ///
  /// In en, this message translates to:
  /// **'Bloody or clear fluid'**
  String get guideStep3Look1;

  /// No description provided for @guideStep3Look2.
  ///
  /// In en, this message translates to:
  /// **'Discharge from only one nipple'**
  String get guideStep3Look2;

  /// No description provided for @guideStep3Look3.
  ///
  /// In en, this message translates to:
  /// **'Spontaneous discharge'**
  String get guideStep3Look3;

  /// No description provided for @guideStep3Advice.
  ///
  /// In en, this message translates to:
  /// **'Consult a doctor if you notice bloody or clear discharge.'**
  String get guideStep3Advice;

  /// No description provided for @guideStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Lying Down Exam'**
  String get guideStep4Title;

  /// No description provided for @guideStep4Desc.
  ///
  /// In en, this message translates to:
  /// **'Lie down and use your finger pads to feel for lumps in a circular motion.'**
  String get guideStep4Desc;

  /// No description provided for @guideStep4Look1.
  ///
  /// In en, this message translates to:
  /// **'Any lumps or hard knots'**
  String get guideStep4Look1;

  /// No description provided for @guideStep4Look2.
  ///
  /// In en, this message translates to:
  /// **'Thickened tissue'**
  String get guideStep4Look2;

  /// No description provided for @guideStep4Look3.
  ///
  /// In en, this message translates to:
  /// **'Painful areas'**
  String get guideStep4Look3;

  /// No description provided for @guideStep4Advice.
  ///
  /// In en, this message translates to:
  /// **'Use the pads of your fingers, not the tips.'**
  String get guideStep4Advice;

  /// No description provided for @guideStep5Title.
  ///
  /// In en, this message translates to:
  /// **'Standing Exam'**
  String get guideStep5Title;

  /// No description provided for @guideStep5Desc.
  ///
  /// In en, this message translates to:
  /// **'Repeat the exam while standing or sitting.'**
  String get guideStep5Desc;

  /// No description provided for @guideStep5Look1.
  ///
  /// In en, this message translates to:
  /// **'New lumps or swelling'**
  String get guideStep5Look1;

  /// No description provided for @guideStep5Look2.
  ///
  /// In en, this message translates to:
  /// **'Painful spots'**
  String get guideStep5Look2;

  /// No description provided for @guideStep5Look3.
  ///
  /// In en, this message translates to:
  /// **'Changes near the armpit'**
  String get guideStep5Look3;

  /// No description provided for @guideStep5Advice.
  ///
  /// In en, this message translates to:
  /// **'Many women find it easiest to do this in the shower.'**
  String get guideStep5Advice;

  /// No description provided for @warningSignsTitle.
  ///
  /// In en, this message translates to:
  /// **'Breast Changes to Notice'**
  String get warningSignsTitle;

  /// No description provided for @warningSignsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'These changes do not always mean cancer, but they are worth discussing with a doctor or qualified healthcare professional.'**
  String get warningSignsSubtitle;

  /// No description provided for @warningSignsViewNormal.
  ///
  /// In en, this message translates to:
  /// **'Compare Normal and Concerning Changes'**
  String get warningSignsViewNormal;

  /// No description provided for @warningSignsBanner.
  ///
  /// In en, this message translates to:
  /// **'Many breast changes are not cancer. If a change is new, unusual for you, or does not go away, it is best to have it checked by a healthcare professional.'**
  String get warningSignsBanner;

  /// No description provided for @warningSign1Title.
  ///
  /// In en, this message translates to:
  /// **'New lump or thickened area'**
  String get warningSign1Title;

  /// No description provided for @warningSign1Desc.
  ///
  /// In en, this message translates to:
  /// **'A new lump, firm spot, or thicker area in the breast or underarm that feels different from nearby tissue.'**
  String get warningSign1Desc;

  /// No description provided for @warningSign2Title.
  ///
  /// In en, this message translates to:
  /// **'Skin dimpling or texture change'**
  String get warningSign2Title;

  /// No description provided for @warningSign2Desc.
  ///
  /// In en, this message translates to:
  /// **'Skin that appears dimpled, puckered, pulled inward, or uneven like the surface of an orange peel.'**
  String get warningSign2Desc;

  /// No description provided for @warningSign3Title.
  ///
  /// In en, this message translates to:
  /// **'Nipple Changes'**
  String get warningSign3Title;

  /// No description provided for @warningSign3Desc.
  ///
  /// In en, this message translates to:
  /// **'A nipple that newly turns inward, changes direction, or looks different from what is normal for you.'**
  String get warningSign3Desc;

  /// No description provided for @warningSign4Title.
  ///
  /// In en, this message translates to:
  /// **'Nipple Discharge'**
  String get warningSign4Title;

  /// No description provided for @warningSign4Desc.
  ///
  /// In en, this message translates to:
  /// **'Fluid from the nipple that is new for you, especially if it is bloody, clear and watery, or happens without squeezing.'**
  String get warningSign4Desc;

  /// No description provided for @warningSign5Title.
  ///
  /// In en, this message translates to:
  /// **'Swelling or shape change'**
  String get warningSign5Title;

  /// No description provided for @warningSign5Desc.
  ///
  /// In en, this message translates to:
  /// **'Swelling in all or part of the breast, or a new change in size or shape, even when no lump is felt.'**
  String get warningSign5Desc;

  /// No description provided for @warningSign6Title.
  ///
  /// In en, this message translates to:
  /// **'Redness, rash, or sore-like change'**
  String get warningSign6Title;

  /// No description provided for @warningSign6Desc.
  ///
  /// In en, this message translates to:
  /// **'Redness, scaling, thickened skin, a rash, or a sore-like area on the nipple or breast skin that persists.'**
  String get warningSign6Desc;

  /// No description provided for @normalVsAbnormalPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Normal vs Abnormal'**
  String get normalVsAbnormalPageTitle;

  /// No description provided for @normalVsAbnormalHeading.
  ///
  /// In en, this message translates to:
  /// **'What\'s Normal?'**
  String get normalVsAbnormalHeading;

  /// No description provided for @normalVsAbnormalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'It is important to understand the normal changes in your body so that you can identify the changes that need attention.'**
  String get normalVsAbnormalSubtitle;

  /// No description provided for @normalColumnTitle.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normalColumnTitle;

  /// No description provided for @abnormalColumnTitle.
  ///
  /// In en, this message translates to:
  /// **'See a Doctor'**
  String get abnormalColumnTitle;

  /// No description provided for @normalItem1.
  ///
  /// In en, this message translates to:
  /// **'Slight difference in size between breasts'**
  String get normalItem1;

  /// No description provided for @normalItem2.
  ///
  /// In en, this message translates to:
  /// **'Mild tenderness before your period'**
  String get normalItem2;

  /// No description provided for @normalItem3.
  ///
  /// In en, this message translates to:
  /// **'Slightly lumpy or ropy texture'**
  String get normalItem3;

  /// No description provided for @normalItem4.
  ///
  /// In en, this message translates to:
  /// **'Discharge during pregnancy'**
  String get normalItem4;

  /// No description provided for @normalItem5.
  ///
  /// In en, this message translates to:
  /// **'Size changes during menstrual cycle'**
  String get normalItem5;

  /// No description provided for @abnormalItem1.
  ///
  /// In en, this message translates to:
  /// **'New hard or painless lump'**
  String get abnormalItem1;

  /// No description provided for @abnormalItem2.
  ///
  /// In en, this message translates to:
  /// **'Skin dimpling or puckering'**
  String get abnormalItem2;

  /// No description provided for @abnormalItem3.
  ///
  /// In en, this message translates to:
  /// **'Nipple turning inward'**
  String get abnormalItem3;

  /// No description provided for @abnormalItem4.
  ///
  /// In en, this message translates to:
  /// **'Bloody nipple discharge'**
  String get abnormalItem4;

  /// No description provided for @abnormalItem5.
  ///
  /// In en, this message translates to:
  /// **'Persistent redness or rash'**
  String get abnormalItem5;

  /// No description provided for @abnormalItem6.
  ///
  /// In en, this message translates to:
  /// **'Unexplained change in size'**
  String get abnormalItem6;

  /// No description provided for @normalVsAbnormalBanner.
  ///
  /// In en, this message translates to:
  /// **'You know your body best. If something feels different or wrong, trust your instincts and consult a healthcare professional.'**
  String get normalVsAbnormalBanner;

  /// No description provided for @mythsFactsHeading.
  ///
  /// In en, this message translates to:
  /// **'Understand Myths & Facts'**
  String get mythsFactsHeading;

  /// No description provided for @mythsFactsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Misinformation can be harmful. Here are some important facts you need to know.'**
  String get mythsFactsSubtitle;

  /// No description provided for @mythLabel.
  ///
  /// In en, this message translates to:
  /// **'Myth'**
  String get mythLabel;

  /// No description provided for @factLabel.
  ///
  /// In en, this message translates to:
  /// **'Fact'**
  String get factLabel;

  /// No description provided for @myth1.
  ///
  /// In en, this message translates to:
  /// **'Breast cancer only occurs if there is a family history.'**
  String get myth1;

  /// No description provided for @fact1.
  ///
  /// In en, this message translates to:
  /// **'In many cases, breast cancer can occur in women with no family history. That is why all women should stay aware.'**
  String get fact1;

  /// No description provided for @myth2.
  ///
  /// In en, this message translates to:
  /// **'A lump in the breast always means cancer.'**
  String get myth2;

  /// No description provided for @fact2.
  ///
  /// In en, this message translates to:
  /// **'Not every lump is cancer. Many lumps can be normal or non-cancerous. Still, any new lump should be checked by a doctor.'**
  String get fact2;

  /// No description provided for @myth3.
  ///
  /// In en, this message translates to:
  /// **'Breast cancer only affects older women.'**
  String get myth3;

  /// No description provided for @fact3.
  ///
  /// In en, this message translates to:
  /// **'Risk increases with age, but breast cancer can occur at any age. Men can also get breast cancer, though it is less common.'**
  String get fact3;

  /// No description provided for @myth4.
  ///
  /// In en, this message translates to:
  /// **'Wearing an underwire bra causes breast cancer.'**
  String get myth4;

  /// No description provided for @fact4.
  ///
  /// In en, this message translates to:
  /// **'There is no proven scientific link between the type of bra worn and breast cancer.'**
  String get fact4;

  /// No description provided for @myth5.
  ///
  /// In en, this message translates to:
  /// **'Mammograms spread cancer.'**
  String get myth5;

  /// No description provided for @fact5.
  ///
  /// In en, this message translates to:
  /// **'Mammograms use low-dose radiation and are generally considered safe. The benefits of early detection outweigh the risks.'**
  String get fact5;

  /// No description provided for @myth6.
  ///
  /// In en, this message translates to:
  /// **'Men cannot get breast cancer.'**
  String get myth6;

  /// No description provided for @fact6.
  ///
  /// In en, this message translates to:
  /// **'Men can also get breast cancer, though it is rare. Any unusual change should not be ignored.'**
  String get fact6;

  /// No description provided for @doctorVisitPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Doctor Visit Guide'**
  String get doctorVisitPageTitle;

  /// No description provided for @doctorVisitHeading.
  ///
  /// In en, this message translates to:
  /// **'When to See a Doctor'**
  String get doctorVisitHeading;

  /// No description provided for @doctorVisitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Do not wait if you notice any concerning change. Getting checked by a doctor promptly is very important.'**
  String get doctorVisitSubtitle;

  /// No description provided for @doctorVisitWhenTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule a Visit If:'**
  String get doctorVisitWhenTitle;

  /// No description provided for @doctorVisitWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'What to Bring:'**
  String get doctorVisitWhatTitle;

  /// No description provided for @doctorVisitQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Questions to Ask:'**
  String get doctorVisitQuestionsTitle;

  /// No description provided for @doctorVisitBookButton.
  ///
  /// In en, this message translates to:
  /// **'Book Doctor Appointment'**
  String get doctorVisitBookButton;

  /// No description provided for @doctorVisitDisclaimerButton.
  ///
  /// In en, this message translates to:
  /// **'View Safety Disclaimer'**
  String get doctorVisitDisclaimerButton;

  /// No description provided for @doctorVisitBanner.
  ///
  /// In en, this message translates to:
  /// **'Regular checkups and professional screenings are essential, even if you feel fine. Early detection saves lives.'**
  String get doctorVisitBanner;

  /// No description provided for @doctorWhen1.
  ///
  /// In en, this message translates to:
  /// **'You feel a new lump or hard area in the breast or armpit'**
  String get doctorWhen1;

  /// No description provided for @doctorWhen2.
  ///
  /// In en, this message translates to:
  /// **'You notice a change in the size, shape, or symmetry of your breast'**
  String get doctorWhen2;

  /// No description provided for @doctorWhen3.
  ///
  /// In en, this message translates to:
  /// **'There is nipple discharge, especially bloody or clear fluid'**
  String get doctorWhen3;

  /// No description provided for @doctorWhen4.
  ///
  /// In en, this message translates to:
  /// **'Your nipple turns inward or its position changes'**
  String get doctorWhen4;

  /// No description provided for @doctorWhen5.
  ///
  /// In en, this message translates to:
  /// **'You see dimpling, puckering, or texture changes in the skin'**
  String get doctorWhen5;

  /// No description provided for @doctorWhen6.
  ///
  /// In en, this message translates to:
  /// **'Persistent redness, rash, or swelling remains'**
  String get doctorWhen6;

  /// No description provided for @doctorWhen7.
  ///
  /// In en, this message translates to:
  /// **'You have unexplained persistent pain in the breast or nipple'**
  String get doctorWhen7;

  /// No description provided for @doctorWhen8.
  ///
  /// In en, this message translates to:
  /// **'Any other unusual or long-lasting change appears'**
  String get doctorWhen8;

  /// No description provided for @doctorBring1.
  ///
  /// In en, this message translates to:
  /// **'List of current medications and supplements'**
  String get doctorBring1;

  /// No description provided for @doctorBring2.
  ///
  /// In en, this message translates to:
  /// **'Your medical history and previous test reports'**
  String get doctorBring2;

  /// No description provided for @doctorBring3.
  ///
  /// In en, this message translates to:
  /// **'Family history of breast or ovarian cancer'**
  String get doctorBring3;

  /// No description provided for @doctorBring4.
  ///
  /// In en, this message translates to:
  /// **'List of symptoms and when they started'**
  String get doctorBring4;

  /// No description provided for @doctorBring5.
  ///
  /// In en, this message translates to:
  /// **'List of questions to ask the doctor'**
  String get doctorBring5;

  /// No description provided for @doctorBring6.
  ///
  /// In en, this message translates to:
  /// **'ID and necessary health documents'**
  String get doctorBring6;

  /// No description provided for @doctorAsk1.
  ///
  /// In en, this message translates to:
  /// **'What could be causing these changes?'**
  String get doctorAsk1;

  /// No description provided for @doctorAsk2.
  ///
  /// In en, this message translates to:
  /// **'Do I need any tests or imaging?'**
  String get doctorAsk2;

  /// No description provided for @doctorAsk3.
  ///
  /// In en, this message translates to:
  /// **'What are the next steps for examination or treatment?'**
  String get doctorAsk3;

  /// No description provided for @doctorAsk4.
  ///
  /// In en, this message translates to:
  /// **'How often should I have my breasts checked?'**
  String get doctorAsk4;

  /// No description provided for @doctorAsk5.
  ///
  /// In en, this message translates to:
  /// **'Are there any risk factors for me?'**
  String get doctorAsk5;

  /// No description provided for @doctorAsk6.
  ///
  /// In en, this message translates to:
  /// **'When should I schedule my next appointment?'**
  String get doctorAsk6;

  /// No description provided for @doctorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact a Healthcare Professional'**
  String get doctorDialogTitle;

  /// No description provided for @doctorDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This feature can typically connect you with:'**
  String get doctorDialogSubtitle;

  /// No description provided for @doctorDialogOption1.
  ///
  /// In en, this message translates to:
  /// **'Call your doctor'**
  String get doctorDialogOption1;

  /// No description provided for @doctorDialogOption2.
  ///
  /// In en, this message translates to:
  /// **'Online booking portal'**
  String get doctorDialogOption2;

  /// No description provided for @doctorDialogOption3.
  ///
  /// In en, this message translates to:
  /// **'Messaging system'**
  String get doctorDialogOption3;

  /// No description provided for @doctorDialogOption4.
  ///
  /// In en, this message translates to:
  /// **'Find a nearby clinic'**
  String get doctorDialogOption4;

  /// No description provided for @doctorDialogNote.
  ///
  /// In en, this message translates to:
  /// **'For now, please contact your healthcare professional or doctor directly.'**
  String get doctorDialogNote;

  /// No description provided for @doctorDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get doctorDialogClose;

  /// No description provided for @disclaimerPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety Disclaimer'**
  String get disclaimerPageTitle;

  /// No description provided for @disclaimerHeading.
  ///
  /// In en, this message translates to:
  /// **'Important Disclaimer'**
  String get disclaimerHeading;

  /// No description provided for @disclaimerBanner.
  ///
  /// In en, this message translates to:
  /// **'This app is for educational purposes only. It is not a substitute for medical advice, examination, diagnosis, or treatment by a doctor.'**
  String get disclaimerBanner;

  /// No description provided for @disclaimerNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Please Note:'**
  String get disclaimerNoteTitle;

  /// No description provided for @disclaimerNote1.
  ///
  /// In en, this message translates to:
  /// **'Always consult a qualified healthcare professional or doctor for any medical advice.'**
  String get disclaimerNote1;

  /// No description provided for @disclaimerNote2.
  ///
  /// In en, this message translates to:
  /// **'Self-exam is not a substitute for regular clinical breast exams or mammograms.'**
  String get disclaimerNote2;

  /// No description provided for @disclaimerNote3.
  ///
  /// In en, this message translates to:
  /// **'If you notice any change, get it checked by a doctor as soon as possible.'**
  String get disclaimerNote3;

  /// No description provided for @disclaimerNote4.
  ///
  /// In en, this message translates to:
  /// **'Timely examination and early detection can help save lives.'**
  String get disclaimerNote4;

  /// No description provided for @disclaimerNote5.
  ///
  /// In en, this message translates to:
  /// **'This app does not provide any diagnosis or treatment advice.'**
  String get disclaimerNote5;

  /// No description provided for @disclaimerUnderstood.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get disclaimerUnderstood;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Know Your Body'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Desc.
  ///
  /// In en, this message translates to:
  /// **'Learn how to perform a breast self-exam with our step-by-step guide.'**
  String get onboarding1Desc;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Recognize the Signs'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Desc.
  ///
  /// In en, this message translates to:
  /// **'Learn what changes to watch for and when to consult a doctor.'**
  String get onboarding2Desc;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Stay Healthy & Safe'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Desc.
  ///
  /// In en, this message translates to:
  /// **'Regular self-exams and doctor screenings help with early detection.'**
  String get onboarding3Desc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
