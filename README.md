# Digital Filter Design and Analysis

This script designs and analyzes two types of digital filters: an IIR (Infinite Impulse Response) filter using the Butterworth design and an FIR (Finite Impulse Response) filter using the Kaiser window. The frequency responses of both filters are calculated and plotted on the same graph for comparison. The filters are designed for an audio signal with a sampling frequency of 16 kHz, and the plots visualize the magnitude response in decibels.

## Filter Design

### 1. **IIR Filter (Butterworth)**
- The Butterworth IIR filter is designed with a 4th order.
- The passband is defined between 30 Hz and 7300 Hz.
- The filter is designed using the `butter` function, and its amplitude response is calculated using `freqz`.
  
### 2. **FIR Filter (Kaiser Window)**
- The FIR filter is designed using the Kaiser window method with an order of 128.
- The passband is defined between 0 Hz and 7250 Hz.
- The Kaiser window parameter (`beta`) is set to 8 to achieve good sidelobe attenuation and sharp frequency response transitions.
- The filter is designed using the `fir1` function, and its amplitude response is calculated using `freqz`.

## Functionality

- The script calculates the magnitude response (in decibels) for both the IIR and FIR filters.
- The magnitude responses of both filters are plotted on the same graph for comparison, with:
  - The IIR filter shown in **blue**.
  - The FIR filter shown in **red**.
  
- The frequency response is computed over `N = 1024` points, with the sampling frequency set to `fs = 16000 Hz`.

## Visualization

- The script generates a plot showing the amplitude response in decibels of both filters.
- The x-axis represents the frequency in Hz, and the y-axis represents the magnitude in decibels.
- A legend differentiates the two filters.
- The plot includes grid lines for better readability.

## Parameters

- **Sampling Frequency (fs)**: 16000 Hz (audio standard)
- **Number of Frequency Points (N)**: 1024
- **IIR Filter (Butterworth)**:
  - **Order**: 4
  - **Passband**: 30 Hz to 7300 Hz
- **FIR Filter (Kaiser Window)**:
  - **Order**: 128
  - **Passband**: 0 Hz to 7250 Hz
  - **Kaiser Window Beta**: 8

## Plot Details

The script generates a single figure with the following elements:
- **IIR Filter (Butterworth)**: Plotted in blue.
- **FIR Filter (Kaiser Window)**: Plotted in red.
- **Title**: "Amplitude Response of IIR (Butterworth) and FIR (Kaiser Window) Filters"
- **X-axis Label**: "Frequency (Hz)"
- **Y-axis Label**: "Magnitude (dB)"
- **Legend**: To differentiate the two filter responses.
- **Grid**: Enabled for easier analysis of the graph.

## Dependencies

This script requires MATLAB with the following functions:
- `butter` (for designing the Butterworth filter)
- `fir1` (for designing the FIR filter)
- `freqz` (for calculating the frequency response)
- `kaiser` (for generating the Kaiser window)

## License

This script is provided under the [MIT License](LICENSE).
