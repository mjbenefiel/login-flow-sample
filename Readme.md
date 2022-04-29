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
