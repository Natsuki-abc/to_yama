function initMap(){
  let map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: <%= @mountain.Latitude %>, lng: <%= @mountain.Longitude %> },
  zoom: 15
  });
}
