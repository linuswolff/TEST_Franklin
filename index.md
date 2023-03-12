# Home

~~~
<!DOCTYPE html>
<html>
  <head>
    <title>Portrait with subtitle</title>
    <style>
      .image-container {
        float: left; /* float the container to the left */
        margin-right: -50px; /* create some space between the image and text */
        text-align: center;
        line-height: 1;
      }
      .image-with-subtitle {
        display: block;
        margin-bottom: 12px;
        max-width: 400px;
      }
      .image-subtitle {
        font-style: italic;
        font-size: 14px;
        text-align: center;
        margin-left: -33px; /* adjust margin as needed */
      }
    </style>
  </head>
  <body>
    <div style="text-align: left;">
      <div class="image-container">
        <img class="image-with-subtitle" src="images/linus_photo.jpg" alt="Portrait of myself">
        <div class="image-subtitle">
          Linus Wolff
        </div>
      </div>
      <p>
        Welcome to my personal website. <br>
        I have just finished my Bachelor of Economics at the University of Mannheim and plan to start a Masters in the area of Data Science/Econometrics after the summer.
        My interests lie in Econometrics, Applied Statistics and Machine Learning. I wrote my thesis on "Exploring the Potential of Dynamic Factor Models for High-Dimensional Time Series Forecasting" and wrote a corresponding R package, which you can find <a href="https://github.com/linuswolff/DynamicFactorModel" target="_blank" rel="noopener">here</a>.
      </p>
    </div>
  </body>
</html>
~~~