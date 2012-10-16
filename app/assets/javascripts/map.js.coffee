#updateFormLocation = (latLng) ->
  #$("#guess_latitude").val latLng.lat()
  #$("#").val latLng.lng()
  #$("#location_attributes_gmaps_zoom").val Gmaps.map.serviceObject.getZoom()

#placeMarker = (latLng) ->
  #marker = new google.maps.Marker(
    #position: latLng
    #map: Gmaps.map.serviceObject
    #draggable: true
  #)
  #markersArray.push marker
  #infowindow = new google.maps.InfoWindow(content: "<div class=\"popup\"><h2>Awesome!</h2><p>Drag me and adjust the zoom level.</p>")
  #infowindow.open Gmaps.map.serviceObject, marker
  #google.maps.event.addListener marker, "dragend", ->
  #updateFormLocation @getPosition()

#clearOverlays = ->
  #if markersArray
    #i = 0

    #while i < markersArray.length
      #markersArray[i].setMap null
      #i++
  #markersArray.length = 0

#markersArray = []

#Gmaps.map.callback = ->
 #google.maps.event.addListener Gmaps.map.serviceObject, "click", (event) ->
   #clearOverlays()
   #placeMarker event.latLng
   #updateFormLocation event.latLng
