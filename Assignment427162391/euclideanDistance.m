function distance = euclideanDistance(pointA, pointB)

[dim1, dim2] = size(pointA);
if(dim2>dim1)
    distance = (pointA - pointB)*(pointA - pointB)';
else
    distance = (pointA - pointB)'*(pointA - pointB);
end

end