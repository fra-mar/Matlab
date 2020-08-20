% Learn how to buil and manage tables.

'Import data from density_GDP Spain in this folder...'

    
% use this format [Region,OutageTime,Loss] = readvars('outages.csv');
% whos Region OutageTime Loss

[index,region,density,GDP]=readvars('Spain_density_GDP.csv');

%similar format with xls -look documentation for readvars use

%% Create table
% You can use import data buttom or...

T=table (region, density);

%Create a table and asign different column (var) names

T_varsname= table (region, density, 'VariableNames', {'R','D'})

%% Finding a row
%
density_cantabria= T(6,2)  

%or
row_cantabria= T.region == string('Cantabria');  %strings cells need be converted to just strings
density_cantabria_2=T(row_cantabria, 'density')

%or...something similar to Cantabria...
row_likecantabria= contains (T.region, 'abria'); % contains (string, pattern you are interested in)
density_cantabria_3= T(row_likecantabria, 'density')

%Create a table using region as index (times/dates as index below
T_index_region= table (density, 'RowNames',region);

%% Sort T


T_sorted= sortrows(T, 'density');

%% %select regions with population density between 100 and 200
rows = (T.density <300 & T.density >100);
%Output is a logical array (true false)
%to select the actual rows...
T_selected_density = T(rows,:)  ;  %...like (row,column)

%% Create a timetable

%First import suitable table with import data buttom or...

fhm=readtable ( 'FHM_covid.xlsx','Sheet','Antal per dag region')
%look doc readtable for thousands options when reading table

%from arrays...
Date = fhm.Statistikdatum;    %datetime array
Uppsala = fhm.Uppsala ;         %array
Stockholm = fhm.Stockholm ;


Uppsala_tt= timetable (Date, Uppsala, Stockholm) %First variable becomes RowTime




%% Create a figure with a table
%ui = user interface, i.e. as in an app. Look uitable in doc
f = figure;
t = uitable('Data',[2 3 4; 5 6 7]);
t.FontSize = 9;







