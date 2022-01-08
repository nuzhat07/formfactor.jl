
function fun(n1,l1,m1,a1,n2,l2,a2,q,k,k1,l)
	m = 0 # for this special case m = m1-m2=0.
	n = n1-l1-1
	#m2 = m1
	γ = l1+l2+k+3/2
	δ = (a2/a1*n2 + n1)/(n1*n2*a2/a1)
	β = 2/n1
	α = 2*l1+1
	ν = l+1/2
	aa = (ν+γ+k1+1)/2
	bb = (ν+γ+k1+2)/2
	cc = 1+ν
	dd = -q^2/δ^2
	N1 = (-1)^(m1+m)*2^(2+l1+l2)/((a2/a1)^(3/2+l2)*n1^(2+l1)*n2^(2+l2))*√(pi/(2*q))*√((2*l1+1)*(2*l2+1)*factorial(n1+l1)*factorial(n2+l2)*factorial(n1-l1-1)/factorial(n2-l2-1)) #*kron(m,0)
	Il = (-β)^k1*gamma(ν+γ+k1+1)/(factorial(k1)*gamma(n-k1+1)*gamma(α+k1+1)*δ^(ν+γ+k1+1))*_₂F₁(aa,bb,cc,dd)
	Al = (1im)^l*(-2*a1/(n2*a2))^k*(q/2)^ν*(2*l+1)/(gamma(ν+1)*factorial(k)*factorial(2*l2+k+1))*wigner3j(l1, l2, l, 0, 0, 0)*wigner3j(l1, l2, l, m1, -m1, -m)
	return N1*Il*Al
end

function form(n1::Int64,l1::Int64,m1::Int64,a1,n2::Int64,l2::Int64,a2,q::Float64)
	Sum = 0
	for p in range(abs(l1-l2),l1+l2)
		for i in range(0,n2-l2-1)
			for j in range(0,n1-l1-1)
				Sum += fun(n1,l1,m1,a1,n2,l2,a2,q,i,j,p)
			end
		end
	end
	return Sum
end
