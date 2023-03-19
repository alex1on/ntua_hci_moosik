# Moodsik
A project for human computer interaction course of the 7th semester of ece ntua university. A music app that makes recommendation based on your current mood. You can create and personalize your user by choosing the songs you like to listen when feeling a specific emotion. The app then creates personalized recommendations that are based on your preferences. 

# Installation 
Step 1: Make sure you have Flutter SDK installed on your computer. If you haven't already installed it, you can follow the instructions on the Flutter website:

<https://flutter.dev/docs/get-started/install>

Step 2: Clone the repository. 

Step 3: Next, while being in the directory of the cloned repository run the following command to get all the necessary dependencies for the app:

	flutter pub get
	
Step 4: After all the dependancies are installed you can now run the flutter application. 

	flutter run

Keep in mind you must have already set up an android emulator to run the app. 

You can also use your Android device to run the app on the device if you have it connected to your computer. To run it on your device firstly you have to find the specific device id like this:
	
	flutter devices
	
Copy the device id of you physical device and run the following command:
	
	flutter run -d device-id

The app now should be running on your mobile phone.

# How to use the app

After you launch the app you meet the landing page with two possible scenarios, **Log in** or **Sign up**. 
If you launch the app for the first time you will most likely choose to **Sign up**. After you enter your credentials, you are transferred to the personalization phase of the app. For each emotion shown choose the songs that you would most likely listen to when feeling that certain emotion. After you complete the set up you will be located to the **Main Page**. 
In the **Main Page** you will be faced with certain emotion playlists that were created from your preferences and other recommendations based on them. You can choose the way you feel and listen to that specific playlist. You can make changes on each playlist by clicking on the playlist name on the *My Playlist...* section. 
Notice that the center widget is a smartwatch replica with certain vital sensors. The application is accompanied with a WearOS app that accomplishes some basic features like displaying the song playing and skipping. 

# TODO

*	Get sensor data from smartwatch
* Communicate between smartwatch app and base app
