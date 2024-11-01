    function [Fs, totalSamplings, resultData] = serialRead(serialFile)
        lastValue = [];

        % Do a single reading on serial file, while waits to receive the sampling frequency amount
        while (true)
            currentRead = fread(serialFile, 1);
            if currentRead == 10% \n
                lastValue = [];
                continue
            endif
            lastValue(:, end + 1) = currentRead;
            % Display the current value of lastValue
            if currentRead == 59 && length(lastValue) > 5
                disp(['Start to read parts']);

                % Remove the semicolon for further processing
                lastValue = lastValue(1:end - 1);

                % Split the string by the colon ':'
                parts = strsplit(char(lastValue), ':');

                % Convert the parts into numeric values
                Fs = str2double(parts{1});
                totalSamplings = str2double(parts{2});
                break;
            endif
        end

        tic; %captura do tempo inicial
        % Start to read all samples
        disp(['Trying to get samples ', mat2str(totalSamplings)]);
        data = fread(serialFile, totalSamplings, 'uint8');

        %hold on; %mantem as amostras anteriores
        raw = [];
        raw = cat(2, raw, data); %armazena o dado bruto (raw = sem processamento)
        x = char(raw); %converte em carateres os dados recebidos
        resultData = str2num(x); %string de carateres em números
        resultData = resultData(1:end - 10);
    end
