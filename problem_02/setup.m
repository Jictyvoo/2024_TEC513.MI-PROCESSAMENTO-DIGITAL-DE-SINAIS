% setup.m - Install and load required packages for the project

% List of required packages
required_packages = {'instrument-control'};

% Check if the package is installed
for i = 1:length(required_packages)
    pkg_name = required_packages{i};

    % Check if the package is installed
    pkg_info = pkg('list', pkg_name);

    % If the package is not installed, install it
    if isempty(pkg_info)
        fprintf('Installing package: %s...\n', pkg_name);
        pkg('install', '-forge', pkg_name);
    end

    % Load the package
    fprintf('Loading package: %s...\n', pkg_name);
    pkg('load', pkg_name);
end

fprintf('All required packages are installed and loaded.\n');
