function hx = sigmoid(x, W)
hx = 1./(1+exp(-x*W));
end