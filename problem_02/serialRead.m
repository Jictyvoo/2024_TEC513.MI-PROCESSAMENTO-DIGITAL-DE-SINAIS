    function [Fs, totalSamplings, resultData] = serialRead(serialFile)
        lastValue = '\n';

        % Do a single reading on serial file, while waits to receive the sampling frequency amount
        while (true)
            lastValue = fread(serialFile);
            lastValue = char(lastValue);
            inputSize = size(lastValue);
            % Display the current value of lastValue
            disp(['Read value: {', lastValue, '}', char(inputSize)]);

            if inputSize > 0 && strcmp(lastValue(end-1:end), ';\n')
                disp(['Start to read parts']);

                % Remove the semicolon for further processing
                lastValue = lastValue(1:end - 1);

                % Split the string by the colon ':'
                parts = strsplit(lastValue, ':');
 
                % Convert the parts into numeric values
                Fs = str2double(parts{1});
                totalSamplings = str2double(parts{2});
                break;
            end
        end

        tic; %captura do tempo inicial
        % Start to read all samples
        disp(['Trying to get samples', totalSamplings]);
        data = fread(serialFile, totalSamplings, 'uint8');

        hold on; %mantem as amostras anteriores
        raw = cat(2, raw, data); %armazena o dado bruto (raw = sem processamento)
        x = char(raw); %converte em carateres os dados recebidos
        resultData = str2num(x); %string de carateres em números
    end
