function bodePlot(figIdx, b, a)
    % Create the transfer function from the numerator and denominator coefficients
    H = tf(b, a); % Create a transfer function object from b and a

    % Create the Bode plot
    figure(figIdx);
    clf;

    % Plot using the bode function from Octave's control package
    bode(H);
    grid on;

    % Set plot title and labels
    title('Bode Plot');
end
