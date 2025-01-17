# Digital Filter Design and Analysis

This script designs and analyzes two types of digital filters: an IIR (Infinite Impulse Response) filter using the Butterworth design and an FIR (Finite Impulse Response) filter using the Kaiser window. Additionally, the script generates a test signal with aliasing effects and white noise, then applies the filters to the signal. The frequency responses of both filters are calculated and plotted on the same graph for comparison, and the filtered signals are visualized in both the frequency and time domains.

## Filter Design

### 1. **IIR Filter (Butterworth)**
- **Filter Type**: 4th-order Butterworth IIR filter.
- **Passband**: 30 Hz to 7300 Hz.
- **Design Method**: The filter is designed using the `butter` function, and its frequency response is calculated using `freqz`.

### 2. **FIR Filter (Kaiser Window)**
- **Filter Type**: FIR filter designed using the Kaiser window method.
- **Order**: 128.
- **Passband**: 0 Hz to 7250 Hz.
- **Kaiser Window Parameter**: `beta = 8` to achieve good sidelobe attenuation and sharp frequency response transitions.
- **Design Method**: The filter is designed using the `fir1` function, and its frequency response is calculated using `freqz`.

## Functionality

- The script calculates and compares the magnitude response (in decibels) for both the IIR and FIR filters.
- It generates a test signal containing aliasing and noise, applies both the IIR and FIR filters, and visualizes the results.
  - The **original signal** with aliasing and noise.
  - The **signal filtered by the IIR filter**.
  - The **signal filtered by the FIR filter**.

## Visualization

- **Power Spectral Density (PSD) Plot**: The script generates a figure with three subplots:
  - **Original Signal**: The PSD of the original signal with aliasing and noise.
  - **IIR Filtered Signal**: The PSD of the signal after applying the IIR filter.
  - **FIR Filtered Signal**: The PSD of the signal after applying the FIR filter.
  
- **Amplitude Response Plot**: A plot comparing the amplitude responses of the IIR (Butterworth) and FIR (Kaiser Window) filters on the same graph:
  - The IIR filter's response is shown in blue.
  - The FIR filter's response is shown in red.

## Parameters

- **Sampling Frequency (fs)**: 16000 Hz (audio standard).
- **Number of Frequency Points (N)**: 1024.
- **IIR Filter (Butterworth)**:
  - **Order**: 4.
  - **Passband**: 30 Hz to 7300 Hz.
- **FIR Filter (Kaiser Window)**:
  - **Order**: 128.
  - **Passband**: 0 Hz to 7250 Hz.
  - **Kaiser Window Beta**: 8.
- **Test Signal**:
  - Contains sine waves at 100 Hz, 6000 Hz, and 12000 Hz (with aliasing at 7000 Hz).
  - White Gaussian noise with a level of 10% of the signal amplitude.

## Plot Details

- **Time Domain Signal Plot**:
  - **Original Signal**: Plotted in black.
  - **Signal Filtered with IIR (Butterworth)**: Plotted in blue.
  - **Signal Filtered with FIR (Kaiser Window)**: Plotted in red.
  - Each plot has labeled axes for time (s) and amplitude.

- **Frequency Response Plot**:
  - Amplitude responses of the IIR (Butterworth) and FIR (Kaiser Window) filters.
  - The IIR filter response is shown in blue, and the FIR filter response is shown in red.

## Dependencies

This script requires MATLAB with the following functions:
- `butter` (for designing the Butterworth filter).
- `fir1` (for designing the FIR filter).
- `freqz` (for calculating the frequency response).
- `kaiser` (for generating the Kaiser window).
- `randn` (for generating white Gaussian noise).
- `pwelch` (for calculating the power spectral density).

## License

This script is provided under the [MIT License](LICENSE).
