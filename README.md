NYTimes Article
-----------------------
This repository contains a sample app for requesting New York Times's Most viewed articles API.


---
 Installation

To install the dependencies
* Open a terminal and cd to the directory containing the Podfile
* Run the `pod install` command

---
Existing Functionalities

The app shows the list of most viwed articles in NewYork Times.

* First screen shows the list of articles
* When you tap on an item in the list, iot takes you to the second screen which shows the details of the article

---
Development Steps

1. Create new project based on single view app
3. Design the UI in storyboard
4. Add Alamofire and ObjectMapper pod to retrieve data from URL 
5. Add Networking Layer to handle the NY TImes's API
6. Add model and viewcontroller, that will show the Top Articles at ArticlesViewController
7. Design the UI layout to show the selected Story's detail (ArticleDetailViewController)
8. Add Unit Test to test the process

---
Code Coverage

1. Here we are using 'Slather' to generate the code coverage reports
2. In command line, add 'gem install slather'
3. Enable test coverage to the schema from Xcode. For details ( https://cocoacasts.com/how-to-generate-code-coverage-reports-in-xcode-with-slather)
4. Add in Comand line, slather coverage -s --workspace NYTimesArticle.xcworkspace --scheme NYTimesArticle --verbose NYTimesArticle.xcodeproj, to run the test coverage


