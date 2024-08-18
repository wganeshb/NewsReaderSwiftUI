NewsReaderSwiftUI

API Used - https://newsapi.org

Architecture Used - MVVM with async await for netowrk calls.
Framework used for UI developement - SwiftUI 

1. On application launch. The progress indicator start rotating at the top left corner of navigation bar.
2. At the top of the listview the searchBar is provided to search through the fetched list.
3. On the navigation bar the option shows the selected category of news. You can select the any other category by tapping on the text.
4. On selecting one of the article. You navigate to articles details view.
   
Notes -
https://newsapi.org doesn't provide the backed data as expected. So to showcase the implementation two different API's are used, One default article list 
and another for the category based data. That is limitation of API's.

Recording of the simulator -
The simulator recorded was too big in size around 80MB. I compressed it to upload to github. That might result in the lower video quality.

https://github.com/wganeshb/NewsReaderSwiftUI/blob/d68aa731dab49429c2d6b5f9cad061aba31152da/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202024-08-19%20at%2001.09.00.mp4            
