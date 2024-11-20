```octave
function y = generateSignal(total_samples, fs)
    t = (1:total_samples) / fs;
    y = cos(2 * pi * 100 * t) + 3 * cos(2 * pi * 250 * t) + ...
        5 * cos(2 * pi * 750 * t) + 7 * cos(2 * pi * 1000 * t);
endfunction
```
