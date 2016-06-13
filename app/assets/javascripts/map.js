/* Sources:
https://developers.google.com/maps/tutorials/fundamentals/adding-a-google-map
https://developers.google.com/maps/documentation/javascript/examples/infowindow-simple
*/

// var geocoder;
// var map;
// var data = [];
// var nextData=[];

//function to retrieve google map using googles dev api
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(0, 0);
  var mapOptions = {
    zoom: 2,
    center: latlng
  }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    // $.get('/users/1', function(data) {
    //   console.log(data);
    // });

    // var trips = JSON.parse(trips);

    var trps = JSON.parse(trips);


    for (i = 0; i < trps.length; i++) {
      console.log(trps[i]);
      addTripToMap(trps[i]);

    // var lat = trps[i].latitude;
    // var lng = trps[i].longitude;
    //
    // var marker = new google.maps.Marker({
    //   position: new google.maps.LatLng(lat,lng),
    //   map: map,
    //   icon: "http://maps.google.com/mapfiles/kml/pal4/icon47.png",
    // });
  }
}

google.maps.event.addDomListener(window, 'load', initialize);

function addTripToMap(trip){

  var lat = trip.latitude;
  var lng = trip.longitude;



  var infowindow = new google.maps.InfoWindow({
                content: "<h1>" + trip.name + "</h1><br>" +
                        "<h1>" + trip.description + "</h1><br>"

                });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat,lng),
    map: map,
    icon: "http://maps.google.com/mapfiles/kml/pal4/icon47.png",
    infowindow: infowindow,
  });

  google.maps.event.addListener(marker, 'click', function(){
    // infowindowTwo.open(map,marker);
    infowindow.open(map,marker);
    // alert("yooo");
  });
}
