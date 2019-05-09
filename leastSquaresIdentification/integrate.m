function theta = integrate(t,tau,u,y)
    tau = floor(tau);
    yn = zeros(t,1);
    un = zeros(t-tau,1);
    
    for t1 = 1:1:t
         yn(t1) = y(t1);
    end
    
    for t1 = 1:1:t-tau
         un(t1) = u(t1);
    end
    
    y1 = trapz(yn);
    u1 = trapz(un);
    y2 = trapz(cumtrapz(yn));
    u2 = trapz(cumtrapz(un));
    
    theta = [-y1 -y2 u1 u2];
end


