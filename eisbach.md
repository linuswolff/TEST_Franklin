# Eisbach

~~~
<!DOCTYPE html>
<html>
<head>
    <!-- <meta http-equiv="refresh" content="300"> -->
    <title>Displaying HTML Content Using JavaScript</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Fetch the HTML content from the source URL
            // trying without cors for the deployed version
            // $.get("https://cors-anywhere.herokuapp.com/https://www.eisbachwetter.de/", function
            $.get("https://www.eisbachwetter.de/", function(data) {
                // Extract the desired HTML content
                var height = $(data).find("h1#height.value-big").html();
                var air = $(data).find("h1#air.value-big").html();
                var water = $(data).find("h1#water.value-big").html();
                var flow = $(data).find("h1#flow.value-big").html();
                
                if (height && air && water && flow) {
                    // Display the extracted HTML content on your website
                    $("#height").html(height);
                    $("#air").html(air);
                    $("#water").html(water);
                    $("#flow").html(flow);
                } else {
                    // Display an error message if the content cannot be extracted
                    $("#display-container").html("Error: Cannot extract content.");
                }
            });
        });
    </script>
</head>
<body>
    <div id="height"></div>
    <div id="air"></div>
    <div id="water"></div>
    <div id="flow"></div>
</body>
</html>
~~~