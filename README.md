# What is this?
This project automatically translates text via Chat GPT. Insert your CSV file and press the button, and GPT will translate it into the specified language.

## Is that all?
What's unique about this project is that you can input the context for each text. You can help GPT to translate correctly by writing the context for the text on the same row. You can also set a prompt that applies to all texts.

# How to use
![6](https://github.com/user-attachments/assets/1cbcd7e1-14e5-4a21-aa72-2d5b1ca1a512)
d827-4046-a906-9446809a58ac)
1. Enter your Chat GPT API key and other information.

2. Press the Confirm button.

![3](https://github.com/user-attachments/assets/383afcbb-4032-4ef2-a842-633d9b3ea9cd)
3. Fill each field with the correct information. The required information includes:

![2](https://github.com/user-attachments/assets/29720d68-21d5-4f74-9421-ddf1973a03dc)

-csv file name: The name of the CSV file you have moved to the program folder location. This file will be translated.

-start language: The language of the original text to be translated.

-destination language: The target language of the translation.

![5](https://github.com/user-attachments/assets/798c9ca8-d827-4046-a906-9446809a58ac)

-start column name: The text at the top of the column where the original text is located. In the picture, it is labeled "KR".

-destination column name: The text at the top of the column where the translated sentences will go. In the picture, it is labeled "EN".

-context column name: The text at the top of the column that describes the context of the original text. In the picture, it is labeled "CONTEXT".

4. Enter the desired content in the prompt to the right of the Setting button. This is not mandatory.

5. Press the Save setting button. This way, you won't need to enter the same information next time.

6. Press the Load csv button. The file in the folder where the executable file is located will be loaded.

7. Press the Start translation button. The translation begins immediately when you press the button, and when the translation is finished, the log window will notify you that it is done.

8. Press the Save csv button to save the translated content. When the save is complete, a log will appear. If you see the log, you must check that the file has been created correctly before closing the program, as there may be a problem with program permissions preventing proper saving.

9. In case of a Chat GPT error or if your tokens are exhausted and translation stops, you can still press the Save csv button to save the file translated up to that point. You can later put the file that was saved at that point back in and the translation will automatically resume from where it stopped.

#Open Source
This project is an open-source project. You can utilize this source in any way. However, I am not responsible for any issues that arise from it.
