# Straßenschilder NN

importing the already trained model

```python
model = keras.models.load_model('german_traffic_signs_model.h5')
```

We now load in the test data.

```python
test = pd.read_csv(data_dir + '/Test.csv')

labels = test["ClassId"].values
imgs = test["Path"].values

data = []

for img in imgs:
    try:
        image = cv2.imread(data_dir + '/' + img)
        image_from_array = Image.fromarray(image, 'RGB')
        size_image = image_from_array.resize((IMG_HEIGHT, IMG_WIDTH))
        data.append(np.array(size_image))
    except:
        print("Error in " + img)

X_test = np.array(data)
X_test = X_test / 255
```

And predict the results.

```python
pred = model.predict(X_test)
pred = np.argmax(pred, axis=1)
```

This model has a very good accuracy on the test data.

```python
print('Test Data Accuracy: ', accuracy_score(labels, pred))
```

Now let's test the model with some images from the internet.

~~~
<div style="display:flex; justify-content:center;">
  <img src="/images/50kmh_sign.jpeg" style="width:30%; margin:0; padding:0;">
  <img src="/images/30kmh_sign.jpeg" style="width:30%; margin:0; padding:0 25px;">
  <img src="/images/vorfahrt_gewähren_sign.jpeg" style="width:30%;
  margin:0; padding:0;">
</div>
~~~

Let's define a function to classify the images.

```python
import requests
from PIL import Image

def classify_german_sign(url):
    response = requests.get(url, stream=True)
    img = Image.open(response.raw)
    plt.imshow(img, cmap=plt.get_cmap('gray'))
    # plt.show()

    img = np.asarray(img)
    img = cv2.resize(img, (IMG_HEIGHT, IMG_WIDTH))
    img = img / 255
    img = img.reshape(1, IMG_HEIGHT, IMG_WIDTH, channels)
    # predicting the class
    predicted_class = np.argmax(model.predict(img), axis=-1)
    # print the class
    print("This sign belongs to class:", classes[predicted_class[0]])
```

Now let's test if the model classifies the images correctly.

```python
classify_german_sign(url1)
```

```!
#hideall
println("1/1 [==============================] - 0s 142ms/step
This sign belongs to class: Speed limit (50km/h)")
```

```python
classify_german_sign(url2)
```

```!
#hideall
println("1/1 [==============================] - 0s 23ms/step
This sign belongs to class: Speed limit (30km/h)")
```

```python
classify_german_sign(url3)
```

```!
#hideall
println("1/1 [==============================] - 0s 20ms/step
This sign belongs to class: Yield")
```

> The model identified all three images correctly.

However, it is not perfect. Let's see what happens if we give it an image where the sign is not front and center.

~~~
<div style="display:flex; justify-content:center;">
  <img src='/images/stopsign_schwer.jpeg' style="width:70%; margin:0; padding:0;">
</div>
~~~

```python
classify_german_sign(url4)
```

```!
#hideall
println("1/1 [==============================] - 0s 20ms/step
This sign belongs to class: Roundabout mandatory")
```

The prediction is wrong.

@@row
@@container
@@left ![](/images/stoppschild.png) @@
@@
Under the hood, this model is a neural network trained on a collection of relatively homogenous training examples that take this form. It is not able to understand the context of the image. It is not able to classify the above image, mainly because it is very different from the training data.
~~~
<div style="clear: both"></div>
~~~
@@

