// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get chooseLanguage => 'Choose Language';

  @override
  String get continueText => 'Continue';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get assessment => 'Self Assessment';

  @override
  String get guide => 'Guide';

  @override
  String get doctorVisit => 'Doctor Visit';

  @override
  String get disclaimer => 'Disclaimer';

  @override
  String get mythsFacts => 'Myths & Facts';

  @override
  String get warningSigns => 'Warning Signs';

  @override
  String get normalVsAbnormal => 'Normal vs Abnormal';

  @override
  String get startAssessment => 'Start Assessment';

  @override
  String get safetyDisclaimer => 'Safety Disclaimer';

  @override
  String get dashboardGreeting => 'Hello 👋';

  @override
  String get dashboardSubtitle => 'How are you feeling today?';

  @override
  String get dashboardCTATitle => 'Ready for a self-exam?';

  @override
  String get dashboardCTASubtitle =>
      'It\'s an easy step-by-step guide that takes about 5 minutes. No need to worry.';

  @override
  String get dashboardCTAButton => 'Start Self-Exam';

  @override
  String get dashboardQuickOptions => 'Quick Options';

  @override
  String get dashboardAssessmentTitle => 'Self Assessment';

  @override
  String get dashboardAssessmentSubtitle => 'Check your symptoms';

  @override
  String get dashboardWarningTitle => 'Warning Signs';

  @override
  String get dashboardWarningSubtitle => 'What to look for';

  @override
  String get dashboardMythsTitle => 'Myths & Facts';

  @override
  String get dashboardMythsSubtitle => 'Get the right information';

  @override
  String get dashboardDoctorTitle => 'Doctor Visit';

  @override
  String get dashboardDoctorSubtitle => 'When to see a doctor';

  @override
  String get dashboardInfoBanner =>
      'Remember: Self-exam is not a substitute for a medical examination by a doctor.';

  @override
  String get exitAppTitle => 'Close App?';

  @override
  String get exitAppContent => 'Do you really want to close the app?';

  @override
  String get exitAppCancel => 'Cancel';

  @override
  String get exitAppConfirm => 'Close';

  @override
  String get assessmentTitle => 'Self-Assessment';

  @override
  String assessmentProgressLabel(int answered, int total) {
    return '$answered of $total answered';
  }

  @override
  String get assessmentSubmit => 'Submit';

  @override
  String get assessmentResultConsult => 'Please Consult a Doctor';

  @override
  String get assessmentResultNoConcern => 'No Concerning Signs Found';

  @override
  String get assessmentResultConsultBody =>
      'You answered \"Yes\" to one or more questions. This does not mean you have cancer, but it is important to consult a healthcare professional for a proper examination.';

  @override
  String get assessmentResultNoConcernBody =>
      'You answered \"No\" to all questions. Continue monthly self-exams and stay in touch with your doctor for regular checkups.';

  @override
  String get assessmentGoHome => 'Go Back to Home';

  @override
  String get assessmentRetake => 'Retake Assessment';

  @override
  String get assessmentYes => 'Yes';

  @override
  String get assessmentNo => 'No';

  @override
  String get assessmentQ1 =>
      'Do you feel any new lump or thickening in your breast or armpit?';

  @override
  String get assessmentQ2 =>
      'Have you noticed any change in the size or shape of your breast?';

  @override
  String get assessmentQ3 =>
      'Is there any dimpling, puckering, or redness on the skin of your breast?';

  @override
  String get assessmentQ4 => 'Is there any unusual discharge from your nipple?';

  @override
  String get assessmentQ5 =>
      'Is your nipple turning inward or has its direction changed?';

  @override
  String get assessmentQ6 =>
      'Do you feel persistent pain in your breast or nipple area?';

  @override
  String get guideFinish => 'Finish';

  @override
  String get guideNextStep => 'Next Step';

  @override
  String get guidePrevious => 'Previous';

  @override
  String get guideLookFor => 'Look for these changes:';

  @override
  String get guideClinicalAdvice => 'Clinical Advice';

  @override
  String get guideStep1Title => 'Visual Inspection';

  @override
  String get guideStep1Desc =>
      'Stand in front of a mirror with your shoulders straight and your arms on your hips.';

  @override
  String get guideStep1Look1 => 'Changes in size, shape, or color';

  @override
  String get guideStep1Look2 => 'Dimpling, puckering, or bulging of the skin';

  @override
  String get guideStep1Look3 => 'A nipple that has changed position or redness';

  @override
  String get guideStep1Advice =>
      'The best time to perform a self-exam is usually a few days after your period ends.';

  @override
  String get guideStep2Title => 'Raise Arms';

  @override
  String get guideStep2Desc => 'Raise your arms and look for the same changes.';

  @override
  String get guideStep2Look1 => 'Changes in breast symmetry';

  @override
  String get guideStep2Look2 => 'Skin pulling or dimpling';

  @override
  String get guideStep2Look3 => 'Changes in nipple direction';

  @override
  String get guideStep2Advice =>
      'Some changes may be more visible with arms raised.';

  @override
  String get guideStep3Title => 'Check for Discharge';

  @override
  String get guideStep3Desc =>
      'Gently squeeze each nipple to check for discharge.';

  @override
  String get guideStep3Look1 => 'Bloody or clear fluid';

  @override
  String get guideStep3Look2 => 'Discharge from only one nipple';

  @override
  String get guideStep3Look3 => 'Spontaneous discharge';

  @override
  String get guideStep3Advice =>
      'Consult a doctor if you notice bloody or clear discharge.';

  @override
  String get guideStep4Title => 'Lying Down Exam';

  @override
  String get guideStep4Desc =>
      'Lie down and use your finger pads to feel for lumps in a circular motion.';

  @override
  String get guideStep4Look1 => 'Any lumps or hard knots';

  @override
  String get guideStep4Look2 => 'Thickened tissue';

  @override
  String get guideStep4Look3 => 'Painful areas';

  @override
  String get guideStep4Advice => 'Use the pads of your fingers, not the tips.';

  @override
  String get guideStep5Title => 'Standing Exam';

  @override
  String get guideStep5Desc => 'Repeat the exam while standing or sitting.';

  @override
  String get guideStep5Look1 => 'New lumps or swelling';

  @override
  String get guideStep5Look2 => 'Painful spots';

  @override
  String get guideStep5Look3 => 'Changes near the armpit';

  @override
  String get guideStep5Advice =>
      'Many women find it easiest to do this in the shower.';

  @override
  String get warningSignsTitle => 'Breast Changes to Notice';

  @override
  String get warningSignsSubtitle =>
      'These changes do not always mean cancer, but they are worth discussing with a doctor or qualified healthcare professional.';

  @override
  String get warningSignsViewNormal => 'Compare Normal and Concerning Changes';

  @override
  String get warningSignsBanner =>
      'Many breast changes are not cancer. If a change is new, unusual for you, or does not go away, it is best to have it checked by a healthcare professional.';

  @override
  String get warningSign1Title => 'New lump or thickened area';

  @override
  String get warningSign1Desc =>
      'A new lump, firm spot, or thicker area in the breast or underarm that feels different from nearby tissue.';

  @override
  String get warningSign2Title => 'Skin dimpling or texture change';

  @override
  String get warningSign2Desc =>
      'Skin that appears dimpled, puckered, pulled inward, or uneven like the surface of an orange peel.';

  @override
  String get warningSign3Title => 'Nipple Changes';

  @override
  String get warningSign3Desc =>
      'A nipple that newly turns inward, changes direction, or looks different from what is normal for you.';

  @override
  String get warningSign4Title => 'Nipple Discharge';

  @override
  String get warningSign4Desc =>
      'Fluid from the nipple that is new for you, especially if it is bloody, clear and watery, or happens without squeezing.';

  @override
  String get warningSign5Title => 'Swelling or shape change';

  @override
  String get warningSign5Desc =>
      'Swelling in all or part of the breast, or a new change in size or shape, even when no lump is felt.';

  @override
  String get warningSign6Title => 'Redness, rash, or sore-like change';

  @override
  String get warningSign6Desc =>
      'Redness, scaling, thickened skin, a rash, or a sore-like area on the nipple or breast skin that persists.';

  @override
  String get normalVsAbnormalPageTitle => 'Normal vs Abnormal';

  @override
  String get normalVsAbnormalHeading => 'What\'s Normal?';

  @override
  String get normalVsAbnormalSubtitle =>
      'It is important to understand the normal changes in your body so that you can identify the changes that need attention.';

  @override
  String get normalColumnTitle => 'Normal';

  @override
  String get abnormalColumnTitle => 'See a Doctor';

  @override
  String get normalItem1 => 'Slight difference in size between breasts';

  @override
  String get normalItem2 => 'Mild tenderness before your period';

  @override
  String get normalItem3 => 'Slightly lumpy or ropy texture';

  @override
  String get normalItem4 => 'Discharge during pregnancy';

  @override
  String get normalItem5 => 'Size changes during menstrual cycle';

  @override
  String get abnormalItem1 => 'New hard or painless lump';

  @override
  String get abnormalItem2 => 'Skin dimpling or puckering';

  @override
  String get abnormalItem3 => 'Nipple turning inward';

  @override
  String get abnormalItem4 => 'Bloody nipple discharge';

  @override
  String get abnormalItem5 => 'Persistent redness or rash';

  @override
  String get abnormalItem6 => 'Unexplained change in size';

  @override
  String get normalVsAbnormalBanner =>
      'You know your body best. If something feels different or wrong, trust your instincts and consult a healthcare professional.';

  @override
  String get mythsFactsHeading => 'Understand Myths & Facts';

  @override
  String get mythsFactsSubtitle =>
      'Misinformation can be harmful. Here are some important facts you need to know.';

  @override
  String get mythLabel => 'Myth';

  @override
  String get factLabel => 'Fact';

  @override
  String get myth1 => 'Breast cancer only occurs if there is a family history.';

  @override
  String get fact1 =>
      'In many cases, breast cancer can occur in women with no family history. That is why all women should stay aware.';

  @override
  String get myth2 => 'A lump in the breast always means cancer.';

  @override
  String get fact2 =>
      'Not every lump is cancer. Many lumps can be normal or non-cancerous. Still, any new lump should be checked by a doctor.';

  @override
  String get myth3 => 'Breast cancer only affects older women.';

  @override
  String get fact3 =>
      'Risk increases with age, but breast cancer can occur at any age. Men can also get breast cancer, though it is less common.';

  @override
  String get myth4 => 'Wearing an underwire bra causes breast cancer.';

  @override
  String get fact4 =>
      'There is no proven scientific link between the type of bra worn and breast cancer.';

  @override
  String get myth5 => 'Mammograms spread cancer.';

  @override
  String get fact5 =>
      'Mammograms use low-dose radiation and are generally considered safe. The benefits of early detection outweigh the risks.';

  @override
  String get myth6 => 'Men cannot get breast cancer.';

  @override
  String get fact6 =>
      'Men can also get breast cancer, though it is rare. Any unusual change should not be ignored.';

  @override
  String get doctorVisitPageTitle => 'Doctor Visit Guide';

  @override
  String get doctorVisitHeading => 'When to See a Doctor';

  @override
  String get doctorVisitSubtitle =>
      'Do not wait if you notice any concerning change. Getting checked by a doctor promptly is very important.';

  @override
  String get doctorVisitWhenTitle => 'Schedule a Visit If:';

  @override
  String get doctorVisitWhatTitle => 'What to Bring:';

  @override
  String get doctorVisitQuestionsTitle => 'Questions to Ask:';

  @override
  String get doctorVisitBookButton => 'Book Doctor Appointment';

  @override
  String get doctorVisitDisclaimerButton => 'View Safety Disclaimer';

  @override
  String get doctorVisitBanner =>
      'Regular checkups and professional screenings are essential, even if you feel fine. Early detection saves lives.';

  @override
  String get doctorWhen1 =>
      'You feel a new lump or hard area in the breast or armpit';

  @override
  String get doctorWhen2 =>
      'You notice a change in the size, shape, or symmetry of your breast';

  @override
  String get doctorWhen3 =>
      'There is nipple discharge, especially bloody or clear fluid';

  @override
  String get doctorWhen4 => 'Your nipple turns inward or its position changes';

  @override
  String get doctorWhen5 =>
      'You see dimpling, puckering, or texture changes in the skin';

  @override
  String get doctorWhen6 => 'Persistent redness, rash, or swelling remains';

  @override
  String get doctorWhen7 =>
      'You have unexplained persistent pain in the breast or nipple';

  @override
  String get doctorWhen8 => 'Any other unusual or long-lasting change appears';

  @override
  String get doctorBring1 => 'List of current medications and supplements';

  @override
  String get doctorBring2 => 'Your medical history and previous test reports';

  @override
  String get doctorBring3 => 'Family history of breast or ovarian cancer';

  @override
  String get doctorBring4 => 'List of symptoms and when they started';

  @override
  String get doctorBring5 => 'List of questions to ask the doctor';

  @override
  String get doctorBring6 => 'ID and necessary health documents';

  @override
  String get doctorAsk1 => 'What could be causing these changes?';

  @override
  String get doctorAsk2 => 'Do I need any tests or imaging?';

  @override
  String get doctorAsk3 =>
      'What are the next steps for examination or treatment?';

  @override
  String get doctorAsk4 => 'How often should I have my breasts checked?';

  @override
  String get doctorAsk5 => 'Are there any risk factors for me?';

  @override
  String get doctorAsk6 => 'When should I schedule my next appointment?';

  @override
  String get doctorDialogTitle => 'Contact a Healthcare Professional';

  @override
  String get doctorDialogSubtitle =>
      'This feature can typically connect you with:';

  @override
  String get doctorDialogOption1 => 'Call your doctor';

  @override
  String get doctorDialogOption2 => 'Online booking portal';

  @override
  String get doctorDialogOption3 => 'Messaging system';

  @override
  String get doctorDialogOption4 => 'Find a nearby clinic';

  @override
  String get doctorDialogNote =>
      'For now, please contact your healthcare professional or doctor directly.';

  @override
  String get doctorDialogClose => 'Close';

  @override
  String get disclaimerPageTitle => 'Safety Disclaimer';

  @override
  String get disclaimerHeading => 'Important Disclaimer';

  @override
  String get disclaimerBanner =>
      'This app is for educational purposes only. It is not a substitute for medical advice, examination, diagnosis, or treatment by a doctor.';

  @override
  String get disclaimerNoteTitle => 'Please Note:';

  @override
  String get disclaimerNote1 =>
      'Always consult a qualified healthcare professional or doctor for any medical advice.';

  @override
  String get disclaimerNote2 =>
      'Self-exam is not a substitute for regular clinical breast exams or mammograms.';

  @override
  String get disclaimerNote3 =>
      'If you notice any change, get it checked by a doctor as soon as possible.';

  @override
  String get disclaimerNote4 =>
      'Timely examination and early detection can help save lives.';

  @override
  String get disclaimerNote5 =>
      'This app does not provide any diagnosis or treatment advice.';

  @override
  String get disclaimerUnderstood => 'I Understand';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboarding1Title => 'Know Your Body';

  @override
  String get onboarding1Desc =>
      'Learn how to perform a breast self-exam with our step-by-step guide.';

  @override
  String get onboarding2Title => 'Recognize the Signs';

  @override
  String get onboarding2Desc =>
      'Learn what changes to watch for and when to consult a doctor.';

  @override
  String get onboarding3Title => 'Stay Healthy & Safe';

  @override
  String get onboarding3Desc =>
      'Regular self-exams and doctor screenings help with early detection.';
}
