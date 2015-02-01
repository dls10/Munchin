<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<style>
    body
    {
        background-color: #33CCFF;
    }
    input, textarea
    {
        background-color:#666;
        color: #FFF;
    }
</style>

<t:template isApproved="${isApproved}" log="${log}" page="${page}">
    <jsp:attribute name="scripts">
        <script>
        var count = 2;
        function addNewFoodOrder(button, type)
        {
            if (type.localeCompare("alt") == 0){
                var num = $(button).attr("name").split("item")[1];
                console.log(num);
                var food_name = $('<div class="form-group"> <label for="altFoodItem'+num+'">Name of food item</label><input type="text" class="form-control" id="firstItem'+num+'alt" name="firstItem'+num+'alt" placeholder="Enter the food" required> </div>');
                var price_min = $('<div class="form-group"> <label for="altPriceMin'+num+'">Minimum Price</label><input type="text" class="form-control" id="priceMin'+num+'alt" name="priceMin'+num+'alt"placeholder="Enter minimum price" required> </div>');
                var price_max = $('<div class="form-group"> <label for="altPriceMax'+num+'">Maximum Price</label><input type="text" class="form-control" id="priceMax'+num+'alt" name="priceMax'+num+'alt"placeholder="Enter maximum price" required> </div>');
                var comments = $('<div class="form-group"> <label for="altComments'+num+'">Additional Comments</label><input type="text" class="form-control" id="comments'+num+'alt" name="comments'+num+'alt"placeholder="Enter comments (i.e. no pickles, extra ketchup)" required> </div>');
                var newDiv = $("<div>").attr("id", "alt"+num)
                        .append($('<h3>').html("Alternate Food Item"))
                        .append(food_name)
                        .append(price_min)
                        .append(price_max)
                        .append(comments);
                newDiv.appendTo($('#item'+num));
            }
            else{
                var food_name = $('<div class="form-group"> <label for="foodItem'+count+'">Name of food item</label><input type="text" class="form-control" id="firstItem'+count+'" name="firstItem'+count+'" placeholder="Enter the food" required> </div>');
                var price_min = $('<div class="form-group"> <label for="priceMin'+count+'">Minimum Price</label><input type="text" class="form-control" id="priceMin'+count+'" name="priceMin'+count+'"placeholder="Enter minimum price" required> </div>');
                var price_max = $('<div class="form-group"> <label for="priceMax'+count+'">Maximum Price</label><input type="text" class="form-control" id="priceMax'+count+'" name="priceMax'+count+'"placeholder="Enter maximum price" required> </div>');
                var comments = $('<div class="form-group"> <label for="comments'+count+'">Additional Comments</label><input type="text" class="form-control" id="comments'+count+'" name="comments'+count+'"placeholder="Enter comments (i.e. no pickles, extra ketchup)" required> </div>');
                var button = $('<button class="btn btn-primary" name="item'+count+'" onclick="addNewFoodOrder(this, \'alt\')"><span class="glyphicon glyphicon-plus"></span> Alternate</button>');

                $("#inputs").append("<h3>Food order:</h3>");
                $("#inputs").append("<br>");
                var newDiv = $("<div>").attr("id", "item"+count)
                        .append($('<h3>').html("Food Item"))
                        .append(food_name)
                        .append(price_min)
                        .append(price_max)
                        .append(comments)
                        .append(button);
                newDiv.appendTo($('#inputs'));
                $('#numItems').val(count);
                count++;
            }
        }
        </script>
    </jsp:attribute>

    <jsp:attribute name="content">
        <div class="site-wrapper-inner">

        <form role="form" method ="Post" id ="orderForm">
            <input type="text" name="trip" style="display:none" value="${tripId}">
            <div id="inputs">
                <div id="item1">
                    <div class="form-group">
                        <label for="foodItem">Name of food item</label>
                        <input type="text" class="form-control" id="foodItem" name="foodItem1" placeholder="Enter the food" required>
                    </div>
                    <div class="form-group">
                        <label for="priceMin">Minimum Price:</label>
                        <input type="number" class="form-control" id="priceMin" name="priceMin1" placeholder="Enter Minimum Price" pattern= "\d?\d.\d\d" maxlength = 5  size = 5 required>
                    </div>
                    <div class="form-group">
                        <label for="priceMax">Maximum Price:</label>
                        <input type="number" class="form-control" id="priceMax" name="priceMax1" placeholder="Enter Maximum Price" pattern= "\d?\d.\d\d" maxlength = 5  size = 5 required>
                    </div>
                    <div class="form_group">
                        <label for = "comments"> Additional Comments:</label>
                        <input type = "text" class = "form-control" id ="comments" name="comments1" placeholder="Enter Comments (i.e. no pickles, extra ketchup" required>
                    </div>
                    <button class="btn btn-primary" name='item1' onclick="addNewFoodOrder(this, 'alt')"><span class="glyphicon glyphicon-plus"></span> Alternate</button>
                </div>
            </div>
            <br>
            <button onclick="addNewFoodOrder(this, 'food')">
                <span class="glyphicon glyphicon-plus"></span>
            </button>
            <br>
            <input type="number" name="numItems" id="numItems" style="display: none" value=1>
            <button type="submit" style="margin-top:10px" class="btn btn-default">Submit</button>
        </form>
        </div>

    </jsp:attribute>

</t:template>