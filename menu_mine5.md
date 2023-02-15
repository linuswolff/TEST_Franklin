# map project

Here will be the full map tutorial

```R
library(rayshader)
library(sp)
library(raster)
library(scales)
```

We will then read in the raster elevation data and visualize it.

```R
elevation1 = raster::raster("N46E006.hgt")
elevation2 = raster::raster("N46E007.hgt")
elevation3 = raster::raster("N45E006.hgt")
elevation4 = raster::raster("N45E007.hgt")
tmb_elevation = raster::merge(elevation1,elevation2,elevation3,elevation4)

height_shade(raster_to_matrix(tmb_elevation)) |> plot_map()
```
\fig{/images/elev_data.png}

Next, we can read in the satellite imagery data.

```R
tmb_r <- raster::raster("LC08_L1TP_195028_20220918_20220928_02_T1_B4.TIF")
tmb_g <- raster::raster("LC08_L1TP_195028_20220918_20220928_02_T1_B3.TIF")
tmb_b <- raster::raster("LC08_L1TP_195028_20220918_20220928_02_T1_B2.TIF")
tmb_rgb <- raster::stack(tmb_r, tmb_g, tmb_b)

raster::plotRGB(tmb_rgb, scale = 255^2)
```
\fig{/images/sat_image.png}


This image is awfully dark. Let's brighten it by doing a gamma correction.

```R
tmb_rgb_corrected <- sqrt(tmb_rgb)

raster::plotRGB(tmb_rgb_corrected)
```
\fig{/images/sat_image_corrected.png}

If we take a look at the coordinate reference systems of our two datasets, we can see that they differ.

```R
raster::crs(tmb_r) # +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs 
raster::crs(tmb_elevation) # +proj=longlat +datum=WGS84 +no_defs

tmb_elevation_utm = raster::projectRaster(tmb_elevation, crs = crs(tmb_r), method = "bilinear")
crs(tmb_elevation_utm) # +proj=utm +zone=32 +datum=WGS84 +units=m +no_defs -- it worked
```

Finally, we can crop the region to our specified area, which in my case is roughly the route of the Tour du Mont Blanc.

```R
bottom_left = c(y = 6.620446, x = 45.657366)
top_right   = c(y = 7.222736, x = 46.053004)

extent_latlong = sp::SpatialPoints(rbind(bottom_left, top_right), proj4string=sp::CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))
#extent_utm = sp::spTransform(extent_latlong, raster::crs(tmb_elevation_utm))

e = raster::extent(extent_latlong)
```

The resulting extent e is:

class      : Extent 
xmin       : 6.620446 
xmax       : 7.222736 
ymin       : 45.65737 
ymax       : 46.053

Our datasets can now be cropped according to the extent $e$ we specified.

```R
tmb_test <- raster::projectRaster(tmb_elevation_utm, crs = crs(tmb_elevation), method = "bilinear")
tmb_test_rgb <- raster::projectRaster(tmb_rgb_corrected, crs = crs(tmb_elevation), method = "bilinear")

tmb_rgb_cropped = raster::crop(tmb_test_rgb, e)
elevation_cropped = raster::crop(tmb_test, e)

names(tmb_rgb_cropped) = c("r","g","b")

tmb_r_cropped = rayshader::raster_to_matrix(tmb_rgb_cropped$r)
tmb_g_cropped = rayshader::raster_to_matrix(tmb_rgb_cropped$g)
tmb_b_cropped = rayshader::raster_to_matrix(tmb_rgb_cropped$b)

tmb_el_matrix = rayshader::raster_to_matrix(elevation_cropped)

tmb_rgb_array = array(0,dim=c(nrow(tmb_r_cropped),ncol(tmb_r_cropped),3))

tmb_rgb_array[,,1] = tmb_r_cropped/255 #Red layer
tmb_rgb_array[,,2] = tmb_g_cropped/255 #Blue layer
tmb_rgb_array[,,3] = tmb_b_cropped/255 #Green layer

tmb_rgb_array = aperm(tmb_rgb_array, c(2,1,3))
```

As a last step we rescale for improved contrast.

```R
tmb_rgb_contrast = scales::rescale(tmb_rgb_array,to=c(0,1))
plot_map(tmb_rgb_contrast)
```
\fig{/images/tmb_rgb_contrast_map.png}

Our map can now be visualized in various ways. For example, let's plot it in 3D.

```R
plot_3d(tmb_rgb_contrast, tmb_el_matrix, windowsize = c(800,800), zscale = 15, shadowdepth = -50,
        zoom=0.5, phi=45,theta=-45,fov=70, background = "#F2E1D0", shadowcolor = "#523E2B")
```
\fig{/images/tmb_rgb_contrast_map_3d.png}








