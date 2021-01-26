# jobsitychallenge

Challenge

## Getting Started

This project has a [distribution](https://github.com/AleFachini/jobsitychallenge/tree/master/distribution) folder where you can download the apk file to your phone and test the app.

I must say this was challenging or me, but i enjoyed pretty much, doing it, not so much the tons of hours i worked, but still quite satisfactory.

Now lets overview what I have achieved:

### Mandatory Features:

* List all of the series contained in the API used by the paging scheme provided by the
API.   
* Allow users to search series by name.   
* The listing and search views must show at least the name and poster image of the
series.   
* After clicking on a series, the application should show the details of the series, showing
the following information:   
    * Name   
    * Poster   
    * Days and time during which the series airs   
    * Genres   
    * Summary   
    * List of episodes separated by season     

### Comments:   
   
   I added the Favorite option in Home View but i wasnt able to make it to ad the local database to record the favorited items, still the UI was done.
   All the mandatory features seems quite working with the exception of search that is working as a different way of using the app and should have a conection to the rest of the data, but the API endpoint for que search queries is not exactly the same as the shows endpoint.
   I did some management of error on loading on images just in case some random null fields in the app, in fact there is a lot of them just by browsing the different shows.

Regards, Alejandro.-
