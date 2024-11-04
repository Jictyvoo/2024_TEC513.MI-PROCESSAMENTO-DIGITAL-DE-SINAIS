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

    run = true;
    while run
        run = false;
        flushinput(serial_file);
        [Fs, totalSamplings, resultData] = serialRead(serial_file, 3000);
        voltageData = resultData * 5/1023;
        maxTime = (length(resultData) - 1) / Fs;
        time = [0:1 / Fs:maxTime]; %tamanhos do dominio normalizado

        figure(1); %cria uma figura
        subplot(3, 1, 1); %plotando as figuras
        plot(time, voltageData), axis([0 maxTime 0 5])%plota as amostras interpoladas
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

        figure(2);
        signalAnalysis(voltageData, Fs);
        % Sleep a seconds
        pause(3);
    endwhile


% Cleanup after reading is done
disp("Finished reading from serial port.");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLOSE READ FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear serial_file;
