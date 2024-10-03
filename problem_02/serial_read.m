% Primeiramente, configurar o ambiente chamando o arquivo setup.m
setup; % Isso irá chamar setup.m

% Set up the serial port communication
port = "/dev/ttyUSB0";
baud_rate = 9600;
serial_obj = serialport(port, baud_rate);

% Set a read timeout
set(serial_obj, "Timeout", 1); % 1 seconds timeout for reading

% Start reading the data
disp("Starting to read from serial port...");

try
    while true
        % Read a line from the serial port
        serial_line = readline(serial_obj);

        % Convert the string to a numerical value (voltage)
        voltage_value = str2double(serial_line);

        % Check if the conversion was successful
        if ~isnan(voltage_value)
            % Display the voltage value
            fprintf("Voltage: %.4f V\n", voltage_value);
        else
            fprintf("Received non-numeric data: %s\n", serial_line);
        end
    end
catch e
    % Clean up the serial object on error or interruption
    disp("An error occurred or stopped manually.");
    disp(e.message);
    clear serial_obj;
end

% Cleanup after reading is done
clear serial_obj;
disp("Finished reading from serial port.");
