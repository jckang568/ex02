<%--
  Created by IntelliJ IDEA.
  User: kjc
  Date: 2021-12-17
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>

<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sm1tdspgz7"></script>--%>
<script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
<script>
    jQuery.getScript('https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sm1tdspgz7', function (){
        console.log('naver api.js loading!!');
        jQuery.getScript('/resources/js/MarkerClustering.js',function() {
            var zoomControlOptions = {
                position: naver.maps.Position.RIGHT_CENTER,
                legendDisabled: false
            }
            var initCenter = new naver.maps.LatLng(36.49961578403295, 127.33087332039494);
            var mapOptions = {
                center: initCenter,
                zoom: 12,
                zoomControl: true,
                zoomControlOptions: zoomControlOptions
            }
            var map = new naver.maps.Map('map', mapOptions);
            var marker = new naver.maps.Marker({
                position: initCenter,
                map: map
            });
            var markers = [];

            var htmlMarker1 = {
                    content: '<div class="map_pointing"><span class="num_notice-flag"></span></div>',
                    /*content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/images/cluster-marker-1.png);background-size:contain;"></div>',*/
                    size: new naver.maps.Size(40, 40),
                    anchor: new naver.maps.Point(20, 20)
                },
                htmlMarker2 = {
                    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/images/cluster-marker-2.png);background-size:contain;"></div>',
                    size: new naver.maps.Size(40, 40),
                    anchor: new naver.maps.Point(20, 20)
                },
                htmlMarker3 = {
                    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/images/cluster-marker-3.png);background-size:contain;"></div>',
                    size: new naver.maps.Size(40, 40),
                    anchor: new naver.maps.Point(20, 20)
                },
                htmlMarker4 = {
                    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/images/cluster-marker-4.png);background-size:contain;"></div>',
                    size: new naver.maps.Size(40, 40),
                    anchor: new naver.maps.Point(20, 20)
                },
                htmlMarker5 = {
                    content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/images/cluster-marker-5.png);background-size:contain;"></div>',
                    size: new naver.maps.Size(40, 40),
                    anchor: new naver.maps.Point(20, 20)
                };

            function onLoad() {
                var data = accidentDeath.searchResult.accidentDeath;

                for (var i = 0, ii = data.length - 2990; i < ii; i++) {
                    var spot = data[0];
                    var latlng = new naver.maps.LatLng(spot.grd_la, spot.grd_lo);
                    naver.maps.Service.reverseGeocode({
                        coords: latlng,
                        orders: [
                            naver.maps.Service.OrderType.ADDR,
                            naver.maps.Service.OrderType.ROAD_ADDR
                        ].join(',')
                    }, function (status, response) {
                        /*if(status !== naver.maps.Service.Status.OK){
                            return alert(i + '번째의 검색결과가 없거나 기타 네트워크 에러');
                        }*/
                        var result = response;
                        var marker = new naver.maps.Marker({
                            position: latlng,
                            draggable: false,
                            icon: {
                                content: [
                                    '<div class="map_pointing" style="left:50%;top:50%;"><button class="btn_map-point">' + result.v2.address.jibunAddress + '</button></div>'
                                ].join(''),
                                size: new naver.maps.Size(38, 58),
                                anchor: new naver.maps.Point(19, 58),
                            }
                        });
                        markers.push(marker);
                        if (i === data.length) {
                            createMarkerClustering();
                        }
                    });

                    /*}*/
                    /*}*/
                }

                function createMarkerClustering() {
                    var markerClustering = new MarkerClustering({
                        minClusterSize: 2,
                        maxZoom: 14,
                        map: map,
                        markers: markers,
                        disableClickZoom: false,
                        gridSize: 120,
                        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
                        indexGenerator: function (count) {
                            var index = 0;
                            if (count >= 100 && count < 200) {
                                index = 1;
                            } else if (count >= 200 && count < 500) {
                                index = 2;
                            } else if (count >= 500 && count < 1000) {
                                index = 3;
                            } else if (count >= 1000) {
                                index = 4;
                            }

                            return index;
                        },
                        stylingFunction: function (clusterMarker, count) {
                            $(clusterMarker.getElement()).find('div:first-child').find('span').text(count);
                        }
                    });
                }

                jQuery(function () {
                    onLoad();
                });
            }
        });
    });
</script>

<%--<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=sm1tdspgz7&submodules=geocoder"></script>--%>

<script src="<c:url value="/resources/js/accidentDeath.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/map.css"/>">

<head>
    <title>Map</title>
</head>
<body>
    <div id="map" style="width:100%;height:100%;"></div>
</body>

</html>

