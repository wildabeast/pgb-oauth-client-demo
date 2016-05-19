PhoneGap Build Oauth Client Demo
------------------------------------------

This rails app semos how to connect to PhoneGap Build using the Oauth flow. Its a more secure way of consuming our API than basic token auth.

Setup
-------------------------------------------

Prerequisites:
- ruby 2
- rails 4

Register your app on PhoneGap Build. Enter the following for your app details:
- Main application url: `http://localhost:3000`
- Callback url `http://localhost:3000/pgb_callback`

Open `app/controllers/welcome_controller.rb` and change these values that you obtained when you [registered your app on Build](https://build.phonegap.com/people/edit):
- CLIENT_ID
- CLIENT_SECRET

Setup: 

    bundle install
    rake db:setup

Run:

    rails s
 
then go to [http://localhost:3000](http://localhost:3000) in Chrome.
