# Requirements Document

## Introduction

This feature adds AI-generated audio playback (text-to-speech) to the Assessment Guide screen (`GuideScreen`) in the PinkLevel Flutter app. The guide screen walks users through a 5-step breast self-examination process. Each step/page will have an audio narration that reads the step's content aloud in the user's selected language (English or Hindi). This helps users who prefer audio guidance or have difficulty reading, making the self-exam guide more accessible.

## Glossary

- **Assessment_Guide**: The `GuideScreen` widget — a paginated, 5-step breast self-examination guide screen in the app.
- **Guide_Page**: A single step/page within the Assessment_Guide (one of 5 steps).
- **Audio_Player**: The component responsible for managing TTS audio playback within the Assessment_Guide.
- **TTS_Service**: The AI text-to-speech service that converts guide page text content into audio.
- **Audio_Transcript**: The text content of a Guide_Page (title, description, look-for items, and clinical advice) that is converted to speech.
- **Locale**: The user's currently selected language — either English (`en`) or Hindi (`hi`), as set in the app's localization system.
- **Playback_State**: The current state of the Audio_Player — one of: `idle`, `loading`, `playing`, or `paused`.

---

## Requirements

### Requirement 1: Audio Playback Controls on Each Guide Page

**User Story:** As a user, I want to play audio narration on each guide page, so that I can follow the self-exam steps without having to read the screen.

#### Acceptance Criteria

1. THE Assessment_Guide SHALL display an audio playback control widget on every Guide_Page.
2. WHEN the user taps the play button, THE Audio_Player SHALL begin playing the Audio_Transcript for the current Guide_Page.
3. WHEN the user taps the pause button while audio is playing, THE Audio_Player SHALL pause playback and retain the current playback position.
4. WHEN the user taps the play button while audio is paused, THE Audio_Player SHALL resume playback from the paused position.
5. WHEN audio playback completes naturally, THE Audio_Player SHALL transition to the `idle` Playback_State.

---

### Requirement 2: Language-Matched Audio Narration

**User Story:** As a user, I want the audio narration to be in my selected language, so that I can understand the guide in the language I am most comfortable with.

#### Acceptance Criteria

1. WHEN the app Locale is set to English, THE TTS_Service SHALL generate audio using an English voice.
2. WHEN the app Locale is set to Hindi, THE TTS_Service SHALL generate audio using a Hindi voice.
3. THE TTS_Service SHALL support only English (`en`) and Hindi (`hi`) locales.
4. IF the app Locale is set to a language other than English or Hindi, THEN THE TTS_Service SHALL default to English for audio generation.

---

### Requirement 3: Audio Content Composition

**User Story:** As a user, I want the audio to narrate the full content of each guide step, so that I receive complete information without needing to read.

#### Acceptance Criteria

1. THE Audio_Transcript for each Guide_Page SHALL include the step title, step description, all "look for" items, and the clinical advice text.
2. THE TTS_Service SHALL convert the complete Audio_Transcript of the current Guide_Page into audio.
3. WHEN the Audio_Transcript text changes due to a Locale change, THE Audio_Player SHALL discard any cached audio and regenerate the Audio_Transcript in the new Locale.

---

### Requirement 4: Page Navigation Audio Management

**User Story:** As a user, I want audio to stop when I navigate to a different guide page, so that I am not confused by audio from a previous step playing over the new step.

#### Acceptance Criteria

1. WHEN the user navigates to a different Guide_Page, THE Audio_Player SHALL stop any currently playing or paused audio.
2. WHEN the user navigates to a different Guide_Page, THE Audio_Player SHALL reset the Playback_State to `idle` for the new page.
3. WHEN the user navigates away from the Assessment_Guide screen entirely, THE Audio_Player SHALL stop playback and release all audio resources.

---

### Requirement 5: Loading State Feedback

**User Story:** As a user, I want to see a loading indicator while audio is being prepared, so that I know the app is working and not frozen.

#### Acceptance Criteria

1. WHEN the TTS_Service is generating or fetching audio, THE Audio_Player SHALL display a loading indicator in place of the play/pause button.
2. WHILE the Playback_State is `loading`, THE Assessment_Guide SHALL disable the play/pause button to prevent duplicate requests.
3. WHEN audio is ready to play, THE Audio_Player SHALL transition from the `loading` state to the `playing` state automatically.

---

### Requirement 6: Error Handling for TTS Failures

**User Story:** As a user, I want to be informed if audio cannot be loaded, so that I can still use the guide visually without being left with a broken UI.

#### Acceptance Criteria

1. IF the TTS_Service fails to generate audio, THEN THE Audio_Player SHALL transition to the `idle` Playback_State.
2. IF the TTS_Service fails to generate audio, THEN THE Assessment_Guide SHALL display a non-blocking error message informing the user that audio is unavailable.
3. IF the TTS_Service fails to generate audio, THEN THE Assessment_Guide SHALL remain fully functional for visual use.
4. IF the device has no network connectivity when audio is requested, THEN THE Audio_Player SHALL display an offline message and remain in the `idle` Playback_State.

---

### Requirement 7: Audio Caching

**User Story:** As a user, I want audio to load quickly when I revisit a guide page, so that I do not have to wait for the same audio to be regenerated repeatedly.

#### Acceptance Criteria

1. WHEN the TTS_Service successfully generates audio for a Guide_Page and Locale combination, THE Audio_Player SHALL cache the audio for the duration of the app session.
2. WHEN the user navigates back to a previously visited Guide_Page within the same session, THE Audio_Player SHALL use the cached audio instead of making a new TTS_Service request.
3. WHEN the app Locale changes, THE Audio_Player SHALL invalidate all cached audio entries and regenerate audio in the new Locale on demand.
