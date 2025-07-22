# # EmoTextView [SwiftUI] [iOS26] 


> **Note:** This project is currently in the ideation stage, and the sample code provided is generated for demonstration purposes only. As I do not have access to an Apple Intelligence-enabled device, the functionality has not been tested or verified. Contributions or efforts to make it work are welcome.


## Overview
**EmoTextView** is a smart text input component that analyzes the emotional tone of user input in real-time and provides visual feedback based on detected sentiment. If the text is angry or aggressive, the component visually warns the user; if the text is positive or overly enthusiastic, it displays corresponding friendly indicators. This encourages empathetic, constructive communication and helps users better understand the tone of their messages.

## Key Features
- **Real-time sentiment analysis**: Detects positive, negative, neutral, and specific emotions like anger, happiness, or excitement as the user types.
- **Visual feedback**: Changes border colors and displays emoticons or icons reflecting the detected emotion.
- **Customizable emotion mapping**: Developers can add or modify emotion-to-feedback mappings.
- **Language support**: Built to handle multilingual input.
- **Empathy nudges**: Option to suggest rephrasing if a message is too harsh or negative.
- **Accessibility support**: Includes alternative cues for color-blind users (e.g., icons, haptics).

## Use Cases
- **Customer Reviews**: Encourages customers to leave more thoughtful and constructive feedback, reducing aggressive or abusive content and promoting a more positive review environment.
- **Internal Enterprise Tools**: In apps where employees communicate feedback, helps maintain a supportive and respectful tone.
- **Social Apps**: Enhances online interactions by helping users understand the emotional impact of their messages.
- **Language Barriers**: Visual cues make it easier for non-native speakers to convey and interpret tone.

## Design / Behavior
- **Visual cues**
  - Pleasant green border/outlines for positive messages.
  - Red or orange for negative or aggressive tones.
  - Neutral gray or blue for informational/neutral content.
  - Optional animated emoticon overlays that change based on the text’s emotion.
- **Interactive suggestions**
  - Subtle inline prompts (“Try a softer tone?”) if negativity detected.
  - Tooltips explaining the emotional feedback.
- **Emoticon display**
  - Small emoticon or mood icon appears in the corner of the text field.
- **Customizable UI**
  - Supports light/dark modes and theme customization.


<img width="214" height="61" alt="Screenshot 2025-07-22 at 1 32 29 PM" src="https://github.com/user-attachments/assets/e3db2688-7ef6-45d6-8b72-618bf5d64bcd" />
<img width="213" height="63" alt="Screenshot 2025-07-22 at 1 33 17 PM" src="https://github.com/user-attachments/assets/a9b7caa1-61da-4168-b8f0-ca712f387445" />
<img width="212" height="56" alt="Screenshot 2025-07-22 at 1 33 46 PM" src="https://github.com/user-attachments/assets/e9256a04-6966-4067-8a6d-5b6bfc9d4c9e" />



## Additional Features (Ideas)
- **Undo/redo emotional feedback**: User can dismiss or accept emotion suggestions.
- **Integration hooks**: Callbacks for developers to handle specific emotional states.

## Approach 
Leveraging Apple’s On-Device Foundation Model for Sentiment Analysis

### Why On-Device?
- Apple’s Foundation Model (iOS 26+) offers powerful Apple Intelligence. 
- **All processing is on-device, ensuring privacy and security.** No text leaves the user’s device.

### Implementation Steps

1. **Text Monitoring**
   - The component listens for text changes as the user types.
2. **Sentiment/Emotion Analysis**
   - Use the Natural Language framework and Foundation Model to analyze input.
   - For iOS 26+, use updated APIs for nuanced emotion detection (anger, joy, excitement, etc.).
3. **Real-Time UI Feedback**
   - Instantly update the text field’s visuals (color, icons, emoticons, tooltips) based on the returned emotion/sentiment.
4. **No External Dependencies**
   - No data sent to cloud, no API keys, no external privacy concerns.


### High level 
```
```plaintext
User types text
      │
      ▼
EmoTextView captures text changes
      │
      ▼
Text sent to Foundation Model via NaturalLanguage framework
      │
      ▼
Sentiment/emotion result returned (on device)
      │
      ▼
Component updates UI feedback (color, icon, message)
```


## API Sketch

```swift
// Example Usage in SwiftUI
@State private var reviewText: String = ""

var body: some View {
    EmoTextView(text: $reviewText, placeholder: "Write your review...")
        .feedbackStyle(.default)
        .onEmotionChange { emotion in
            // Custom action when sentiment changes
        }
}
```


> **Collaboration Welcome!**  
> If you’re interested in building or extending this idea, please open an issue or submit a pull request!
