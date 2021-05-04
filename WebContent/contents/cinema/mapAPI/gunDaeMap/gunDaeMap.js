let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat:37.53992289474988, lng: 127.06703829355759},
    zoom: 17
  });

  var marker = new google.maps.Marker({
    map: map,
    position: {lat: 37.53992289474988, lng: 127.06703829355759},
    title: 'CGV 강남'
  });

//   // 정보창 객체를 추가
//   var infoWindow = new google.maps.InfoWindow({map: map});
//   var my_position = {lat: 37.5017118667875, lng: 127.02638337747673};

//   infoWindow.setPosition(my_position);
//   infoWindow.setContent('CGV 강남');
}

