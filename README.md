# wave_image
Wave Image.
Whit flutter Wave image you can have a simple circular image with wave and some customization.

<img src="https://user-images.githubusercontent.com/26311171/137097350-f4491635-93fa-4008-a8b6-fbb69b29e82a.gif" width="250" />

| Property | Description |
| --- | --- |
| `imageUrl` | profile or image url (online) |
| `speed` | speed of wave. it's milliseconds |
| `imageSize` | size of circle image |
| `boarderColor` | color of border |
| `waveColor` | color of wave color  |
| `boarderWidth` | with of border. most : boarderWidth >= 0  |
| `radius` | radius should nigger or equal [imageSize]  |

Usage
-----

```dart
  WaveImage(
          boarderColor: Colors.red,
          boarderWidth: 1,
          imageSize: 100,
          imageUrl:
              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
          radius: 150,
          speed: 1000,
          waveColor: Colors.green,
  )
```