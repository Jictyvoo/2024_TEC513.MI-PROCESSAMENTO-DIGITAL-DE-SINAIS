% Primeiramente, configurar o ambiente chamando o arquivo setup.m
setup; % Isso irá chamar setup.m

% Set up the serial port communication
port = "/dev/ttyUSB0";
baud_rate = 2000000;
serial_file = serialport(port, baud_rate);
flushinput(serial_file);
%set(serial_file, 'bytesize', 8); %8 bits de dados
set(serial_file, "Timeout", 1); % 1 seconds timeout for reading
pause(1); %espera 1 segundo antes de ler dado

% Start reading the data
disp("Starting to read from serial port...");

try
    while true
        [Fs, totalSamplings, resultData] = serialRead(serial_file)
        figure(1); %cria uma figura
        time = [(0:1:length(resultData) - 1) / fs]; %tamanhos do dominio normalizado

        subplot(3, 1, 1); %plotando as figuras
        plot(time, resultData * 5/1023)%plota as amostras interpoladas
        xlabel('t(s)');
        title('Sinal gerado x(t)');
        subplot(3, 1, 2);
        stem(resultData); %plota a janela de amostras
        xlabel('n');
        title('x[n]');
        subplot(3, 1, 3);
        stairs(resultData); %plota a janela de amostras reguradas
        xlabel('n');
        title('x[n] segurado');
    end
catch e
    % Clean up the serial object on error or interruption
    disp("An error occurred or stopped manually.");
    disp(e.message);
    clear serial_file;
end

% Cleanup after reading is done
clear serial_file;
disp("Finished reading from serial port.");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLOSE READ FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fclose(serialFile);