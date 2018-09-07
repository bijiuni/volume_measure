# Volume Measurement by Ultrasound

The clinical significance of measuring the volume of left ventricle is that this can be used in the assessment of coronary artery diseases with infraction, vavular heart diseases and left ventricular hypertrophy.

In this project, we mainly used ultrasound to do volume measurement of a heart phantom that we 3D printed. The [ultrasound demo](https://github.com/bijiuni/volume_measure/blob/master/ultrasound%20demo.avi) is shown is a video.

You can find the 3D phantom we created in SolidWorks [here](https://github.com/bijiuni/volume_measure/tree/master/phantom).


## Running the tests
[resolution](https://github.com/bijiuni/volume_measure/blob/master/resolution.m)

Read the images using MATLAB. In the MATLAB environment, select one ultrasound image to
calculate its pixel resolution.

Since all images have pixels dimension (y*x)
=356*488 (appendix 1.3) and an actual depth of
45mm, the resolution is given as 45/356 = 0.126mm.

[hilbert](https://github.com/bijiuni/volume_measure/blob/master/hilbert.m)

In medical imaging, the signal
amplitude is displayed. In ultrasound imaging, the imaging mode that displays the ultrasound
signal amplitude is called B-mode, where B stands for brightness. Retrieve and
display the brightness of the Hilbert-transformed data

[volume](https://github.com/bijiuni/volume_measure/blob/master/volume.m)

The ground truth volume is derived from
the mold design from Sketchup, given as
2749.963mm 3 .

![groud truth](https://github.com/bijiuni/volume_measure/blob/master/ground_truth.png)

Assuming the phantom as a half ellipsoid,
volume=4/3*pi*abc/2; Area of ellipse=pi*ab
Volume=4/3*pi*abc/2 = 4/3 *c *area/2
=1762.242793mm 3
The result is smaller than the ground truth with an
error of -35.9%. Boundary tracing using matlab is
also tried instead of using imageJ. However a clear
boundary cannot be determined.


## Clinical Measurement

The clinical measurement will be much harder due to several reasons.

In order to tackle these difficulties, real-time 3D echocardiography will be used instead of 2D echocardiography in clinical situation. First of all, it is free from IP error because during scanning, the whole objects can be scanned through at different orientations and only the acquisition of a single volume is required, thus there will not be the problems of improper planes to be imaged. Besides, since a large number of cross sections is imaged, ample planes can be taken account for volume calculation (summation of multiplying the appropriate cross-sectional areas with the section thickness) so that the reliance on geometric assumption can be reduced. As a result, GA error will be small.



## Authors

* **Zach Lyu (Software Part)** - [bijiuni](https://github.com/bijiuni)
Gwinky Yip


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Other group mates: Darren Chu
