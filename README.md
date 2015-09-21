## Instructions

- Create a virtualenv and install libraries (pip install -r requirements).
- Run the server and us ngrok for tunneling.
- Create a TwiML app (https://www.twilio.com/user/account/apps) and use "ngrok address/call" for request url.
- Configure phone number voice to use the application created (https://www.twilio.com/user/account/phone-numbers/incoming).
- Replace ACCOUNT_SID, AUTH_TOKEN, APP_SID, CALLER_ID, CLIENT in server/server.py.
- Replace url in ViewController.m in xcode project.
- Replace client in ViewController.m with client name. Remember this name must be equal to CLIENT in server.py.
- Make and receive calls.