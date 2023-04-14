n=7
Mat=[ones(length(id.X),1)]

for i=1:n-1
    Mat=[Mat, id.X'.^i]
end

