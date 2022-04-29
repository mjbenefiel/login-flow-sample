Included:
- Firebase authentication: sign-up/log-in/log-out/forgot password - fully functional
- Three tabs: Home, Photos, Settings
- Custom home page with username dynamically populated
    - Username set via UserDefaults
        - Ideally would like to integrate with Firebase so it's dynamically populated via auth/login as opposed to being stored through duration of app download
- Photos page calls the unsplash API to return photos based on search query
- Settings has username and email dynamically populated
    - Logout bar button, fully functional
    - TableView updated with some switch toggles.
    - Table rows built out programmatically but are non-functional at this point
    
Overall, this was a good exercise/practice and learning experience with Swift. I didn't have a solid idea of what sort of app I wanted to build when I started. For a while, I thought I could get away with slapping together various features without a true architecture/app design in place. While this worked to an extent for very simple implementations (such as the unsplash API in its own ViewController), I ran into major blockers when trying to upload and insert photos and integrating the uploads between views. This has me at a point where it seems like a waste of time to continue building within this app, as it's more of a "frankenstein" with no clear direction.

Moving forward, I'd be interested in building a Firebase Chat App as seen in the link below. This has a lot of the features implemented that I found myself wanting to do as I tinkered more with this app.

Firebase Chat App
https://www.youtube.com/playlist?list=PL5PR3UyfTWvdlk-Qi-dPtJmjTj-2YIMMf


<b>Onboarding Screen -- Three slides</b>

<img width="381" alt="onboarding" src="https://user-images.githubusercontent.com/38706611/165994599-916e8bfb-dd78-42d5-a266-5edd16aa983a.png">

<b>Login</b>

<img width="389" alt="login" src="https://user-images.githubusercontent.com/38706611/165994711-e55ca18a-6452-4d82-aac8-be6baeb0b89a.png">

<b>Signup</b>

<img width="384" alt="signup" src="https://user-images.githubusercontent.com/38706611/165994741-84906979-8d1c-47a1-915e-c519bf81fddb.png">

<b>Forgot Password</b>

<img width="383" alt="forgetpwd" src="https://user-images.githubusercontent.com/38706611/165994761-80af2a1b-6f5a-436b-861a-6139dead0d42.png">

<b>Error Handling</b>

<img width="376" alt="errorhandle" src="https://user-images.githubusercontent.com/38706611/165994789-2ee60efe-0463-41f9-a46f-c9e62ef315ad.png">

<b>Home</b>

<img width="375" alt="home" src="https://user-images.githubusercontent.com/38706611/165994808-d85beeb5-169b-46d9-8198-7a2f1cf43db1.png">

<b>Photo Search - Unsplash API</b>

<img width="380" alt="unsplash" src="https://user-images.githubusercontent.com/38706611/165994835-abaccdcf-dcc2-4e2b-8ec5-787ce49aa88e.png">

<b>Settings -- Logout functional -- Redirects to Onboarding Screen</b>

<img width="396" alt="settings" src="https://user-images.githubusercontent.com/38706611/165994895-4a0e7b81-eb01-49c9-818c-46a6c4eadc88.png">










