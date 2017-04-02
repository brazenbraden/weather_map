var Googlemap = (function($, google){

    /**
     * @param el
     * @constructor
     */
    return function(element, options){
        var pos = {
                lat: parseFloat(options.lat),
                lng: parseFloat(options.long)
            },
            map = new google.Map(document.getElementById('map'), {
                zoom: 11,
                center: pos
            }),
            infowindow = new google.InfoWindow({
                content: '<img src="' + options.icon + '">'
                    + options.description
            }),
            marker = new google.Marker({
                position: pos,
                map: map
            });

        infowindow.open(map, marker);

        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });
    };

})($, google.maps);


