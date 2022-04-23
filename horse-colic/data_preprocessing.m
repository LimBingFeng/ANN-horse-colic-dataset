%{
miising value threshold = 40%

categorical -  impute by mode
continuous - impute by median

Normalization - norm method

Balancing - ROSE in R
%}
%%
%input data horsecolictest
% Initialize variables.
filename = 'horsecolictest.test';
delimiter = ' ';

% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

% Open the text file.
fileID = fopen(filename,'r');

% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

%Close the text file.
fclose(fileID);

% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^[-/+]*\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

% Create output variable
horsecolictest = table;
horsecolictest.VarName1 = cell2mat(raw(:, 1));
horsecolictest.VarName2 = cell2mat(raw(:, 2));
horsecolictest.VarName3 = cell2mat(raw(:, 3));
horsecolictest.VarName4 = cell2mat(raw(:, 4));
horsecolictest.VarName5 = cell2mat(raw(:, 5));
horsecolictest.VarName6 = cell2mat(raw(:, 6));
horsecolictest.VarName7 = cell2mat(raw(:, 7));
horsecolictest.VarName8 = cell2mat(raw(:, 8));
horsecolictest.VarName9 = cell2mat(raw(:, 9));
horsecolictest.VarName10 = cell2mat(raw(:, 10));
horsecolictest.VarName11 = cell2mat(raw(:, 11));
horsecolictest.VarName12 = cell2mat(raw(:, 12));
horsecolictest.VarName13 = cell2mat(raw(:, 13));
horsecolictest.VarName14 = cell2mat(raw(:, 14));
horsecolictest.VarName15 = cell2mat(raw(:, 15));
horsecolictest.VarName16 = cell2mat(raw(:, 16));
horsecolictest.VarName17 = cell2mat(raw(:, 17));
horsecolictest.VarName18 = cell2mat(raw(:, 18));
horsecolictest.VarName19 = cell2mat(raw(:, 19));
horsecolictest.VarName20 = cell2mat(raw(:, 20));
horsecolictest.VarName21 = cell2mat(raw(:, 21));
horsecolictest.VarName22 = cell2mat(raw(:, 22));
horsecolictest.VarName23 = cell2mat(raw(:, 23));
horsecolictest.VarName24 = cell2mat(raw(:, 24));
horsecolictest.VarName25 = cell2mat(raw(:, 25));
horsecolictest.VarName26 = cell2mat(raw(:, 26));
horsecolictest.VarName27 = cell2mat(raw(:, 27));
horsecolictest.VarName28 = cell2mat(raw(:, 28));

%Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;
%% 
%import horsecolictrain
% Initialize variables.
filename = 'horsecolictrain.data';
delimiter = ' ';

% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%Open the text file.
fileID = fopen(filename,'r');

% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string',  'ReturnOnError', false);

% Close the text file.
fclose(fileID);

% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^[-/+]*\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

% Create output variable
horsecolictrain = table;
horsecolictrain.VarName1 = cell2mat(raw(:, 1));
horsecolictrain.VarName2 = cell2mat(raw(:, 2));
horsecolictrain.VarName3 = cell2mat(raw(:, 3));
horsecolictrain.VarName4 = cell2mat(raw(:, 4));
horsecolictrain.VarName5 = cell2mat(raw(:, 5));
horsecolictrain.VarName6 = cell2mat(raw(:, 6));
horsecolictrain.VarName7 = cell2mat(raw(:, 7));
horsecolictrain.VarName8 = cell2mat(raw(:, 8));
horsecolictrain.VarName9 = cell2mat(raw(:, 9));
horsecolictrain.VarName10 = cell2mat(raw(:, 10));
horsecolictrain.VarName11 = cell2mat(raw(:, 11));
horsecolictrain.VarName12 = cell2mat(raw(:, 12));
horsecolictrain.VarName13 = cell2mat(raw(:, 13));
horsecolictrain.VarName14 = cell2mat(raw(:, 14));
horsecolictrain.VarName15 = cell2mat(raw(:, 15));
horsecolictrain.VarName16 = cell2mat(raw(:, 16));
horsecolictrain.VarName17 = cell2mat(raw(:, 17));
horsecolictrain.VarName18 = cell2mat(raw(:, 18));
horsecolictrain.VarName19 = cell2mat(raw(:, 19));
horsecolictrain.VarName20 = cell2mat(raw(:, 20));
horsecolictrain.VarName21 = cell2mat(raw(:, 21));
horsecolictrain.VarName22 = cell2mat(raw(:, 22));
horsecolictrain.VarName23 = cell2mat(raw(:, 23));
horsecolictrain.VarName24 = cell2mat(raw(:, 24));
horsecolictrain.VarName25 = cell2mat(raw(:, 25));
horsecolictrain.VarName26 = cell2mat(raw(:, 26));
horsecolictrain.VarName27 = cell2mat(raw(:, 27));
horsecolictrain.VarName28 = cell2mat(raw(:, 28));

% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;
%%
%combining two datasets
data = [horsecolictrain;horsecolictest];

%Declare colnames
colnames ={'surgery','age', 'hosptal_number','rectal_temp','pulse','rr',...
    'extremities_temp','pp','mm','crt','pain','peristalsis','ad','nt',...
    'nr','nrph','re','abdomen','pcv','tp','aa','atp','outcome','sl',...
    'tol1', 'tol2', 'tol3','cp'} ;

%Assign colnames to the datasets
data.Properties.VariableNames = colnames;

%%
%Missing value percentage
missingPercentage = sum((ismissing(data)/height(data))*100);

%set missing value threshold to 40%
NA_threshold = 40;

%deleting column with missing greater than threshold
data(:,missingPercentage > NA_threshold) =[]; %nrph , aa , atp are removed

%remove unimportant column
data(:,{'hosptal_number','tol1','tol2','tol3','cp'}) = [];


%%

%Categorical and continuos variables
cat = {'surgery','age','extremities_temp','pp','mm','crt','pain',...
    'peristalsis','ad','nt','nr','re','abdomen','outcome','sl'} ;
con = {'rectal_temp','pulse','rr','pcv','tp'};

%age is with 1 and 9 changing to 1 and 2 only
data.age(data.age == 9) = 2;


%check oulier position

%Applies the generalized extreme Studentized deviate (gesd) test for outliers. 
%This iterative method is similar to 'grubbs', but can perform better when 
%there are multiple outliers masking each other.
rectal_temp_outlier = isoutlier(data(:,con(1)),'gesd');
pulse_outlier = isoutlier(data(:,con(2)),'gesd');
rr_outlier = isoutlier(data(:,con(3)),'gesd');
pcv_outlier = isoutlier(data(:,con(4)),'gesd');
tp_outlier = isoutlier(data(:,con(5)),'gesd');

%set outlier to missing value
data.rectal_temp(rectal_temp_outlier) = NaN;
data.pulse(pulse_outlier) = NaN;
data.rr(rr_outlier) = NaN;
data.pcv(pcv_outlier) = NaN;
data.tp(tp_outlier) = NaN;

%%
%impute missing value

%impute continuous missing value using MEDIAN
data.rectal_temp=fillmissing(data.rectal_temp, 'constant', median(data.rectal_temp, 'omitnan'));
data.pulse =fillmissing(data.pulse, 'constant', median(data.pulse, 'omitnan'));
data.rr =fillmissing(data.rr, 'constant', median(data.rr, 'omitnan'));
data.pcv =fillmissing(data.pcv, 'constant', median(data.pcv, 'omitnan'));
data.tp =fillmissing(data.tp, 'constant', median(data.tp, 'omitnan'));

%impute categorical missing value using MODE
surgery_mode = mode(data.surgery);
age_mode = mode(data.age);
extremities_temp_mode = mode(data.extremities_temp);
pp_mode = mode(data.pp);
mm_mode = mode(data.mm);
crt_mode = mode(data.crt);
pain_mode = mode(data.pain);
peristalsis_mode = mode(data.peristalsis);
ad_mode = mode(data.ad);
nt_mode = mode(data.nt);
nr_mode = mode(data.nr);
re_mode = mode(data.re);
abdomen_mode = mode(data.abdomen);
outcome_mode = mode(data.outcome);
sl_mode = mode(data.sl);

data.surgery =fillmissing(data.surgery, 'constant', surgery_mode);
data.age =fillmissing(data.age, 'constant', age_mode);
data.extremities_temp =fillmissing(data.extremities_temp, 'constant', extremities_temp_mode);
data.pp =fillmissing(data.pp, 'constant', pp_mode);
data.mm =fillmissing(data.mm, 'constant', mm_mode);
data.crt =fillmissing(data.crt, 'constant', crt_mode);
data.pain =fillmissing(data.pain, 'constant', pain_mode);
data.peristalsis =fillmissing(data.peristalsis, 'constant', peristalsis_mode);
data.ad =fillmissing(data.ad, 'constant', ad_mode);
data.nt =fillmissing(data.nt, 'constant', nt_mode);
data.nr =fillmissing(data.nr, 'constant', nr_mode);
data.re =fillmissing(data.re, 'constant', re_mode);
data.abdomen =fillmissing(data.abdomen, 'constant', abdomen_mode);
data.outcome =fillmissing(data.outcome, 'constant', outcome_mode);
data.sl =fillmissing(data.sl, 'constant', sl_mode);


%%
%Data Normalizations
data.rectal_temp = normalize(data.rectal_temp,'norm');
data.pulse = normalize(data.pulse,'norm');
data.rr = normalize(data.rr,'norm');
data.pcv = normalize(data.pcv,'norm');
data.tp = normalize(data.tp,'norm');


%writetable(data,'imbalanced.csv')

%%
%Data Balancing is done in R