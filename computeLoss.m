function loss = computeLoss(virtualDistance, frequency)
    c = 3e8;
    loss = 20 * log(4 * pi() * virtualDistance * frequency / c);
end