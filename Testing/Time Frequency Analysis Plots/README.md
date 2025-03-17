# Time Frequency Analysis Graphing 

## Problem 

When Graphing the Power vs. Frequency graph, the complex part is neglected. For better representation and accuracy of the data, should we only graph the real part of the data, or should we take the magnitude of the power data? 

## Testing Data 

- subject: 27 
- bandpass filtering: 0.2 - 39 Hz 
- noise removal: 60 Hz 

## Observation 

### Testing 1

When using the subplot function, it somehow produced an obscure graph in the complex plane that had never happened before. 

### Testing 2

When using the tiledlayout function, it only graphs the real part of the data, and a warning message was prompted to the console (like it was before). The graph is just symmetrical over the x-axis with only the real part of the data. However, the graph of the magnitude of the power is just the graph of the upper half of the real number graph with a doubled-layer, theoretically.  

## Conclusion 

Since the graph in the complex plane is hard to interpret, and the real-number graph is just a symmetrical graph with a warning, we should take the magnitude of the complex data. 
 
