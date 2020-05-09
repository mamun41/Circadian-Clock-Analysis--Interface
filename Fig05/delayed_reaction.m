function D = delayed_reaction(t,del,x)
D = [];
D = x(find(t < x & x <= (t+del)));
end
