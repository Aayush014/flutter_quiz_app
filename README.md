# Quiz App

A Flutter-based Quiz App utilizing GetX for state management. This app allows users to take a 10-question quiz, navigate through questions, and submit their answers. The app displays the user's score as a percentage and rates their performance with stars out of three.

## Features

- **Question Navigation**: Navigate through the quiz with "Next" and "Back" buttons.
- **Answer Selection**: Choose one answer from four options for each question.
- **Submit Quiz**: Submit the quiz to see the final score and rating.
- **Score Display**: Shows the user's score as a percentage and a star rating out of three.
- **State Management**: Utilizes GetX for efficient and reactive state management.

<details> 
  <summary><h2>📸Photo / 📽️Video</h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/71af78b7-422b-4e1b-b762-172ffc92b6cf" alt="Image 2" width="300" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/682a2a69-93aa-4209-88c9-b513060b3f43" alt="Image 2" width="300" height="auto"></td>
      </tr>
      <tr>
        <td><img src="https://github.com/user-attachments/assets/7bd7f8d0-a874-4eae-a4b3-82643ce19a14" alt="Image 2" width="300" height="auto"></td>
        <td><video src="https://github.com/user-attachments/assets/c83d802f-9a7d-41d9-a276-07fb268d54b0" width="320" height="auto"></video>
      </tr>
    </table>   
  </p>
</details>

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Aayush014/flutter_quiz_app.git
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

1. **Quiz Screen**:
   - Use the "Next" button to move to the next question and the "Back" button to revisit the previous question.
   - Select an answer by tapping on one of the four options.
   - Submit your answers using the "Submit" button after answering all questions.

2. **Results Screen**:
   - After submitting the quiz, the results screen displays your score as a percentage and a star rating out of three based on your performance.

## Quiz Model

The quiz model contains 10 questions, each with four possible answers. Here is an example of the quiz model structure:

```dart
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
```

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
