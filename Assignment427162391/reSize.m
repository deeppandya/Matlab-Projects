function newChannel = reSize(newImg, rowNum, colNum)
newChannel = zeros(rowNum, colNum);
for i = 1:rowNum
    for j = 1:colNum
        newChannel(i,j) = newImg((i-1)*colNum + j);
    end
end
end