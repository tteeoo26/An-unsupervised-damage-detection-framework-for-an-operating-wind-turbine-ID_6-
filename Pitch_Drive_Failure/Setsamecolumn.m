
function [table2] = Setsamecolumn(table1,table2)
if width(table1) == width(table2)
    
    table2=table2;
    % Call your analysis function here
    % result = yourAnalysisFunction(table1, table2);
else
    % Identify missing columns in table2
    missingColumns = setdiff(table1.Properties.VariableNames, table2.Properties.VariableNames);
    
    % Initialize missing columns in table2 with zeros
    for i = 1:length(missingColumns)
        randomArrayData = arrayfun(@(x) {rand(1, 1000)'}, (1:height(table2))');
        table2.(missingColumns{i}) = randomArrayData;
    end
    
    % Reorder columns in table2 to match table1
    table2 = table2(:, table1.Properties.VariableNames);
    
   
    % Call your analysis function here
    % result = yourAnalysisFunction(table1, table2);
end