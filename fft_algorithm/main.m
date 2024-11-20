% Initialize interactionsTable as a cell array for mixed data types
interactionsTable = {};

% Define sample sizes and corresponding padding indices
sampleSizes = [32, 64, 128, 256, 512, 1024];
figureIDs = 0;

% Loop through each sample size and perform the analysis
for index = 1:length(sampleSizes)
    sampleSize = sampleSizes(index);

    % Perform function analysis
    [totalOps, paddingOps] = functionAnalysis(sampleSize, figureIDs + 1, figureIDs + 2);
    figureIDs += 2;

    % Populate the interactionsTable
    interactionsTable{2 * index - 1, 1} = sprintf("%d Samples", sampleSize);
    interactionsTable{2 * index - 1, 2} = totalOps(1);
    interactionsTable{2 * index - 1, 3} = totalOps(2);
    interactionsTable{2 * index - 1, 4} = totalOps(3);
    interactionsTable{2 * index - 1, 5} = totalOps(4);

    interactionsTable{2 * index, 1} = sprintf("%d Samples + %d 0s right padding", sampleSize, sampleSize);
    interactionsTable{2 * index, 2} = paddingOps(1);
    interactionsTable{2 * index, 3} = paddingOps(2);
    interactionsTable{2 * index, 4} = paddingOps(3);
    interactionsTable{2 * index, 5} = paddingOps(4);
end
