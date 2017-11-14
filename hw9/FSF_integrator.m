function [K, ki, CC1, A1, B1, C1] = FSF_integrator(A,B,Cr,desired_poles)
    % Augment the system
    n = size(A,1);
    A1 = zeros(n+1);
    B1 = zeros(n+1,1);
    C1 = zeros(1,n+1);
    A1(1:n,1:n) = A;
    A1(n+1,1:n) = -Cr;
    B1(1:n,1) = B;
    C1(1,1:n) = Cr;    
    
    % Check controllability
    n = size(A1,1);
    CC1 = zeros(n);
    for i = 0:n-1
        CC1(1:n-1,i+1) = A^n*B;
    end
    for i = 1:n-1
        CC1(n,i) = -Cr*(A^n*B);
    end
    
    % Find gains
    K1 = place(A1,B1,desired_poles);
    K = K1(1:n-1);
    ki = K1(n);
end