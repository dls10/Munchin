<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:template isApproved="${isApproved}" log="${log}" page="${page}">
    <jsp:attribute name="scripts">
        <script>
            $(function() {
                $.each( ${responseJson}, function(index, trip) {
                    var splitTrip = trip.rating.split(" ");
                    var numStars = splitTrip[0];
                    var numReviews = splitTrip[1];
                    var stars = $('<span>');
                    for (var i = 1; i <= numStars; i++) {
                        var newSpan = $('<span class = "glyphicon glyphicon-star" style="color:gold">');
                        stars.append(newSpan);
                    }
                    var numReviewsSpan = $('<span>').html("("+numReviews+")");
                    stars.append(numReviewsSpan);
                    var fee = "";
                    if (trip.flat == 0 && trip.percentage == 0)
                    {
                        fee = "No fee";
                    }
                    if (trip.flat != 0)
                    {
                        fee += "$" + trip.flat;
                    }
                    if (trip.percentage != 0)
                    {
                        fee += trip.percentage + "%";
                    }
                    $('<div>').appendTo('#trips')
                            .append($('<span style = "font-size:160%; font-weight:bold">').html(trip.location))
                            .append($('<br>'))
                            .append($('<span style = "color:red">').html(trip.timeLeft))
                            .append($('<span>').html(trip.eta))
                            .append($('<br>'))
                            .append($('<span>').html("Drop off location: " + trip.dropOffLocation))
                            .append($('<br>'))
                            .append($('<span>').html(trip.user))
                            .append(stars)
                            .append($('<span>').html(fee))
                            .append($('<a class="btn btn-primary"> href="order?id="+trip.id>').html("thanks for clicking").hide())
                            .addClass('trip')
                            .addClass('well well-lg')
                });
            });
            $(function () {
                $('#trips').on('click', 'div', function() {
                    $($(this).find('p')[0]).slideDown("fast");
                });
            });
        </script>
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="site-wrapper-inner">
            <div class="cover-container">
                <!--
                thanks to : http://bootsnipp.com/snippets/featured/bootstrap-3x-contact-form-layout
                -->
                <div id="content" class="inner cover" style="text-align: left">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="trips"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</t:template>