<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        .container img {
            height: 100%;
            width: 100%;
            opacity: 0;
            transition: opacity 0.5s;
        }
    </style>
</head>
<body>
<h1>Hello, world!</h1>
<div class="container">
    <img src="https://media.idownloadblog.com/wp-content/uploads/2023/01/MacBook-Pro-2023-M2-Pro-M2-Max-1500x1000.jpg"
         class="rounded mx-auto d-block img-fluid" alt="...">
    <img src="https://media.idownloadblog.com/wp-content/uploads/2023/02/M2-wallpaper-for-iPhone-BasicAppleGuy-idownloadblog-mockup-1500x1000.jpg"
         class="rounded mx-auto d-block img-fluid" alt="...">
    <img src="https://media.idownloadblog.com/wp-content/uploads/2023/03/wwdc-2023-wallpapers-1500x1000.jpg"
         class="rounded mx-auto d-block img-fluid" alt="...">
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(window).on('scroll', function () {
        var scrollTop = $(this).scrollTop();
        var opacity = 1 - (scrollTop / 500);

        if (opacity < 0) {
            opacity = 0;
        } else if (opacity > 1) {
            opacity = 1;
        }

        $('.container img').css('opacity', opacity);
    });
</script>
</html>