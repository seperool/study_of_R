#exercicios cap_2

#[1]
x = c(1,2,2)
y = c(1/2,1,1)
z = c(1/2,1,1)
M = cbind(x,y,z)
M
View(M)

#[2]
#media de x
mean(x)
#mediana de x
median(x)

#[3]
x1=cumsum(x)
x1
cor(x,x1)

#[4]
dim(M)

#[5]
eigen(M)

#[6]
n=8.799
floor(n)
ceiling(n)

#[7]
round(n,1)

#[8]
pol = c(-9,0,1)
pol
Re(polyroot(pol))

#[9]
diff(x)

#[10]
cumsum(z)
cumprod(y)
cummax(x)

#[11]
sd(x)
var(x)

#[12]
HC1=c(0,4,3)
HC2=c(8,1,5)
HC3=c(3,0,1)
H=cbind(HC1,HC2,HC3)
apply(H,2,mean)

#[13]
X=c(3,8,1,2.5)
Y=c(8,0,2)

union(X,Y)
intersect(X,Y)