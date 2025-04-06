# Time-Frequency Analysis Graphing

## Problem:
While graphing Power vs. Frequency, the complex component of the data is often neglected. To improve data representation and accuracy, the question arises: Should we graph only the real part of the data, or should we plot the magnitude of the complex power data?

## Testing Data:
- **Subject**: 27
- **Bandpass Filtering**: 0.2 - 39 Hz
- **Noise Removal**: 60 Hz

## Observations:

### Testing 1:
When using the `subplot` function, an unusual graph was generated in the complex plane, which had never occurred before. The resulting plot was unclear and difficult to interpret.

### Testing 2:
When using the `tiledlayout` function, only the real part of the data was plotted. A warning was also displayed in the console, similar to previous instances. This resulted in a graph that was symmetrical about the x-axis, showing only the real part of the data. The graph of the magnitude of the power was equivalent to the upper half of the real part of the graph, but with a doubled-layer structure, as theoretically expected.

## Conclusion:
Since interpreting the graph in the complex plane is challenging, and the real-part graph merely duplicates over the x-axis with a warning, it is better to use the magnitude of the complex data. This approach provides a clearer and more meaningful representation of the power data.

## Key Improvements:
- **Clarity**: The problem is now framed more clearly, highlighting the decision between plotting the real part vs. the magnitude of the complex data.
- **Structure**: Observations are numbered, making the testing phases easier to follow.
- **Conciseness**: The text is more direct, reducing unnecessary complexity in the explanation.
- **Logical flow**: The conclusion directly follows from the observations, strengthening the argument for using magnitude over real parts.

