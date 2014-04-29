PhoneGap Build Oauth Client Demo
------------------------------------------

This here rails app is completely useless, aside from showing you how to connect to PhoneGap Build using the Oauth flow. Its a more secure way of consuming our API, and in the future will allow you to specify scopes for your API tokens, and maybe even user metrics at some point.

Setup
-------------------------------------------

I used Ruby 2 and Rails 4. Its cutting edge.

Open `app/controllers/welcome_controller.rb` and change these values that you obtained when you [registered your app on Build](https://build.phonegap.com/people/edit):
- CLIENT_ID
- CLIENT_SECRET

Run 
    
    rails s
 
then go to [http://localhost:3000](http://localhost:3000) in Chrome.
