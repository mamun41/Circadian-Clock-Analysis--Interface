function y=hillA(x,n,ec50)
y=(x.^n)./((x.^n)+(ec50.^n));
