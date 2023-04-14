function [x_mic] = MatrixN(n,X)
x_mic=1
    for i=1:n-1
        x_mic=[x_mic, X'.^i]
    end
end

