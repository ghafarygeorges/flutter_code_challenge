# Flutter Coding Challenge

This is the coding task/challenge assigned to Georges Ghafary

## General Idea

This project consists of creating a small ( 2 Screens ) News Master/Detail App
The API used for this app is the NY Times Most Popular API

## Architecture

The Software Architecture used in this app was MVVM (Model-View-ViewModel) since it makes unit testing simpler due to the seperation of the business logic from the views and also the potential scalabilty of MVVM applications since it helps seperate the UI, Business Logic and Data layers. The Provider plugin has also been used to allow the ViewModel to notify the View of changes happening.

## Testing and Code Coverage

To automate the app testing, I have written both unit tests and UI/Widget tests and have reached an 88% total code coverage with 100% coverage on unit testing and views but around 70% for UI since i came across a problem with mocking the API in UI tests
For unit tests, i have used Mockito alongside build runner to generate mock classes for testing

For Code Coverage, I have used both flutter and LCOV to generate readable HTML based code coverage reports:

### Step 1

Open your project folder in the terminal and execute
```
flutter test --coverage
```
This will run all tests and then generate a coverage folder in your project folder that has an lcov.info file that is not readable.

### Step 2 - MacOS/Linux

If you are on MacOS and have homebrew installed, execute the following commands in your terminal (the second command needs to be in your project folder):
```
brew install lcov
genhtml -o coverage coverage/lcov.info
```
If you are on Linux, execute the following commands in your terminal
```
sudo apt-get install lcov
genhtml -o coverage coverage/lcov.info
```
These commands will create an html folder in your already existing coverage folder, that contains an ```index.html``` file, and that file will open up a neatly designed code coverage report

### Step 2 - Windows

On Windows, generating the code coverage reports as HTML needs a bit more work

genhtml is a perl script. If you are have git bash installed, you should have perl already. Try where perl on the cmd and it will show you the path.

Now create a file called ```genhtml.perl``` either inside your project folder or anywhere on your computer then copy the contents of this file https://raw.githubusercontent.com/valbok/lcov/master/genhtml.perl inside of it

Finally, open your terminal on your project folder ( for this example i will consider the genhtml.perl file to be in my project directory ) and execute the following command
```
./genhtml.perl ./coverage/lcov.info -o coverage/html
```
if you face an ```No common filename prefix found!``` error, use this link https://raw.githubusercontent.com/linux-test-project/lcov/master/bin/genhtml instead of the previous one to create your ```genhtml.perl``` file

This command will create an html folder in your already existing coverage folder, that contains an ```index.html``` file, and that file will open up a neatly designed code coverage report

## Building the app

To build the app, you need to have a flutter development environment setup and then you could use the following command to run the app
```
flutter run --release
```
Or you could alternatively build an apk for the app using
```
flutter build apk
```
which will create an ```app-release.apk``` that can be found through ```project_folder > build > app > outputs > flutter-apk > app-release.apk```
