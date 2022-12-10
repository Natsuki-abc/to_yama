window.initMap = () => {
  let latitude = gon.latitude
  let longitude = gon.longitude

  let map;
  const area = document.getElementById('map'); 
  const center = {
    lat: latitude,
    lng: longitude
  };

  map = new google.maps.Map(area, {
    center,
    zoom: 14,
  });
}
