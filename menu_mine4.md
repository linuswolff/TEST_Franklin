# MNIST neural net

R code can be called by using `R"..."`:
```julia:./test7.jl
using RCall

R"
library(dplyr)
library(keras)
library(tensorflow)
library(yardstick)

options(scipen = 999)

# this python env seems to work
use_python('/usr/local/bin/python3')

### test if tensorflow is working
tf$print(
  tf$constant('Hello, TensorFlow!')
)
###

# import data

train_mnist <- read.csv('~/Documents/code/R_stuff/mnist test/train.csv', header = T)

## head(train_mnist)

dim(train_mnist)

# Cross validation

set.seed(123)
index <- sample(x = nrow(train_mnist), 
                size = nrow(train_mnist) * 0.9 )

data_train <- train_mnist[ index, ]
data_test <- train_mnist[ -index, ]

table(data_train$label) %>% prop.table()

# seperate target and features

train_x <- data_train %>% 
  select(-label) %>% 
  as.matrix() / 255

test_x <- data_test %>% 
  select(-label) %>% 
  as.matrix() / 255
# show some random values to see if it looks good -> values are [0,1]
train_x[1:10, 203:208]


# multi layer perceptron

train_x_keras <- array_reshape(train_x, dim(train_x))
test_x_keras <- array_reshape(test_x, dim(test_x))

train_y <- to_categorical(data_train$label, num_classes = 10)
test_y <- data_test$label

# encoded target

cat('Encoded Target \n \n')
head(train_y)


# building the model architecture

tf$random$set_seed(123)

model <- keras_model_sequential(name = 'MLP_Model') %>% 
  layer_dense(units = 512, 
              activation = 'relu',
              input_shape = ncol(train_x),
              name = 'Hidden_1'
  ) %>% 
  layer_dense(units = 128, 
              activation = 'relu',
              name = 'Hidden_2'
  ) %>% 
  layer_dense(units = 32,
              activation = 'relu',
              name = 'Hidden_3'
  ) %>% 
  layer_dense(units = 16,
              activation = 'relu',
              name = 'Hidden_4'
  ) %>% 
  layer_dense(units = 10,
              activation = 'softmax'
  )

model

# training the model

model %>% 
  compile(loss = 'categorical_crossentropy',
          optimizer = optimizer_adam(lr = 0.001),
          metrics = 'accuracy'
  )

train_history <- model %>% 
  fit(x = train_x_keras,
      y = train_y,
      epochs = 15,
      batch_size = 32,
      validation_split = 0.1,
      verbose = 1
  )

plot(train_history)


# evaluate model on test data

pred_test <- model %>% predict(test_x_keras) %>% k_argmax() %>% as.integer()

pred_acc <- data.frame(Accuracy = accuracy_vec(truth = as.factor(data_test$label), 
                          estimate = as.factor(pred_test)),
  
           Recall = sens_vec(truth = as.factor(data_test$label),
                    estimate = as.factor(pred_test)),
  
           Precision = precision_vec(truth = as.factor(data_test$label), 
                            estimate = as.factor(pred_test)),
  
           F1 = f_meas_vec(truth = as.factor(data_test$label), 
                  estimate = as.factor(pred_test)))

# accuracy etc. in percent

pred_acc_new <- pred_acc |> mutate_all(scales::percent, accuracy = 0.01)" #HIDE


pred_acc_new = @rget pred_acc_new

println(pred_acc_new)
```
\output{./test7.jl}

HELLO
