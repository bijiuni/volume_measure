# Volume Measurement by Ultrasound








# Volume Measurement by Ultrasound

The clinical significance of measuring the volume of left ventricle is that this can be used in the assessment of coronary artery diseases with infraction, vavular heart diseases and left ventricular hypertrophy.


## Running the tests

Seven parts of the program with sample code:

1. The program load the data
2. Plot the rawdata for comparison
3. Extract baseline and filter the raw data

```
baseline = sgolayfilt(Rawdata,4,2301);
filtered = Rawdata - baseline;
```

4. Plot filtered signal and its envelope
5. Find the max and min of the envelop

```
[maxv, maxi] = max(diffe);
hold on
plot(maxi,maxv, 'o');
diffe(1:maxi) = 500;
[minv, mini] = min(diffe);
hold on
```

6. Find where the maximal oscillation occurs

```
for i = 1:length(Rawdata)
temp = filtered(i);
if(temp>max && abs(prior-temp)<0.5)
max = temp;
index = i;
end
prior = temp;
end
```

7. Print out SP and DP with assumed ratios


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
